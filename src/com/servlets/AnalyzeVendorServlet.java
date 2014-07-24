package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.UserBean;
import com.service.Service;

/**
 * Servlet implementation class AnalyzeVendor
 */
@WebServlet("/AnalyzeVendorServlet")
public class AnalyzeVendorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public AnalyzeVendorServlet() {
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
		Service service = new Service();
		double[] percentageArray = new double[4];

		String socialNetwork = request.getParameter("sN");
		String vendorName = (String) request.getSession().getAttribute(
				"vendorName");

		PrintWriter out = response.getWriter();
		try {
			String fromPage = request.getParameter("fromPage");
			String dateRange = request.getParameter("dateRange");

			if (fromPage != null && fromPage.equalsIgnoreCase("loginPage")) {
				/*
				 * It is from login page.
				 */
				String email = request.getParameter("email_login");
				System.out.println("email from login form is " + email);

				UserBean user = service.getUser(email);
				vendorName = user.getVendorName();
				System.out.println("VendorName objected from db is "
						+ vendorName);
				request.setAttribute("vendorName", vendorName);

				request.getSession().setAttribute("vendorName", vendorName);

				UserBean user1 = service.getUser(email);
				String userName = user1.getUserName();
				System.out.println(" userName objected from db is " + userName);
				request.setAttribute(" userName", userName);

				request.getSession().setAttribute("userName", userName);

			} else if (dateRange != null && socialNetwork != null) {

				String[] parts = dateRange.split("- ");
				String fromDateString = parts[0];
				String toDateString;
				if (parts.length > 1) {
					toDateString = parts[1];
					/*
					 * Get the required params.
					 */
					String userName = (String) request.getSession()
							.getAttribute("userName");

					if (vendorName == null) {
						vendorName = (String) request.getSession()
								.getAttribute("vendorName");
					}
					if (socialNetwork == null || socialNetwork.length() == 0) {
						socialNetwork = request.getParameter("sN");
					}
					/*
					 * Add to history if required.
					 */
					String fromHistoryPage = (String) request
							.getParameter("fromHistoryPage");
					if (fromHistoryPage == null
							|| !fromHistoryPage.equals("yes")) {
						service.addHistory(userName, vendorName, socialNetwork,
								fromDateString, toDateString);
					}
					percentageArray = service.AnalyzeVendorFeeds(vendorName,
							socialNetwork, fromDateString, toDateString);
					request.setAttribute("percentageArray", percentageArray);
					out.println(percentageArray);

					/*
					 * Save analysisId in session.
					 */
					request.getSession().setAttribute("analysisId",
							Integer.toString((int) percentageArray[3]));
				}
			}

			String nextPage = "/Analysis.jsp";
			RequestDispatcher dispatcher = getServletContext()
					.getRequestDispatcher(nextPage);
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
