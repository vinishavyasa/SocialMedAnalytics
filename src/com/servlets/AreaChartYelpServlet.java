package com.servlets;

import java.io.IOException;

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
@WebServlet("/AreaChartYelpServlet")
public class AreaChartYelpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AreaChartYelpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Area Chart Servlet - Yelp");
		BarChartBean[] barChartArrayPos;
		BarChartBean[] barChartArrayNeg;
		Service service = new Service();
		int analysisId = Integer.parseInt(request.getParameter("analysisId"));
		System.out.println("Printing Analysis ID in servlet: " + analysisId);
		barChartArrayPos = service.getBarChart(analysisId, "pos");
		barChartArrayNeg = service.getBarChart(analysisId, "neg");

		request.setAttribute("AreaChartPos", new Gson().toJson(barChartArrayPos));
		request.setAttribute("AreaChartNeg", new Gson().toJson(barChartArrayNeg));
		for(int i=0;i<barChartArrayPos.length;i++)
			System.out.println(barChartArrayPos[i].getYear()+"--"+barChartArrayPos[i].getCount());

		String nextPage = "/AreaChartYelp.jsp";
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
	}

}
