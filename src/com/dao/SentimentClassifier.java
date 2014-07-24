package com.dao;

import java.io.File;
import java.io.IOException;

import com.aliasi.classify.ConditionalClassification;
import com.aliasi.classify.LMClassifier;
import com.aliasi.util.AbstractExternalizable;

public class SentimentClassifier 
{ 
	String[] categories; 
	LMClassifier classifier; 
	public SentimentClassifier() 
	{ 
		try 
		{ 
			classifier= (LMClassifier) AbstractExternalizable.readObject(new File("src/TrainedClassifier/classifierNew.txt")); 
			categories = classifier.categories(); 
		} 
		catch (ClassNotFoundException e) 
		{ 
			e.printStackTrace(); 
		} catch (IOException e) 
		{ e.printStackTrace(); 
		} 
		} 
	
	
	public String classify(Object object)
	{ 
		System.out.println(object);
		ConditionalClassification classification = classifier.classify( (CharSequence) object); 
		return classification.bestCategory(); 
		} 
	} 