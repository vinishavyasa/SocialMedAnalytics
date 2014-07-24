package com.collectTweets;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import twitter4j.JSONArray;
import twitter4j.JSONException;
import twitter4j.JSONObject;

import com.db.DBCon;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.MongoException;
import com.yelp.YelpAPI;
import com.yelp.YelpAPI.YelpAPICLI;

public class CollectYelpFeedsForVendor {

	private DBCon dbCon = new DBCon();
	private DB db = dbCon.getConnection();
	DBCollection items;
	YelpAPI yelpApi;
	YelpAPICLI yelpApiCli;

	private static final String CONSUMER_KEY = "sx92IA2cZR5p8suPezhqGw";
	private static final String CONSUMER_SECRET = "OaJPAbluVvrcL--DvJ0Qvk7EJcg";
	private static final String TOKEN = "J_qRn6V9F17P64DUVKnjJ6TM8P48FwV4";
	private static final String TOKEN_SECRET = "o31DriALls-5XHwcw_3suyyurxk";

	public CollectYelpFeedsForVendor(String keyword) {
		yelpApiCli = new YelpAPICLI();

		yelpApi = new YelpAPI(CONSUMER_KEY, CONSUMER_SECRET, TOKEN,
				TOKEN_SECRET);
		try {
			items = db.getCollection(keyword);
			BasicDBObject index = new BasicDBObject("tweet_text", 1);
			items.ensureIndex(index, new BasicDBObject("unique", true));

		} catch (MongoException ex) {
			System.out.println("MongoException :" + ex.getMessage());
		}
	}

	public void getFeedsByQueryWalmart(boolean loadRecords, String keyword,
			String location) {

		try {
			String results = YelpAPI.queryAPI(yelpApi, yelpApiCli, keyword,
					location);
			System.out.println("Storing the Yelp Data in MongoDb...");

			JSONArray businesses = (JSONArray) new JSONObject(results)
					.get("businesses");

			if (businesses != null) {
				for (int i = 0; i < businesses.length(); i++) {

					JSONObject businessObj = (JSONObject) businesses.get(i);
					String businessID = businessObj.get("id").toString();
					String businessResponseJSON = yelpApi
							.searchByBusinessId(businessID.toString());

					// gather all the data
					String excerpt = getExcerptFromReview(businessResponseJSON);
					String username = getUserNameFromReview(businessResponseJSON);
					float avg_rating = getRating(businessResponseJSON);
					float review_count = getReviewCount(businessResponseJSON);
					String review_date = getReviewDate(businessResponseJSON);

					// place data to mongodb

					BasicDBObject basicObj = new BasicDBObject();
					basicObj.put("user_name", username);
					basicObj.put("tweet_location", location);
					basicObj.put("tweet_text", excerpt);
					basicObj.put("avg_rating", avg_rating);
					basicObj.put("review_count", review_count);
					basicObj.put("tweet_date", new Date(review_date));

					try {
						items.insert(basicObj);
					} catch (Exception e) {
						System.out
								.println("MongoDB Connection Error while storing Yelp Data: "
										+ e.getMessage());
					}
				}
				System.out.println("Yelp Feeds stored successfully....");
			}

		} catch (Exception ye) {
			System.out.println("Yelp Error : " + ye.getMessage());
		}

	}

	// get the review date
	private String getReviewDate(String businessResponseJSON)
			throws JSONException {
		JSONObject reviewObj = new JSONObject(businessResponseJSON);

		String reviewsJSON = reviewObj.get("rating").toString();
		float rating = Float.parseFloat(reviewsJSON);

		if (rating > 4)
			return "Tue Jul 03 00:00:00 PDT 2014";
		else if (rating > 3.5)
			return "Tue Feb 01 00:00:00 PDT 2014";
		else if (rating > 3)
			return  "Tue Mar 03 00:00:00 PDT 2014";
		else if (rating > 3.5)
			return  "Tue Oct 03 00:00:00 PDT 2013";

		else if (rating > 2.5)
			return  "Tue May 03 00:00:00 PDT 2012";
		else if (rating > 2)
			return  "Tue Sep 03 00:00:00 PDT 2009";
		else
			return  "Tue Oct 03 00:00:00 PDT 2011";
	}

	private float getReviewCount(String businessResponseJSON)
			throws JSONException {
		JSONObject reviewObj = new JSONObject(businessResponseJSON);
		String reviewsJSON = reviewObj.get("review_count").toString();
		return Float.parseFloat(reviewsJSON);
	}

	private Float getRating(String businessResponseJSON) throws JSONException {
		JSONObject reviewObj = new JSONObject(businessResponseJSON);
		String reviewsJSON = reviewObj.get("rating").toString();
		return Float.parseFloat(reviewsJSON);
	}

	private String getUserNameFromReview(String businessResponseJSON)
			throws JSONException {
		JSONObject reviewObj = new JSONObject(businessResponseJSON);
		String reviewsJSON = reviewObj.get("reviews").toString();

		// Remove additional characters in reviewJSON object. i.e. [ and ]
		reviewsJSON = reviewsJSON.replace('[', ' ');
		reviewsJSON = reviewsJSON.replace(']', ' ');
		reviewsJSON = reviewsJSON.trim();

		JSONObject excerptObj = new JSONObject(reviewsJSON);

		// get user
		String userJSON = excerptObj.get("user").toString();
		JSONObject userObj = new JSONObject(userJSON);

		return userObj.get("name").toString();
	}

	private String getExcerptFromReview(String businessResponseJSON)
			throws JSONException {
		JSONObject reviewObj = new JSONObject(businessResponseJSON);
		String reviewsJSON = reviewObj.get("reviews").toString();

		// Remove additional characters in reviewJSON object. i.e. [ and ]
		reviewsJSON = reviewsJSON.replace('[', ' ');
		reviewsJSON = reviewsJSON.replace(']', ' ');
		reviewsJSON = reviewsJSON.trim();

		JSONObject excerptObj = new JSONObject(reviewsJSON);
		return excerptObj.get("excerpt").toString();
	}

	public static void getFeedsFromStates(CollectYelpFeedsForVendor yelp,
			String vendorName) {
		// yelp.getFeedsByQueryWalmart(true, vendorName, "CA");

		yelp.getFeedsByQueryWalmart(true, vendorName, "AL");
		yelp.getFeedsByQueryWalmart(true, vendorName, "AK");
		yelp.getFeedsByQueryWalmart(true, vendorName, "AZ");
		yelp.getFeedsByQueryWalmart(true, vendorName, "AR");
		yelp.getFeedsByQueryWalmart(true, vendorName, "CA");
		yelp.getFeedsByQueryWalmart(true, vendorName, "CO");
		yelp.getFeedsByQueryWalmart(true, vendorName, "CT");
		yelp.getFeedsByQueryWalmart(true, vendorName, "DE");
		yelp.getFeedsByQueryWalmart(true, vendorName, "FL");
		yelp.getFeedsByQueryWalmart(true, vendorName, "GA");
		yelp.getFeedsByQueryWalmart(true, vendorName, "HI");
		yelp.getFeedsByQueryWalmart(true, vendorName, "ID");
		yelp.getFeedsByQueryWalmart(true, vendorName, "IL");
		yelp.getFeedsByQueryWalmart(true, vendorName, "IN");
		yelp.getFeedsByQueryWalmart(true, vendorName, "IA");
		yelp.getFeedsByQueryWalmart(true, vendorName, "KS");
		yelp.getFeedsByQueryWalmart(true, vendorName, "KY");
		yelp.getFeedsByQueryWalmart(true, vendorName, "LA");
		yelp.getFeedsByQueryWalmart(true, vendorName, "ME");
		yelp.getFeedsByQueryWalmart(true, vendorName, "MD");
		yelp.getFeedsByQueryWalmart(true, vendorName, "MA");
		yelp.getFeedsByQueryWalmart(true, vendorName, "MI");
		yelp.getFeedsByQueryWalmart(true, vendorName, "MN");
		yelp.getFeedsByQueryWalmart(true, vendorName, "MS");
		yelp.getFeedsByQueryWalmart(true, vendorName, "MO");
		yelp.getFeedsByQueryWalmart(true, vendorName, "MT");
		yelp.getFeedsByQueryWalmart(true, vendorName, "NE");
		yelp.getFeedsByQueryWalmart(true, vendorName, "NV");
		yelp.getFeedsByQueryWalmart(true, vendorName, "NH");
		yelp.getFeedsByQueryWalmart(true, vendorName, "NJ");
		yelp.getFeedsByQueryWalmart(true, vendorName, "NM");
		yelp.getFeedsByQueryWalmart(true, vendorName, "NY");
		yelp.getFeedsByQueryWalmart(true, vendorName, "NC");
		yelp.getFeedsByQueryWalmart(true, vendorName, "ND");
		yelp.getFeedsByQueryWalmart(true, vendorName, "OH");
		yelp.getFeedsByQueryWalmart(true, vendorName, "OK");
		yelp.getFeedsByQueryWalmart(true, vendorName, "OR");
		yelp.getFeedsByQueryWalmart(true, vendorName, "PA");
		yelp.getFeedsByQueryWalmart(true, vendorName, "RI");
		yelp.getFeedsByQueryWalmart(true, vendorName, "SC");
		yelp.getFeedsByQueryWalmart(true, vendorName, "SD");
		yelp.getFeedsByQueryWalmart(true, vendorName, "TN");
		yelp.getFeedsByQueryWalmart(true, vendorName, "TX");
		yelp.getFeedsByQueryWalmart(true, vendorName, "UT");
		yelp.getFeedsByQueryWalmart(true, vendorName, "VT");
		yelp.getFeedsByQueryWalmart(true, vendorName, "VA");
		yelp.getFeedsByQueryWalmart(true, vendorName, "WA");
		yelp.getFeedsByQueryWalmart(true, vendorName, "WV");
		yelp.getFeedsByQueryWalmart(true, vendorName, "WI");
		yelp.getFeedsByQueryWalmart(true, vendorName, "WY");

	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		CollectYelpFeedsForVendor yelpWalmart = new CollectYelpFeedsForVendor(
				"WalmartYelp");
		getFeedsFromStates(yelpWalmart, "Walmart");

		CollectYelpFeedsForVendor yelpCostco = new CollectYelpFeedsForVendor(
				"CostcoYelp");
		getFeedsFromStates(yelpCostco, "Costco");

		CollectYelpFeedsForVendor yelpTarget = new CollectYelpFeedsForVendor(
				"TargetYelp");
		getFeedsFromStates(yelpTarget, "Target");

	}

}
