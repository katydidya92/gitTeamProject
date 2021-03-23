package com.tp.bbs.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tp.bbs.db.BbsBean;
import com.tp.bbs.db.BbsDAO;

public class BbsDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("BbsDetailAction_execute 호출");
		
		// 정보저장
		int bbsID = Integer.parseInt(request.getParameter("bbsID"));
		
		
		//DAO 생성
		BbsDAO bbdao = new BbsDAO();
		BbsBean bbsDetail = bbdao.getBbs(bbsID);
		
		// request영역에 저장
		request.setAttribute("bbsDetail", bbsDetail);
		// 페이지 이동
		
		
		return null;
	}

}
