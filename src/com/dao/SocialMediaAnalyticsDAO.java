package com.dao;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Random;
import java.util.Set;
import java.util.StringTokenizer;
import java.util.TreeMap;

import com.db.DBCon;
import com.mongodb.AggregationOutput;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoException;
import com.bean.BarChartBean;
import com.bean.HeatMapBean;
import com.bean.StackedBarChartBean;
import com.bean.UserBean;
import com.bean.HistoryBean;
import com.bean.WordCloudBean;

public class SocialMediaAnalyticsDAO {

	private DBCon dbCon = new DBCon();
	private DB db = dbCon.getConnection();
	DBCollection items, itemsNew, itemsWordCloud, itemsHeatMap1, itemsBarChart;
	DBCursor cursor, newCursor, cursorWordCloud, cursorNeg, cursorPos;

	final String usersCollectionName = "RegisteredUsers";
	final String usersHistoryCollectionName = "UsersHistory";
	HashMap<String, ArrayList<Float>> bubblemap = new HashMap<String, ArrayList<Float>>();

	public SocialMediaAnalyticsDAO() {
		// TODO Auto-generated constructor stub

	}

	// this method require 1 more parameter from the front end -Retailer Id
	public double[] AnalyzeVendorFeeds(String vendorName, String socialNetwork,
			String fromDateString, String toDateString)
			throws NoSuchElementException {
		int posCount = 0, negCount = 0, neuCount = 0, totalCount = 0, tweetCount = 0;
		double posPercentage, negPercentage, neuPercentage;
		double[] percentageArray = new double[4];
		SimpleDateFormat formatter = new SimpleDateFormat(
				"EEEE, MMM dd, yyyy HH:mm:ss a");
		Date fromDate, toDate;
		Random rnd = new Random();
		int analysisId = 0;
		int retailerId = 0; // For testing purpose, get the id from front end
							// later
		retailerId = 999999;
		SentimentClassifier sc = new SentimentClassifier();
		String collectionName = vendorName.concat(socialNetwork);
		int flag = 0;

		/* Getting todays date for analysis date */
		Calendar c = new GregorianCalendar();
		c.set(Calendar.HOUR_OF_DAY, 0); // anything 0 - 23
		c.set(Calendar.MINUTE, 0);
		c.set(Calendar.SECOND, 0);
		Date todaysDate = c.getTime(); // todays date is the analysis date

		/* RandomNumber Analysis ID */
		analysisId = 100000 + rnd.nextInt(900000);

		try {
			fromDate = formatter.parse(fromDateString);
			toDate = formatter.parse(toDateString);

			System.out.println("FD " + fromDate);
			System.out.println("TD " + toDate);

			System.out.println(collectionName);
			items = db.getCollection(collectionName);

			/*
			 * DBObject betweenQuery = new BasicDBObject("tweet_year", new
			 * BasicDBObject("$gte", FromYear).append("$lte", toYear));
			 */// Working!!! (for date as string)

			DBObject betweenQuery = new BasicDBObject("tweet_date",
					new BasicDBObject("$gte", fromDate).append("$lte", toDate)); // Works
																					// (Date)
			cursor = items.find(betweenQuery);

			while (cursor.hasNext()) {
				DBObject tobj = cursor.next();

				tweetCount += 1;
				System.out.println("Date " + tobj.get("tweet_date"));
				String tweet = (String) tobj.get("tweet_text");
				if (tweet == null) {
					continue;
				}
				tweet = tweet.replaceAll(
						"(@[A-Za-z0-9]+)|([^0-9A-Za-z \\t])|(\\w+:\\/\\/\\S+)",
						"");
				tweet = tweet.trim().replaceAll(" +", " ");
				String sent = sc.classify(tweet);
				System.out.println("Score " + sent);
				if (sent.equals("pos")) {
					flag = 1;

					posCount += 1;
				}
				if (sent.equals("neg")) {
					flag = -1;

					negCount += 1;
				}
				if (sent.equals("neu")) {
					flag = 0;
					neuCount += 1;
				}
				String location = tobj.get("tweet_location").toString();
				if (socialNetwork.equalsIgnoreCase("yelp")) {
					float avg_rating = Float.parseFloat(tobj.get("avg_rating")
							.toString());
					float review_count = Float.parseFloat(tobj.get(
							"review_count").toString());

					if (bubblemap.containsKey(location)) {
						ArrayList<Float> temp = bubblemap.get(location);
						double count = temp.get(1);
						count++;
						temp.set(0, (temp.get(0) + avg_rating));
						temp.set(1, (float) count);
						temp.set(2, temp.get(2) + review_count);
					} else {
						ArrayList<Float> temp = new ArrayList<Float>();
						temp.add(0, avg_rating);
						temp.add(1, (float) 1);
						temp.add(2, review_count);
						temp.add(3, (float) analysisId);
						bubblemap.put(location, temp);
					}
				}

				Object gender = tobj.get("Gender of person");
				if (gender == null) {
					gender = "Unknown";
				}

				System.out
						.println("************************************************");
				saveAnalysis(analysisId, retailerId, todaysDate, sent, flag,
						tweet, tobj.get("tweet_location").toString(),
						tobj.get("tweet_date"), gender.toString());
				if (socialNetwork.equalsIgnoreCase("yelp"))
					saveYelpData(analysisId, tobj.get("tweet_location")
							.toString(), Float.parseFloat(tobj
							.get("avg_rating").toString()),
							Float.parseFloat(tobj.get("review_count")
									.toString()), tweet, tobj.get("tweet_date")
									.toString(), vendorName, sent, flag);
			}

			totalCount = posCount + negCount + neuCount;
			System.out.println("Total Tweet Count- " + tweetCount + " Pos-"
					+ posCount + " Neg- " + negCount + " Nue- " + neuCount
					+ " Total- " + totalCount);
			posPercentage = ((double) posCount / (double) totalCount) * 100;
			negPercentage = ((double) negCount / (double) totalCount) * 100;
			neuPercentage = ((double) neuCount / (double) totalCount) * 100;
			System.out.println("Pos Percentage" + posPercentage + " Neg- "
					+ negPercentage + " Neu- " + neuPercentage);
			posPercentage = Math.round(posPercentage * 100.0) / 100.0;
			negPercentage = Math.round(negPercentage * 100.0) / 100.0;
			neuPercentage = Math.round(neuPercentage * 100.0) / 100.0;
			percentageArray[0] = posPercentage;
			percentageArray[1] = negPercentage;
			percentageArray[2] = neuPercentage;
			percentageArray[3] = analysisId;
			if(socialNetwork.equalsIgnoreCase("yelp"))
				saveData(bubblemap, vendorName);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return percentageArray;

	}

	public void saveAnalysis(int analysisId, int retailerId, Date todaysDate,
			String sentiment, int flag, String tweetText, String location,
			Object dateOfTweet, String gender) {
		try {

			BasicDBObject basicObj = new BasicDBObject();
			basicObj.put("analysisdate", todaysDate);
			basicObj.put("analysisid", analysisId);
			basicObj.put("tweet_text", tweetText);
			basicObj.put("dateoftweet", dateOfTweet);
			basicObj.put("location", location);
			basicObj.put("retailerid", retailerId);
			basicObj.put("sentimentstatus", sentiment);
			basicObj.put("flag", flag);
			basicObj.put("gender", gender);

			itemsNew = db.getCollection("AnalysisResults");
			itemsNew.insert(basicObj);
			System.out.println("-----------INSERTED----------------");
		} catch (Exception e) {

			System.out.println("Exception Mongo!" + e);
		}

	}

	public ArrayList<HeatMapBean> heatMapGeneration(int analysisId)
			throws FileNotFoundException {
		int count = 0;
		String location = null;

		ArrayList<HeatMapBean> heatMapArrayList = new ArrayList<HeatMapBean>();
		String csvFile = "src/statesinfo/cities.csv";
		BufferedReader br = null;
		String line = "";
		String cvsSplitBy = ",";
		DBObject tobj;
		try {

			Map<String, Integer> maps = new HashMap<String, Integer>();

			System.out.println("inside try");
			itemsHeatMap1 = db.getCollection("AnalysisResults");
			DBObject query = new BasicDBObject();
			query.put("analysisid", analysisId);
			newCursor = itemsHeatMap1.find(query);

			while (newCursor.hasNext()) {
				HeatMapBean hmb = new HeatMapBean();
				tobj = newCursor.next();
				count = Integer.parseInt(tobj.get("flag").toString());
				location = tobj.get("location").toString();
				location = location.replaceAll("//s", "");
				br = new BufferedReader(new FileReader(csvFile));
				while ((line = br.readLine()) != null) {
					if (line.contains(location) && location != "") {
						String[] country = line.split(cvsSplitBy);
						location = "US-" + country[1];
						hmb.setLocation(location);
						hmb.setCount(count);
						heatMapArrayList.add(hmb);
					}
				}
			}

			return heatMapArrayList;
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (br != null) {
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

		return null;

	}

	public ArrayList<WordCloudBean> getWordCloudPos(int analysisId,
			String status) {

		Map<String, Integer> wordMap = new HashMap<String, Integer>();
		ArrayList<WordCloudBean> wordCloudArrayList = new ArrayList<WordCloudBean>();

		Set<String> stopWords = new HashSet<String>();
		stopWords.add("a");
		stopWords.add("and");

		stopWords.add("an");
		stopWords.add("are");

		stopWords.add("as");
		stopWords.add("at");

		stopWords.add("be");
		stopWords.add("but");

		stopWords.add("by");
		stopWords.add("for");

		stopWords.add("if");
		stopWords.add("in");

		stopWords.add("is");
		stopWords.add("to");

		stopWords.add("off");
		stopWords.add("on");

		stopWords.add("it");
		stopWords.add("i");

		stopWords.add("of");
		stopWords.add("do");

		try {

			itemsWordCloud = db.getCollection("AnalysisResults");
			BasicDBObject query = new BasicDBObject("analysisid", analysisId)
					.append("sentimentstatus", status);
			cursorWordCloud = itemsWordCloud.find(query);
			System.out.println(cursorWordCloud.count());

			while (cursorWordCloud.hasNext()) {

				DBObject tempObj = cursorWordCloud.next();
				String tweet = (String) tempObj.get("tweet_text");
				tweet = tweet.replaceAll(
						"(@[A-Za-z0-9]+)|([^0-9A-Za-z \\t])|(\\w+:\\/\\/\\S+)",
						"");
				tweet = tweet.replaceAll("\\b\\w{1,4}\\b\\s?", "");
				tweet = tweet.replaceAll("\\P{L}", " ");
				tweet = tweet.trim().replaceAll(" +", " ");

				// System.out.println(tweet);
				StringTokenizer token = new StringTokenizer(tweet, " ");

				while (token.hasMoreTokens()) {
					String tmp = token.nextToken().toLowerCase();

					if (!stopWords.contains(tmp.toLowerCase())) {
						if (wordMap.containsKey(tmp)) {
							wordMap.put(tmp, wordMap.get(tmp) + 1);
						} else {
							wordMap.put(tmp, 1);
						}
					}

				}

			}
			Set set = wordMap.entrySet();
			Iterator i = set.iterator();

			while (i.hasNext()) {
				WordCloudBean wcb = new WordCloudBean();
				Map.Entry me = (Map.Entry) i.next();
				int count = (Integer) me.getValue();
				String word = (String) me.getKey();
				// System.out.print(word + " : " + count+"\n");

				if (count >= 6) {
					System.out.println("Large F");
					int fontSize = 90;
					wcb.setText(word);
					wcb.setSize(fontSize);
					wordCloudArrayList.add(wcb);

				} else if (count >= 2 && count <= 5) {
					System.out.println("Medium");
					int fontSize = 50;
					wcb.setText(word);
					wcb.setSize(fontSize);
					wordCloudArrayList.add(wcb);
				} else if (count <= 1) {
					System.out.println("small");
					int fontSize = 25;
					wcb.setText(word);
					wcb.setSize(fontSize);
					wordCloudArrayList.add(wcb);
				}
			}
			return wordCloudArrayList;
		} catch (Exception e) {

		}

		return null;
	}

	public ArrayList<BarChartBean> barChart(int analysisId, String status) {
		ArrayList<BarChartBean> barChartList = new ArrayList<BarChartBean>();
		Map<Integer, Integer> countMap = new HashMap<Integer, Integer>();
		try {
			itemsBarChart = db.getCollection("AnalysisResults");
			BasicDBObject query = new BasicDBObject("analysisid", analysisId)
					.append("sentimentstatus", status);
			cursor = itemsBarChart.find(query);
			System.out.println(cursor.count());

			while (cursor.hasNext()) {

				DBObject tempObj = cursor.next();
				String tweetDate = tempObj.get("dateoftweet").toString();
				int year = Integer.parseInt(tweetDate.substring(tweetDate
						.lastIndexOf(" ") + 1));
				System.out.println(year);

				if (countMap.containsKey(year)) {
					countMap.put(year, countMap.get(year) + 1);
				} else {
					countMap.put(year, 1);
				}

			}
			System.out.println(countMap.size());
			Set set = countMap.entrySet();
			Iterator i = set.iterator();

			while (i.hasNext()) {

				BarChartBean bcb = new BarChartBean();
				Map.Entry me = (Map.Entry) i.next();
				int count = (Integer) me.getValue();
				int year = (Integer) me.getKey();
				bcb.setYear(year);
				bcb.setCount(count);
				barChartList.add(bcb);
				System.out.println("Year: " + year + " Count " + count);
			}

			return barChartList;
		} catch (Exception e) {

		}
		return barChartList;

	}

	public void addUser(String firstName, String lastName, String userName,
			String email, String password, String vendorName,
			String[] competitor) {

		try {
			items = db.getCollection(usersCollectionName);
			// BasicDBObject index = new BasicDBObject("email", 1);
			// items.ensureIndex(index, new BasicDBObject("unique", true));

			BasicDBObject userObj = new BasicDBObject();
			userObj.put("firstName", firstName);
			userObj.put("lastName", lastName);
			userObj.put("userName", userName);
			userObj.put("email", email);
			userObj.put("password", password);
			userObj.put("vendorName", vendorName);
			userObj.put("competitor", competitor);

			items.insert(userObj);
			System.out.println("A new user '" + firstName
					+ "' has been successfully inserted.");

		} catch (Exception e) {
			System.out
					.println("Failed to create the user '" + firstName + "'.");
			e.printStackTrace();
		}
	}

	public UserBean getUser(String email) {

		UserBean user = new UserBean();
		try {
			DBCollection items = db.getCollection(usersCollectionName);
			DBObject query = new BasicDBObject();
			query.put("email", email);

			DBCursor cursor = items.find(query);
			System.out
					.println("# of registered users queried from collections is "
							+ cursor.count());

			while (cursor.hasNext()) {
				DBObject userObj = cursor.next();
				user.setFirstName((String) userObj.get("firstName"));
				user.setLastName((String) userObj.get("lastName"));
				user.setUserName((String) userObj.get("userName"));
				user.setEmail((String) userObj.get("email"));
				user.setVendorName((String) userObj.get("vendorName"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}

	public void addHistory(String userName, String vendorName,
			String socialNetwork, String fromDateString, String toDateString) {

		try {

			Calendar c = new GregorianCalendar();
			c.set(Calendar.HOUR_OF_DAY, 0);
			c.set(Calendar.MINUTE, 0);
			c.set(Calendar.SECOND, 0);
			Date analysisDate = c.getTime();

			items = db.getCollection(usersHistoryCollectionName);

			BasicDBObject historyObj = new BasicDBObject();
			historyObj.put("userName", userName);
			historyObj.put("analysisDate", analysisDate);
			historyObj.put("vendorName", vendorName);
			historyObj.put("socialNetwork", socialNetwork);
			historyObj.put("fromDateString", fromDateString);
			historyObj.put("toDateString", toDateString);

			items.insert(historyObj);
			System.out.println("A new history for user '" + userName
					+ "' has been successfully inserted.");

		} catch (Exception e) {
			System.out.println("Failed to create history for user '" + userName
					+ "'.");
			e.printStackTrace();
		}

	}

	public ArrayList<HistoryBean> getHistory(String userName) {
		ArrayList<HistoryBean> historys = new ArrayList<HistoryBean>();

		try {
			DBCollection items = db.getCollection(usersHistoryCollectionName);
			DBObject query = new BasicDBObject();
			query.put("userName", userName);

			DBCursor cursor = items.find(query);
			System.out
					.println("# of registered users queried from collections is "
							+ cursor.count());

			while (cursor.hasNext()) {
				HistoryBean history = new HistoryBean();
				DBObject historyObj = cursor.next();
				history.setUserName((String) historyObj.get("userName"));
				history.setAnalysisDate(historyObj.get("analysisDate")
						.toString());
				history.setVendorName((String) historyObj.get("vendorName"));
				history.setSocialNetwork((String) historyObj
						.get("socialNetwork"));
				history.setFromDateString((String) historyObj
						.get("fromDateString"));
				history.setToDateString((String) historyObj.get("toDateString"));

				historys.add(history);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return historys;
	}

	/*
	 * public static void main (String args[]) { new
	 * SocialMediaAnalyticsDAO().test();
	 * 
	 * }
	 */

	public ArrayList<StackedBarChartBean> getStackedBarChart(int analysisId,
			String status, String gender) {
		ArrayList<StackedBarChartBean> barChartList = new ArrayList<StackedBarChartBean>();
		Map<Integer, Integer> countMap = new HashMap<Integer, Integer>();
		try {
			itemsBarChart = db.getCollection("AnalysisResults");
			BasicDBObject query = new BasicDBObject("analysisid", analysisId)
					.append("sentimentstatus", status).append("gender", gender);
			cursor = itemsBarChart.find(query);
			System.out.println(cursor.count());

			while (cursor.hasNext()) {

				DBObject tempObj = cursor.next();
				String tweetDate = tempObj.get("dateoftweet").toString();
				int year = Integer.parseInt(tweetDate.substring(tweetDate
						.lastIndexOf(" ") + 1));

				if (countMap.containsKey(year)) {
					countMap.put(year, countMap.get(year) + 1);
				} else {
					countMap.put(year, 1);
				}

			}

			Set set = countMap.entrySet();
			Iterator i = set.iterator();

			while (i.hasNext()) {

				StackedBarChartBean bcb = new StackedBarChartBean();
				Map.Entry me = (Map.Entry) i.next();
				int count = (Integer) me.getValue();
				int year = (Integer) me.getKey();
				bcb.setYear(year);
				bcb.setCount(count);
				bcb.setGender(gender);
				barChartList.add(bcb);
			}

			return barChartList;
		} catch (Exception e) {

		}
		return barChartList;

	}

	// yelp

	public ArrayList<String> getYelpLocationData(int analysisId) {

		ArrayList<String> yelpResults = new ArrayList<String>();

		items = db.getCollection("BubbleYelpResults");
		BasicDBObject query = new BasicDBObject("analysisId", analysisId);
		DBCursor cursor = items.find(query);
		System.out.println(cursor.count());

		int c = 0;

		while (cursor.hasNext()) {
			DBObject tobj = cursor.next();
			ArrayList<Float> temp = new ArrayList<Float>();
			String value = "";

			String location = tobj.get("location").toString();
			String avg_rating = tobj.get("avg_rating").toString();
			String review_count = tobj.get("review_count").toString();
			String count = tobj.get("count").toString();

			value = location + "," + avg_rating + "," + count + ","
					+ review_count;
			yelpResults.add(value);
		}
		return yelpResults;
	}

	private void saveData(HashMap<String, ArrayList<Float>> map,
			String vendorName) {

		try {

			Iterator it = map.entrySet().iterator();
			while (it.hasNext()) {
				Map.Entry pairs = (Map.Entry) it.next();
				String location = pairs.getKey().toString();
				ArrayList<Float> value = (ArrayList<Float>) pairs.getValue();
				float avg_rating = value.get(0) / value.get(1);

				BasicDBObject basicObj = new BasicDBObject();
				basicObj.put("analysisId", Math.round(value.get(3)));
				basicObj.put("location", location);
				basicObj.put("avg_rating", avg_rating);
				basicObj.put("count", value.get(1));
				basicObj.put("review_count", value.get(2));
				itemsNew = db.getCollection("BubbleYelpResults");
				itemsNew.insert(basicObj);
				System.out.println("-----------INSERTED----------------");

				System.out.println(pairs.getKey() + " = " + pairs.getValue()
						+ " avg_Rating: " + avg_rating);
				it.remove(); // avoids a ConcurrentModificationException
			}

		} catch (Exception e) {

			System.out.println("Exception in Mongo while storing Yelp Results!"
					+ e);
		}

	}

	private void saveYelpData(int analysisId, String location,
			float avg_rating, float review_count, String text, String date,
			String vendorName, String sent, int flag) {

		BasicDBObject basicObj = new BasicDBObject();
		basicObj.put("analysisId", analysisId);
		basicObj.put("location", location);
		basicObj.put("avg_rating", avg_rating);
		basicObj.put("text", text);
		basicObj.put("date", date);
		basicObj.put("sentimentstatus", sent);
		basicObj.put("flag", flag);
		itemsNew = db.getCollection("YelpResults");
		itemsNew.insert(basicObj);
		System.out.println("-----------Analysisdata Stored----------------");

	}
	
	
	public ArrayList<String> collectTweetText(int analysisId)
	{
		ArrayList<String> results = new ArrayList<String>();
		
		itemsHeatMap1 = db.getCollection("AnalysisResults");
		DBObject query = new BasicDBObject();
		query.put("analysisid", analysisId);
		newCursor = itemsHeatMap1.find(query);

		while (newCursor.hasNext()) {
			DBObject tobj = newCursor.next();
			String tweet_text = (String) tobj.get("tweet_text");
			results.add(tweet_text);
		}
		return results;
	}
	
}
