package com.tp.bbs.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tp.bbs.db.BbsBean;
import com.tp.bbs.db.BbsDAO;
import com.tp.bbs.db.FileDAO;

public class BbsModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("M : BbsModifyAction_execute 호출");

		
		
		// form 정보 저장하고
		int bbsID = Integer.parseInt(request.getParameter("bbsID"));
		

		// DAO 하고
		BbsDAO bbdao = new BbsDAO();
		BbsBean bbsDetail = bbdao.getBbs(bbsID);
		
		// 파일 처리
		FileDAO fdao = new FileDAO();
		String fileName = fdao.getFile(1);

		// 담아가지고
		request.setAttribute("bbsDetail", bbsDetail);
		request.setAttribute("fileName", fileName);

		// 페이지이동
		ActionForward forward = new ActionForward();
		forward.setPath("./board/bbsModify.jsp");
		forward.setRedirect(false);
		return forward;

	}

}
