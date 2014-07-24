package com.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.BarChartBean;
import com.bean.WordCloudBean;
import com.google.gson.Gson;
import com.service.Service;

/**
 * Servlet implementation class BarChartServlet
 */
@WebServlet("/BubbleChartYelpServlet")
public class BubbleChartYelpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BubbleChartYelpServlet() {
		super();
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
		System.out.println("Bubble Chart Servelet");
		ArrayList<String> yelpResults = new ArrayList<String>();
		Service service = new Service();
		
		
		int analysisId = Integer.parseInt(request.getParameter("analysisId"));
		System.out.println("Printing Analysis ID in servlet: " + analysisId);
		
		yelpResults = service.getLocationData(analysisId);

		for (int i = 0; i < yelpResults.size(); i++)
			System.out.println("YelpResults: Region: " + yelpResults.get(0) + "Avg_rating: " + yelpResults.get(1));

		String content = serialize(yelpResults);

		System.out.println("Content:" + content);
		request.setAttribute("BubbleResultsYelp",content);
		
		String nextPage = "/BubbleChartYelp.jsp";
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
	}

	private String serialize(ArrayList<String> yelpResults) {
		
		String temp = yelpResults.get(0);

		for (int i = 1; i < yelpResults.size(); i++) {
			temp = temp + ":" + yelpResults.get(i);
		}
		return temp;
	}

}
