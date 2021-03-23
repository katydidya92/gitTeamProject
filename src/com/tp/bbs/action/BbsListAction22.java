package com.tp.bbs.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tp.bbs.db.BbsBean;
import com.tp.bbs.db.BbsDAO;

public class BbsListAction22 implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : BbsListAction22() 호출");
		
		BbsDAO bbsdao = new BbsDAO();

		List<BbsBean> bbsList = bbsdao.getBbsList();
		
		request.setAttribute("bbsList", bbsList);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./board/bdList22.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
