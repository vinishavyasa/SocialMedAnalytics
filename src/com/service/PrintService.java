package com.service;

import java.awt.Graphics2D;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import org.apache.pdfbox.exceptions.COSVisitorException;
import org.apache.pdfbox.util.PDFMergerUtility;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;

import com.bean.BarChartBean;
import com.bean.PrintBean;
import com.itextpdf.awt.DefaultFontMapper;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfTemplate;
import com.itextpdf.text.pdf.PdfWriter;

public class PrintService {

	private JFreeChart generateBarChart(double[] percentageArray) {
		DefaultCategoryDataset dataSet = new DefaultCategoryDataset();
		dataSet.setValue(percentageArray[0], "Sentiment", "Positive");
		dataSet.setValue(percentageArray[1], "Sentiment", "Negative");
		dataSet.setValue(percentageArray[2], "Sentiment", "Neutral");

		JFreeChart chart = ChartFactory.createBarChart(
				"Sentiment Analysis using Bar Charts", "Sentiments",
				"Percentage", dataSet, PlotOrientation.VERTICAL, false, true,
				false);

		return chart;
	}

	private static JFreeChart generateDonutChart(double[] percentageArray) {
		DefaultPieDataset dataSet = new DefaultPieDataset();

		dataSet.setValue("PositiveSentiments", percentageArray[0]);
		dataSet.setValue("NegativeSentiments", percentageArray[1]);
		dataSet.setValue("NeutralSentiments", percentageArray[2]);

		JFreeChart chart = ChartFactory.createPieChart(
				"Sentiment Analysis using Donut Charts", dataSet, true, true,
				false);

		return chart;
	}

	private JFreeChart generateBarChartPos(int analysisId, BarChartBean[] pos) {
		DefaultCategoryDataset dataSet = new DefaultCategoryDataset();

		for (int i = 0; i < pos.length; i++) {
			dataSet.setValue(pos[i].getCount(), "Sentiment",
					Integer.toString(pos[i].getYear()));
		}

		JFreeChart chart = ChartFactory.createBarChart(
				"Sentiment Analysis - Positive Conts", "Years", "Count",
				dataSet, PlotOrientation.VERTICAL, false, true, false);

		return chart;
	}

	private JFreeChart generateBarChartNeg(int analysisId, BarChartBean[] neg) {
		DefaultCategoryDataset dataSet = new DefaultCategoryDataset();

		for (int i = 0; i < neg.length; i++) {
			dataSet.setValue(neg[i].getCount(), "Sentiment",
					Integer.toString(neg[i].getYear()));
		}

		JFreeChart chart = ChartFactory.createBarChart(
				"Sentiment Analysis - Negative Conts", "Years", "Count",
				dataSet, PlotOrientation.VERTICAL, false, true, false);

		return chart;
	}

	private JFreeChart generateBarChartNeu(int analysisId, BarChartBean[] neu) {
		DefaultCategoryDataset dataSet = new DefaultCategoryDataset();

		for (int i = 0; i < neu.length; i++) {
			dataSet.setValue(neu[i].getCount(), "Sentiment",
					Integer.toString(neu[i].getYear()));
		}

		JFreeChart chart = ChartFactory.createBarChart(
				"Sentiment Analysis - Negative Conts", "Years", "Count",
				dataSet, PlotOrientation.VERTICAL, false, true, false);

		return chart;
	}

	private void writeChartToPDF(JFreeChart chart, int width, int height,
			String fileName) {
		System.out.println("in writeChartToPDF");
		PdfWriter writer = null;

		Document document = new Document();
		FileOutputStream fOut;
		try {
			File file = new File(fileName);
			file.createNewFile();
			writer = PdfWriter
					.getInstance(document, new FileOutputStream(file));
			document.open();
			PdfContentByte contentByte = writer.getDirectContent();
			PdfTemplate template = contentByte.createTemplate(width, height);
			Graphics2D graphics2d = template.createGraphics(width, height,
					new DefaultFontMapper());
			Rectangle2D rectangle2d = new Rectangle2D.Double(0, 0, width,
					height);
			// chart.draw(graphics2d, rectangle2d);
			BufferedImage bufferedImage = chart.createBufferedImage(width,
					height);
			Image image = Image.getInstance(writer, bufferedImage, 1.0f);
			document.add(image);

			graphics2d.dispose();
			contentByte.addTemplate(template, 0, 0);

		} catch (Exception e) {
			e.printStackTrace();
		}
		document.close();
		System.out.println("returning from writeChartToPDF");
	}

	public void generateBarChartWrapper(double[] percentageArray, int analysisId) {
		System.out.println("in generateBarWrapper");
		writeChartToPDF(generateBarChart(percentageArray), 500, 400,
				"results/Anlysis_" + analysisId + "_bar.pdf");
	}

	public void generateDonutChartWrapper(double[] percentageArray,
			int analysisId) {
		System.out.println("in generateDonutWrapper");
		writeChartToPDF(generateDonutChart(percentageArray), 500, 400,
				"results/Anlysis_" + analysisId + "_donut.pdf");
	}

	public void generateBarChartWrapper(int analysisId, BarChartBean[] pos,
			BarChartBean[] neg, BarChartBean[] neu) {
		writeChartToPDF(generateBarChartPos(analysisId, pos), 500, 400,
				"results/Anlysis_" + analysisId + "_barPos.pdf");

		writeChartToPDF(generateBarChartNeg(analysisId, neg), 500, 400,
				"results/Anlysis_" + analysisId + "_barNeg.pdf");

		// writeChartToPDF(
		// generateBarChartNeg(analysisId, neu),
		// 500,
		// 400,
		// "results/Anlysis_"
		// + analysisId + "_barNeu.pdf");
	}

	public PrintBean generateTweetText(ArrayList<String> results, int analysisId) {
		return writeTextToPDF(results, analysisId, "results/Anlysis_" + analysisId
				+ "_tweetText.pdf");
	}

	private PrintBean writeTextToPDF(ArrayList<String> results, int analysisId,
			String filename) {
		Document document = new Document();
		PrintBean pb = new PrintBean();
		pb.setFilePath(filename);
		// step 2
		try {
			PdfWriter.getInstance(document, new FileOutputStream(filename));
			document.open();
			for (int i = 0; i < results.size(); i++)
				document.add(new Paragraph(results.get(i)));
			document.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		return pb;
	}

	private void mergePDF(int analysisId) throws COSVisitorException,
			IOException {

		PDFMergerUtility ut = new PDFMergerUtility();
		ut.addSource("results/Anlysis_" + analysisId + "_bar.pdf");
		ut.addSource("results/Anlysis_" + analysisId + "_donut.pdf");
		ut.addSource("results/Anlysis_" + analysisId + "_barPos.pdf");
		ut.addSource("results/Anlysis_" + analysisId + "_barNeg.pdf");
		ut.addSource("results/Anlysis_" + analysisId + "_tweetText.pdf");
		ut.setDestinationFileName("results/Anlysis_" + analysisId
				+ "_merged.pdf");
		ut.mergeDocuments();
		createTextFile(analysisId);
	}

	private void createTextFile(int analysisId) {
		try {
			PrintWriter writer = new PrintWriter("results/analysisId.txt", "UTF-8");
			writer.println(Integer.toString(analysisId));
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}

	public void mergeUtilWrapper(int analysisId) {
		try {
			mergePDF(analysisId);
		} catch (COSVisitorException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
