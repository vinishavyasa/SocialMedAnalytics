package com.servlets;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.BarChartBean;
import com.bean.PrintBean;
import com.service.PrintService;
import com.service.Service;

/**
 * Servlet implementation class PrintPDF
 */
@WebServlet("/PrintPDFServlet")
public class PrintPDFServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public PrintPDFServlet() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("In Generate PDF ");
		Service service = new Service();
		PrintService pservice = new PrintService();
		double[] percentageArray = new double[4];

		String socialNetwork = request.getParameter("sN");
		System.out.println("socialnetwork: " + socialNetwork);
		String vendorName = (String) request.getParameter("vendorName");
		System.out.println("vendorname: " + vendorName);
		int analysisId = Integer.parseInt(request.getParameter("analysisId"));

		String fromInputTimeStamp = "01/06/2009";
		String toInputTimeStamp = "07/06/2014";

		final String inputFormat = "MM/dd/yyyy";
		final String outputFormat = "EEEE, MMM dd, yyyy HH:mm:ss a";

		String fromDateString;
		String toDateString;
		PrintWriter out = response.getWriter();

		try {
			fromDateString = TimeStampConverter(inputFormat,
					fromInputTimeStamp, outputFormat);
			toDateString = TimeStampConverter(inputFormat, toInputTimeStamp,
					outputFormat);
			percentageArray = service.AnalyzeVendorFeeds(vendorName,
					socialNetwork, fromDateString, toDateString);
			request.setAttribute("percentageArray", percentageArray);

			BarChartBean[] barChartArrayPos;
			BarChartBean[] barChartArrayNeg;
			BarChartBean[] barChartArrayNeu;
			barChartArrayPos = service.getBarChart(analysisId, "pos");
			barChartArrayNeg = service.getBarChart(analysisId, "neg");
			barChartArrayNeu = service.getBarChart(analysisId, "neu");

			ArrayList<String> results = new ArrayList<String>();

			results = service.collectTweetText(analysisId);

			// Generate PDF
			pservice.generateBarChartWrapper(percentageArray, analysisId);
			pservice.generateDonutChartWrapper(percentageArray, analysisId);
			pservice.generateBarChartWrapper(analysisId, barChartArrayPos,
					barChartArrayNeg, barChartArrayNeu);
			pservice.generateTweetText(results, analysisId);
			pservice.mergeUtilWrapper(analysisId);

			// Forward
			String nextPage = "/Analysis.jsp";
			RequestDispatcher dispatcher = getServletContext()
					.getRequestDispatcher(nextPage);
			dispatcher.forward(request, response);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private static String TimeStampConverter(final String inputFormat,
			String inputTimeStamp, final String outputFormat)
			throws ParseException {
		return new SimpleDateFormat(outputFormat).format(new SimpleDateFormat(
				inputFormat).parse(inputTimeStamp));
	}

}
