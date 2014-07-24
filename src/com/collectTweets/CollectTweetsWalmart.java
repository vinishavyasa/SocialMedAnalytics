package com.collectTweets;

import java.util.List;

import twitter4j.Query;
import twitter4j.QueryResult;
import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.UserMentionEntity;
import twitter4j.auth.AccessToken;

import com.db.DBCon;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.MongoException;
public class CollectTweetsWalmart {
	
	private DBCon dbCon = new DBCon();
	private DB db= dbCon.getConnection(); 
	DBCollection items;
	private final static String CONSUMER_KEY = "3ygWJnKS2Ssp7zyhH7Qm0A";
	private final static String CONSUMER_KEY_SECRET = "M8QfAma65wDY3TyJaSc94juIRmXdWGTInzRrSFJog";
	Twitter twitter = new TwitterFactory().getInstance();

	public CollectTweetsWalmart(String keyword) {
		// TODO Auto-generated constructor stub
		twitter.setOAuthConsumer(CONSUMER_KEY, CONSUMER_KEY_SECRET);		   
	    AccessToken oathAccessToken = new AccessToken("2406291522-8KL0gV0rwlrvlcRFCBLvif2WCN2LiJR9dD2K713",
	    "JiKsiLfuZ6EjSBpBzr8333XNtwFkPUZIs2H43FlEZMfzx");		 
	    twitter.setOAuthAccessToken(oathAccessToken);	
	    
	    try {	            
	         items = db.getCollection(keyword);
	         BasicDBObject index = new BasicDBObject("tweet_text", 1);
	         items.ensureIndex(index, new BasicDBObject("unique", true));
	         
	     } catch (MongoException ex) {
	         System.out.println("MongoException :" + ex.getMessage());
	     }
		
	}
	
	
	public void getTweetByQueryWalmart(boolean loadRecords, String keyword) {        
	       
        try {
            Query query = new Query(keyword);
            query.setCount(100);
            query.setLang("en");
            QueryResult result;
            result = twitter.search(query);
            System.out.println("Getting Tweets...");
            List<Status> tweets = result.getTweets();

            for (Status tweet : tweets) {

                BasicDBObject basicObj = new BasicDBObject();
                basicObj.put("user_name", tweet.getUser().getScreenName());
                basicObj.put("retweet_count", tweet.getRetweetCount());
                basicObj.put("tweet_followers_count", tweet.getUser().getFollowersCount());
                basicObj.put("tweet_date", tweet.getUser().getCreatedAt());
                UserMentionEntity[] mentioned = tweet.getUserMentionEntities();
                basicObj.put("tweet_mentioned_count", mentioned.length);
                basicObj.put("tweet_ID", tweet.getId());
                basicObj.put("tweet_text", tweet.getText());
                /*basicObj.put("tweet_location_country", tweet.getPlace().getCountry());*/
                basicObj.put("tweet_location", tweet.getUser().getLocation());
                

                try {
                    items.insert(basicObj);
                } catch (Exception e) {
                    System.out.println("MongoDB Connection Error : " + e.getMessage());                    
                }
            }
           

        } catch (TwitterException te) {
            System.out.println("te.getErrorCode() " + te.getErrorCode());
            System.out.println("te.getExceptionCode() " + te.getExceptionCode());
            System.out.println("te.getStatusCode() " + te.getStatusCode());
            if (te.getStatusCode() == 401) {
                System.out.println("401 Error: ");
                } else {
                System.out.println("Twitter Error : " + te.getMessage());
            }

            /*loadMenu();*/
        }
   
}


	public static void main(String[] args) {
		// TODO Auto-generated method stub
		 new CollectTweetsWalmart("WalmartTwitter").getTweetByQueryWalmart(true, "Walmart");
		 //new CollectTweetsWalmart("WalmartTwitter").getTweetByQueryWalmart(true, "walmart");

	}

}
