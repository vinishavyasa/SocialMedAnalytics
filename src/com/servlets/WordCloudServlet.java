package com.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.WordCloudBean;
import com.google.gson.Gson;
import com.service.Service;

/**
 * Servlet implementation class WordCloudServlet
 */
@WebServlet("/WordCloudServlet")
public class WordCloudServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WordCloudServlet() {
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
		WordCloudBean[] wordCloudArrayPos;
		WordCloudBean[] wordCloudArrayNeg;
		WordCloudBean[] wordCloudArrayNeu;
		Service service= new Service();
		int analysisId=Integer.parseInt(request.getParameter("analysisId"));
		System.out.println("Printing Analysis ID in servlet: "+analysisId);
		wordCloudArrayPos= service.getWordCloudPos(analysisId, "pos");
		wordCloudArrayNeg= service.getWordCloudPos(analysisId, "neg");
		wordCloudArrayNeu= service.getWordCloudPos(analysisId, "neu");
		
		request.setAttribute("WordCloudPos", new Gson().toJson(wordCloudArrayPos));
		request.setAttribute("WordCloudNeg", new Gson().toJson(wordCloudArrayNeg));
		request.setAttribute("WordCloudNeu", new Gson().toJson(wordCloudArrayNeu));
		/*for(int i=0;i<wordCloudArrayPos.length;i++)
			System.out.println(wordCloudArrayPos[i].getText()+wordCloudArrayPos[i].getSize());*/

		String nextPage = "/WordCloud.jsp";
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
	}

}
