package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.BarChartBean;
import com.bean.StackedBarChartBean;
import com.google.gson.Gson;
import com.service.Service;

/**
 * Servlet implementation class StackedBarChart
 */
@WebServlet("/StackedBarChart")
public class StackedBarChart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StackedBarChart() {
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

		HttpSession session = request.getSession();
		Object analysisIdObj = session.getAttribute("analysisId");
		String vendorName = (String)session.getAttribute("vendorName");
		String view = request.getParameter("view");
		int analysisId = 0;
		Service service= new Service();

		if (analysisIdObj != null) {
			try {
				analysisId = Integer.parseInt((String)analysisIdObj);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		System.out.println("Printing Analysis ID in servlet: "+ analysisId);

		if (analysisId == 0) {
/*			 response.setContentType("text/html");
			 PrintWriter out = response.getWriter();

			 out.println("<body bgcolor=FFFFFF>");
			 out.println("<h2>Please do analysis and then come here to see the reports.</h2>");
			 out.close();*/
			 return;
		}
		
		int femalePosCount = service.getStackedBarChart(analysisId, "pos", "Female")[0].getCount();
		int femaleNeuCount = service.getStackedBarChart(analysisId, "neu", "Female")[0].getCount();
		int femaleNegCount = service.getStackedBarChart(analysisId, "neg", "Female")[0].getCount();
		int malePosCount = service.getStackedBarChart(analysisId, "pos", "Male")[0].getCount();
		int maleNeuCount = service.getStackedBarChart(analysisId, "neu", "Male")[0].getCount();
		int maleNegCount = service.getStackedBarChart(analysisId, "neg", "Male")[0].getCount();
		
		int femaleTotCount = femalePosCount + femaleNeuCount + femaleNegCount;
		int maleTotCount   = malePosCount + maleNeuCount + maleNegCount;

		request.setAttribute("femalePosCount", femalePosCount);
		request.setAttribute("femaleNeuCount", femaleNeuCount);
		request.setAttribute("femaleNegCount", femaleNegCount);
		request.setAttribute("femaleTotCount", femaleTotCount);
		
		request.setAttribute("malePosCount", malePosCount);
		request.setAttribute("maleNeuCount", maleNeuCount);
		request.setAttribute("maleNegCount", maleNegCount);
		request.setAttribute("maleTotCount", maleTotCount);

		request.setAttribute("vendorName", vendorName);
		
		String nextPage;
		if (view != null && view.equals("gauge")) {
			nextPage = "/FBGauge.jsp";
		} else {
			nextPage = "/StackedBarCharts.jsp";
		}
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
		
		
	}

}
