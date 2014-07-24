package com.db;

import com.mongodb.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Date;
import java.util.Properties;

public class CloudMongoConnection {
	 static String host, dbname, user, password;
	 
	    public static void addData(int repeats) {
	        try {
	            DBCollection dbc = null;
	 
	            Properties prop = new Properties();
	            prop.load(new FileInputStream(System.getProperty("user.home") + "/mydb.cfg"));
	 
	            host = prop.getProperty("host").toString();
	            dbname = prop.getProperty("dbname").toString();
	            user = prop.getProperty("user").toString();
	            password = prop.getProperty("password").toString();
	 
	            System.out.println("host: " + host + "\ndbname: " + dbname + "\nuser: " + user + "\npassword: " + password);
	 
	            Mongo m = new Mongo(host, 27017);
	            DB db = m.getDB(dbname);
	             
	            if (db.authenticate(user, password.toCharArray())) {
	                System.out.println("Connected!");
	            } else {
	                System.out.println("Connection failed");
	            }
	 
	            try {
	                db.getCollection("mycollection");
	            } catch (Exception e) {
	                db.createCollection("mycollection", null);
	            } finally {
	                System.out.println("Repeats: " + repeats);
	                for (int i = 1; i <= repeats; i++) {
	                    BasicDBObject data = new BasicDBObject("data", new Date());
	                    db.getCollection("mycollection").save(data);
	                    System.out.println("INFO: row added " + data);
	                }
	            }
	        } catch (IOException ex) {
	        }
	    }
	    
	    public static void main(String[] args) {
	    	addData(1);
	    }
}
