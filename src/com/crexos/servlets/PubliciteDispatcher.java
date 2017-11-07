package com.crexos.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PubliciteDispatcher extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*
	 * Liste pages JSP
	 */
	private final String PAGE_HOME = "/home";
	private final String PAGE_MAJEUR = "/WEB-INF/majeur.jsp";
	private final String PAGE_MINEUR = "/WEB-INF/mineur.jsp";
	private final String PAGE_ERROR = "/error.jsp";
	
	
	public PubliciteDispatcher() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String ageStr = request.getParameter("age");
		String pageJsp =PAGE_HOME;

		RequestDispatcher dispatcher;
		ServletContext ctx = getServletContext();

		if(ageStr != null && !ageStr.isEmpty())
		{
			try
			{
				int age = Math.abs(Integer.parseInt(ageStr));
				if(age >= 18)
					pageJsp = PAGE_MAJEUR;
				else 
					pageJsp = PAGE_MINEUR;
			}
			catch(NumberFormatException e) 
			{	
				pageJsp = PAGE_ERROR;
			}
		}

		dispatcher = ctx.getRequestDispatcher(pageJsp);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
