package com.tp.bbs.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tp.bbs.bean.FileBean;
import com.tp.bbs.db.BbsBean;
import com.tp.bbs.db.BbsDAO;
import com.tp.bbs.db.FileDAO;

public class BbsViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("BbsDetailAction_execute 호출");
		
		// 정보저장
		int bbsID = Integer.parseInt(request.getParameter("bbsID"));
		
		//DAO 생성
		BbsDAO bbdao = new BbsDAO();
		BbsBean bbsDetail = bbdao.getBbs(bbsID);
		
		// 파일 처리
		FileDAO fdao = new FileDAO();
		String fileName = fdao.getFile(1);
		
		
		// request영역에 저장
		request.setAttribute("bbsDetail", bbsDetail);
		request.setAttribute("fileName", fileName);
		
		System.out.println(")))))))))))))))))))))))))))))"+bbsDetail);
		System.out.println(")))))))))))))))))))))))))))))"+fileName);
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./board/bbsView.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
