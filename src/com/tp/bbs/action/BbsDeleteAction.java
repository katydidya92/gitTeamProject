package com.tp.bbs.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tp.bbs.db.BbsBean;
import com.tp.bbs.db.BbsDAO;

public class BbsDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("M : BbsDeleteAction_execute() 호출");

		// 한글데이터 처리
		request.setCharacterEncoding("UTF-8");

		String userID = request.getParameter("userID");
		int bbsID = Integer.parseInt(request.getParameter("bbsID"));

		BbsBean bbs = new BbsDAO().getBbs(bbsID);
		System.out.println(bbs);
		// out객체는 데이터를 html형태로 쓸수있게 만들어줌, html페이지 -> js사용가능
		BbsDAO bdao = new BbsDAO();
		bdao.deleteBbs(bbs, userID);
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./BbsList.bo");
		/* forward.setPath("./BbsList.do"); */

		forward.setRedirect(true);
		// true - sendRedirect() 방식으로 이동 (주소,화면 변경O)
		// false - forward() 방식으로 이동 (주소 변경x, 화면 변경 O)

		return forward;

	}

}
