package com.trainingClass;

import java.io.File;
import java.io.IOException;

import com.aliasi.classify.Classification;
import com.aliasi.classify.Classified;
import com.aliasi.classify.DynamicLMClassifier;
import com.aliasi.classify.LMClassifier;
import com.aliasi.corpus.ObjectHandler;
import com.aliasi.util.AbstractExternalizable;
import com.aliasi.util.Compilable;
import com.aliasi.util.Files;

public class Train {

	public Train() {
		// TODO Auto-generated constructor stub
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			new Train().trainClassifier();
		}
		catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	void trainClassifier() throws IOException, ClassNotFoundException { 
		
		File trainDir; 
		String[] categories; 
		LMClassifier classifier; 
		trainDir = new File("src/trainer"); 
		categories = trainDir.list(); 
		int nGram = 10; 
		//the nGram level, any value between 7 and 12 works 
		classifier= DynamicLMClassifier.createNGramProcess(categories, nGram); 
		for (int i = 0; i < categories.length; ++i) 
		{ 
			String category = categories[i];
			System.out.println(categories.length);
			Classification classification = new Classification(category); 
			System.out.println("Classification: "+classification);
			File file = new File(trainDir, categories[i]); 
			File[] trainFiles = file.listFiles(); 
			for (int j = 0; j < trainFiles.length; ++j) 
			{
				File trainFile = trainFiles[j]; 
				String review = Files.readFromFile(trainFile, "ISO-8859-1"); 
				Classified classified = new Classified(review, classification); 
				((ObjectHandler) classifier).handle(classified); 
				} 
			} 
		AbstractExternalizable.compileTo((Compilable) classifier, new File("src/TrainedClassifier/classifierNew.txt")); 
		System.out.println("Classifier trained!!");
			} 
	
	}


