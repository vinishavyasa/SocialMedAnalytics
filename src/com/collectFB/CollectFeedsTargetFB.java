package com.collectFB;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import com.db.DBCon;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.MongoException;
import com.restfb.Connection;
import com.restfb.DefaultFacebookClient;
import com.restfb.FacebookClient;
import com.restfb.types.Page;
import com.restfb.types.Post;
import com.restfb.types.User;

public class CollectFeedsTargetFB {
	
	private DBCon dbCon = new DBCon();
	private DB db = dbCon.getConnection();
	DBCollection items;

	private final static String APP_ID = "796720897019252";
	private final static String SECRET = "3f81c89c3b008ebe83a2f77cff2178da";
	
	private final static String ACCESS_TOKEN="CAALUnQoNTXQBAIJaVQZAWn62eKs9qO2F9bDf0EZAA3aDIHt8FzCmZCfDoToDT5lKi2XAOo4xO0az6wcMp1a8bZAmWHqHy8pcQxQLrV0azcQVmHzlBi0zXC14yBIALQDtL0XjZC86YBuA982h2oa0UDKJcYawI7fmJH5BZCW5xEWqA7gfotzoBXBjbQdbbZAkJ4ZD";
	private static FacebookClient facebookClient ;//= new DefaultFacebookClient(ACCESS_TOKEN);

	private String[] targetLocations;
	
	public CollectFeedsTargetFB(String clientName) {
		
		facebookClient = new DefaultFacebookClient(ACCESS_TOKEN, SECRET);
		facebookClient.obtainExtendedAccessToken(APP_ID, SECRET, ACCESS_TOKEN);

		try {
			items = db.getCollection(clientName);
			BasicDBObject index = new BasicDBObject("tweet_text", 1);
			items.ensureIndex(index, new BasicDBObject("unique", true));

	        FileReader fileReader = new FileReader(System.getProperty("user.dir") + "/" + "Target-Locations.txt");
	        BufferedReader bufferedReader = new BufferedReader(fileReader);
	        List<String> lines = new ArrayList<String>();
	        String line = null;
	        while ((line = bufferedReader.readLine()) != null) {
	            lines.add(line);
	        }
	        bufferedReader.close();
	        targetLocations = lines.toArray(new String[lines.size()]);
	        
		} catch (MongoException ex) {
			System.out.println("MongoException :" + ex.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void createFBTableforClient(boolean loadRecords, String keyword) {
		System.out.println("Inside testingFB");

		User u1 = facebookClient.fetchObject("me", User.class);
		System.out.println("user is " + u1);
		
		Page page = facebookClient.fetchObject("target", Page.class);

		System.out.println("Page likes: " + page.getLikes());

		Connection<Post> myFeed = facebookClient.fetchConnection(keyword
				+ "/feed", Post.class);
		
			for (List<Post> myFeedConnectionPage : myFeed)
			for (Post post : myFeedConnectionPage) {
				/* Persons ID */
				String ID = post.getFrom().getId();
				//System.out.println("post_text: " + post.getMessage());
				
				
				BasicDBObject basicObj = new BasicDBObject();

				basicObj.put("user_name", post.getFrom().getName());
				basicObj.put("tweet_text", post.getMessage());
				basicObj.put("tweet_date", post.getCreatedTime());
				basicObj.put("Post_Person_ID", ID);

				User userq1 = facebookClient.fetchObject(ID, User.class);
				
				if (userq1.getGender() == null || userq1.getGender().length() == 0) {
					basicObj.put("Gender of person", getGender());
				} else {
					basicObj.put("Gender of person", userq1.getGender());
				}
				
				/* userq.getLocation() */
				if (post.getPlace() == null) {
					/*
					 * Location is not in basic profile, generating it if not available.
					 */
					String location = getTargetLocation();
					//System.out.println("location is " + location);
					basicObj.put("tweet_location", location);
				} else {
					String place = "";
					if (post.getPlace().getLocation() != null) {
						if (post.getPlace().getLocation().getCity() != null) {
							place = post.getPlace().getLocation().getCity();
						}
						if (post.getPlace().getLocation().getCountry() != null) {
							place = place + ", " + post.getPlace().getLocation().getCountry();
						}
					}
					basicObj.put("tweet_location", place);
				}
				/* System.out.println("EDU: "+userq.getEducation().get(0)); */
				basicObj.put("Birthday", userq1.getBirthday());

				try {
					items.insert(basicObj);
				} catch (Exception e) {
					System.out.println("MongoDB Connection Error : "
							+ e.getMessage());
				}
			}
	}

	private String getTargetLocation()
	{		
		Random rand = new Random();
		int  n = rand.nextInt(targetLocations.length);
		
		return targetLocations[n];
	}
	
	private String getGender()
	{
		Random rand = new Random();
		int n = rand.nextInt(2);
		
		if (n == 0) {
			return "Male";
		} else {
			return "Female";
		}
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new CollectFeedsTargetFB("TargetFacebook")
				.createFBTableforClient(true, "target");

	}


}
