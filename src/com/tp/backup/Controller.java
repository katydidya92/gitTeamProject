package com.tp.backup;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 원하는 주소 지정
/*@WebServlet("*.ba")*/
public class Controller extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		
		String command = requestURI.substring(contextPath.length());
		System.out.println(command);
		
		Action action = null;
		ActionForward forward = null;
		
		System.out.println("\n 2. 가상 주소 매핑");
		if(command.equals("/GoodsAdd.ag")){
							// 해당 주소 작성
			forward = new ActionForward();
			forward.setPath("admingoods/admin_goods_write.jsp");
			forward.setRedirect(false);
		} 
		else if(command.equals("/GoodsAddAction.ag")) {
								// 해당 주소 작성
			/*action = new Action();*/
			// action 페이지 생성 후 작성
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		System.out.println("\n 3. 페이지 이동");
		if(forward != null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
		}
	}
}
