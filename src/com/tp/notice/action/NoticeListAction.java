package com.tp.notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.admin.action.PagingVO;
import com.tp.notice.db.NoticeDAO;


public class NoticeListAction implements Action {

@Override
public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("M : NoticeListAction_execute() 호출");

		// 한글데이터 처리 
		request.setCharacterEncoding("UTF-8");
		
		NoticeDAO bbsDAO = new NoticeDAO();
		PagingVO pvo = new PagingVO();
		String pageNum = request.getParameter("pageNo");
		if (pageNum == null) {
			pageNum = "1";
		}
		
		int pageNo = Integer.parseInt(pageNum);
		
		pvo.setPageNo(pageNo);
		pvo.setTotalCount(bbsDAO.getBbsCount());
		request.setAttribute("pvo", pvo);
        request.setAttribute("bbsList", bbsDAO.getBbsList(pvo));
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./notice/noticeList.jsp");
		
		forward.setRedirect(false);
		// true - sendRedirect() 방식으로 이동 (주소,화면 변경O)
		// false - forward() 방식으로 이동 (주소 변경x, 화면 변경 O)
		
		return forward;
		
	}

}
