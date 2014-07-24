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
@WebServlet("/ShowPDFServlet")
public class ShowPDFServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public ShowPDFServlet() {
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

		String socialNetwork = request.getParameter("sN");
		System.out.println("socialnetwork: " + socialNetwork);
		String vendorName = (String) request.getParameter("vendorName");
		System.out.println("vendorname: " + vendorName);
		

		BufferedOutputStream bos = null;
		BufferedInputStream bis = null;
		try {
			ServletOutputStream out = response.getOutputStream();
			BufferedReader br = new BufferedReader(new FileReader("results/analysisId.txt"));
			int analysisId = Integer.parseInt(br.readLine().toString().trim());
			System.out.println("analysis Id: " + analysisId);
			File file = new File("results/Anlysis_" + analysisId
					+ "_merged.pdf");

			response.setContentType("application/pdf");
			response.setContentLength((int) file.length());
			response.setHeader("Content-Disposition",
					"inline; filename=results/Anlysis_" + analysisId
							+ "_merged.pdf");
			FileInputStream fis = new FileInputStream(file);
			bis = new BufferedInputStream(fis);

			bos = new BufferedOutputStream(out);
			byte[] buff = new byte[2048];
			int bytesRead;
			while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
				bos.write(buff, 0, bytesRead);
			}
		} catch (final IOException e) {
			System.out.println("IOException.");
			throw e;
		} finally {
			if (bis != null)
				bis.close();
			if (bos != null)
				bos.close();
		}

	}

}
