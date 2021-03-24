package com.tp.bbs.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tp.bbs.db.BbsBean;
import com.tp.bbs.db.BbsDAO;

public class BbsListAction44 implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : BbsListAction44() 호출");
		
		BbsDAO bbsdao = new BbsDAO();

		List<BbsBean> bbsList = bbsdao.getBbsList();
		
		request.setAttribute("bbsList", bbsList);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./board/bdList44.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
