package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.service.Service;

/**
 * Servlet implementation class CompareRetailerServlet
 */
@WebServlet("/CompareRetailerServlet")
public class CompareRetailerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompareRetailerServlet() {
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
		double[] percentageArray = new double[4];	
		Service service = new Service();
		PrintWriter out=response.getWriter();
		System.out.println("In Compare Sevelet");
		String retailer= request.getParameter("retailer");
		String dateRange = request.getParameter("date");
		String socialNetwork = request.getParameter("sN");
		
		String[] parts = dateRange.split("- ");
		String fromDateString = parts[0];
		String toDateString = parts[1];		
		System.out.println("printing details"+retailer+" DATE:  "+dateRange+ " SociNet: "+socialNetwork);
		
		percentageArray = service.AnalyzeVendorFeeds(retailer, socialNetwork, fromDateString, toDateString);
		System.out.println(percentageArray[0]+" ,"+ percentageArray[1]+" , " +percentageArray[2] );
		Gson gson = new Gson(); // GSON - java json library from Google. 
		String content = gson.toJson(percentageArray);
		
		System.out.println("Content"+content);
		response.setContentType("text/json");
		response.getWriter().print(content);
		
	}

}
