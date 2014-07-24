package com.db;

import com.mongodb.MongoClient;
import com.mongodb.DB;

public class DBCon {
	MongoClient mongoClient;
	private DB db;

	public DBCon(){
		// TODO Auto-generated constructor stub
		
	}
	
	public DB getConnection()
	{		
		try {
			
			mongoClient = new MongoClient( "127.0.0.1" , 27017 );
			db = mongoClient.getDB( "socialAnalytics" );
			 
	    } catch(Exception e) {
			     System.err.println("Exception occured while establishing Database Connection: " + e.getMessage());
		}
	    return db;
	}


}
