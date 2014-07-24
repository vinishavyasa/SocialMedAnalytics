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
@WebServlet("/BarChartServlet")
public class BarChartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BarChartServlet() {
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
		System.out.println("Word CLoud Servelet");
		BarChartBean[] barChartArrayPos;
		BarChartBean[] barChartArrayNeg;
		BarChartBean[] barChartArrayNeu;
		Service service= new Service();
		int analysisId=Integer.parseInt(request.getParameter("analysisId"));
		System.out.println("Printing Analysis ID in servlet: "+analysisId);
		barChartArrayPos= service.getBarChart(analysisId, "pos");
		barChartArrayNeg= service.getBarChart(analysisId, "neg");
		barChartArrayNeu= service.getBarChart(analysisId, "neu");
		
		request.setAttribute("BarChartPos", new Gson().toJson(barChartArrayPos));
		request.setAttribute("BarChartNeg", new Gson().toJson(barChartArrayNeg));
		request.setAttribute("BarChartNeu", new Gson().toJson(barChartArrayNeu));
		for(int i=0;i<barChartArrayPos.length;i++)
			System.out.println(barChartArrayPos[i].getYear()+"--"+barChartArrayPos[i].getCount());

		String nextPage = "/Charts.jsp";
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
	}

}
