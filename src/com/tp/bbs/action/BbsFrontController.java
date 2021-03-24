package com.tp.bbs.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

 
@WebServlet("*.bbs")
public class BbsFrontController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Goods-doProcess 호출");
		
		System.out.println("\n 1. 가상주소 계산 ");
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		
		String command = requestURI.substring(contextPath.length());
		System.out.println("command : "+command);
		System.out.println("  1. 가상주소 계산 ");
		
		
		System.out.println("\n 2. 가상주소 매핑 ");
		Action action = null;
		ActionForward forward = null;
		
		//////////////////////////////////////////////////////////////////
		if(command.equals("/BbsAdd.bbs")){
			System.out.println("C : bbsAdd.bbs호출");
			System.out.println("C : view 로 이동");
			
			forward = new ActionForward();
			forward.setPath("./board/bdWrite.jsp");
			forward.setRedirect(false);
			  
		}
		else if(command.equals("/bbsAddAction.bbs")){
			System.out.println("C: bbsAddAction.bbs");
			System.out.println("C : DB 등록후 Veiw");
			
			 action = new BbsAddAction();
			 
			 try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		else if(command.equals("/BbsList.bbs")){
			System.out.println("C : BbsList.bbs");
			System.out.println("C : DB에서 가져와 ");
			
			action = new BbsListAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		else if(command.equals("/BbsList22.bbs")){
			System.out.println("C : BbsList22.bbs");
			System.out.println("C : DB에서 가져와 ");
			
			action = new BbsListAction22();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		else if(command.equals("/BbsList33.bbs")){
			System.out.println("C : BbsList33.bbs");
			System.out.println("C : DB에서 가져와 ");
			
			action = new BbsListAction33();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		else if(command.equals("/BbsList44.bbs")){
			System.out.println("C : BbsList44.bbs");
			System.out.println("C : DB에서 가져와 ");
			
			action = new BbsListAction44();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		  
		System.out.println(" 2. 가상주소 매핑 ");

		
		System.out.println("\n 3. 페이지 이동 ");
		if(forward != null){
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			} else{
				RequestDispatcher dis =
						request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
				 
			}
		}
		System.out.println(" 3. 페이지 이동 ");
	}

	
	
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
}

