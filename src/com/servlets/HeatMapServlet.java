package com.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.HeatMapBean;
import com.google.gson.Gson;
import com.service.Service;

/**
 * Servlet implementation class HeatMapServlet
 */
@WebServlet("/HeatMapServlet")
public class HeatMapServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HeatMapServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
		System.out.println("Do GET");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("Inside Servlet!!");
		HeatMapBean[] heatMapArray;
		Service service= new Service();
		int analysisId=Integer.parseInt(request.getParameter("analysisId"));
		System.out.println("Printing Analysis ID in servlet: "+analysisId);
		heatMapArray = service.generateHeatMap(analysisId);
		request.setAttribute("HeatMap", new Gson().toJson(heatMapArray));
		for(int i=0;i<heatMapArray.length;i++)
			System.out.println(heatMapArray[i].getCount()+heatMapArray[i].getLocation());

		String nextPage = "/HeatMap.jsp";
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
	
	}

}
