package com.tp.bbs.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tp.bbs.db.BbsBean;
import com.tp.bbs.db.BbsDAO;

public class BbsListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : BbsListAction() 호출");
		
		BbsDAO bbsdao = new BbsDAO();
		
		List<BbsBean> bbsList = bbsdao.getBbsList();
		request.setAttribute("bbsList", bbsList);
		
/////////////////// 페이징 처리시작///////////////////////////////
		
		////////////글 전체 갯수/////////////////////////////////
		int cnt = bbsdao.getboardCount();
		
		System.out.println("글갯수 확인 cnt  ^^^^       :"+cnt);
		
        ////////////총 페이지수/////////////////////////////////
		
		////////////한페이지당 페이지수 /////////////////////////////
		int pageSize = 5;
		
		String pageNum = request.getParameter("pageNum");
		
		if(pageNum == null){ pageNum="1";}
		
		System.out.println("pageNum  확인 &&&&&&&&&&    "+pageNum);
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		
		System.out.println("currentPage    "+currentPage);
		System.out.println("startRow    "+startRow);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./board/bdList.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
