package com.collectFB;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import com.db.DBCon;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.MongoException;
import com.restfb.DefaultFacebookClient;
import com.restfb.FacebookClient;
import com.restfb.FacebookClient.AccessToken;
import com.restfb.types.Page;
import com.restfb.types.Post;
import com.restfb.types.User;
import com.restfb.Connection;

public class CollectFeedsWalmartFB {

	private DBCon dbCon = new DBCon();
	private DB db = dbCon.getConnection();
	DBCollection items;

	private final static String APP_ID = "477876915648973";
	private final static String SECRET = "753075f449cfb78874231182daec8397";
	//private final static String ACCESS_TOKEN = "CAADZBw1F2NtkBAHqioAZCXcHzWf0wZAp5pV1Kg1JTPaCftT86mYhKSYpj8nvhFhEacD0PBuAHP1A1AJzm4ZB098f1b6gI5PAlUIErCZB3JroyCp1P49EghqZBAV7yxZCG2gCvXEMfXFzg2VRsHAIq1Cyp02uSvIZA5Ev7qA38pbKVIkBp75IVPsJJzNXeNBV12MZD";
	//private final static String ACCESS_TOKEN ="CAADZBw1F2NtkBAF5MB2CAXBWKzt0EJAgNZB6HFK7WtlEbhpVdsrCeyZBZAey6eZARqoKaKG5Qtd4MggRBweTckObChZBEZCcZAVVUHtEAqVNv0ZCd3ZAJJlROo7YnidjSjOP65ASzOCZAoANef1jXDpYqFCMBuJkZBiIJuCNqPXxBYyfiBcgisCQ3YZBE";	
	
	private final static String ACCESS_TOKEN="CAAGyoGPNuc0BAMwipaZBPzsZBA2kIompXOd2TSEZCl9H3yqp223gbwtmUi6FxAXvprk6ypoY7cPEn9BYzVExvs3urQQHO0zxkg6ZAUYtWe0mpzenXkiZB7dE1VsP36pp41iJt2gm4h3x4poEUhkXC04OtVwdkG5NeMjlFc5Kh5I2DdPDTr8zTpEmF0wAVEZBwZD";
	private static FacebookClient facebookClient ;//= new DefaultFacebookClient(ACCESS_TOKEN);

	private String[] walmartLocations;
	
	public CollectFeedsWalmartFB(String clientName) {
		// TODO Auto-generated constructor stub
		//facebookClient.obtainExtendedAccessToken(APP_ID, SECRET, ACCESS_TOKEN);

		//AccessToken accessToken = 				  new DefaultFacebookClient().obtainAppAccessToken(APP_ID, SECRET);
		//facebookClient = new DefaultFacebookClient(accessToken.getAccessToken());
		
		
		facebookClient = new DefaultFacebookClient(ACCESS_TOKEN, SECRET);
		facebookClient.obtainExtendedAccessToken(APP_ID, SECRET, ACCESS_TOKEN);

		try {
			items = db.getCollection(clientName);
			BasicDBObject index = new BasicDBObject("tweet_text", 1);
			items.ensureIndex(index, new BasicDBObject("unique", true));

	        FileReader fileReader = new FileReader(System.getProperty("user.dir") + "/" + "walmart-locations.txt");
	        BufferedReader bufferedReader = new BufferedReader(fileReader);
	        List<String> lines = new ArrayList<String>();
	        String line = null;
	        while ((line = bufferedReader.readLine()) != null) {
	            lines.add(line);
	        }
	        bufferedReader.close();
	        walmartLocations = lines.toArray(new String[lines.size()]);
	        
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
		
		Page page = facebookClient.fetchObject("walmart", Page.class);

		System.out.println("Page likes: " + page.getLikes());

	//	Connection<User> myFriends = facebookClient.fetchConnection("me/friends", User.class);
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
					String location = getWalmartLocation();
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

	private String getWalmartLocation()
	{		
		Random rand = new Random();
		int  n = rand.nextInt(walmartLocations.length);
		
		return walmartLocations[n];
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
		new CollectFeedsWalmartFB("WalmartFacebook")
				.createFBTableforClient(true, "walmart");

	}

}
