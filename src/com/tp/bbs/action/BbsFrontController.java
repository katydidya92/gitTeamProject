package com.tp.bbs.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 원하는 주소 지정
@WebServlet("*.bo")
public class BbsFrontController extends HttpServlet {
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		
		System.out.println("command : "+command);
		System.out.println("  1. 가상주소 계산 ");
		
		Action action = null;
		ActionForward forward = null;
		
		System.out.println("\n 2. 가상 주소 매핑");
		if(command.equals("/BbsAdd.bo")){
			System.out.println("C : bbsAdd.bo호출");
			System.out.println("C : view 로 이동");
			
			forward = new ActionForward();
			forward.setPath("./board/bbsWrite.jsp");
			forward.setRedirect(false);
			  
		}
		else if(command.equals("/bbsAddAction.bo")){
			System.out.println("C: bbsAddAction.bo");
			System.out.println("C : DB 등록후 Veiw");
			
			 action = new BbsAddAction();
			 
			 try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/BbsList.bo")){
			System.out.println("C : BbsList.bo");
			System.out.println("C : DB에서 가져와서 사용 ");
			
			action = new BbsListAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		else if(command.equals("/BbsList3.bo")){
			System.out.println("C : BbsList.bo");
			System.out.println("C : DB에서 가져와서 사용 ");
			
			action = new BbsListAction3();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		else if(command.equals("/BbsView.bo")){
			System.out.println("C : BbsDetail.bo 호출");
			System.out.println("c: DB에서 가져와서 view가기");
			
			action = new BbsViewAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/BbsModify.bo")){
			System.out.println("C : BbsModify.bo 호추");
			System.out.println("C : DB 가져와  view");
			
			action = new BbsModifyAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		else if(command.equals("/BbsModifyEnd.bo")){
			System.out.println("C: /bbsModifyEndAction 호출");
			System.out.println("C : DB 가서 수정하고 Detail화면으로");
			
			action = new BbsModifyEndAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/BbsDelete.bo")){
			System.out.println("C: /BbsDelete 호출");
			System.out.println("C : DB 가서 수정하고 Detail화면으로");
			
			action = new BbsDeleteAction();
			
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
		System.out.println(" 3. 페이지 이동 ");
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Bbs-doGet 호출"); 
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Bbs-doPost 호출");
		doProcess(request, response);
	}

}
