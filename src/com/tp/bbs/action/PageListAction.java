package com.tp.bbs.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PageListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("M : PageListAction_execute() 호출");

		// 한글데이터 처리 
		request.setCharacterEncoding("UTF-8");
		
		BbsDAO bbsDAO = new BbsDAO();

		int currentPage = 1;
        if(request.getParameter("currentPage") != null) { 
        	currentPage = Integer.parseInt(request.getParameter("currentPage")); 
        }
        
        int pagePerCol = 3;
        int totalRowCount = bbsDAO.getBbsCount(); // 전체 컬럼 수
        int pagePerRow = 6; // 한 페이지에 출력할 컬럼 수
        int startRow = (currentPage-1) * pagePerRow; // 시작 페이지
        int endPage = totalRowCount / pagePerRow; // 마지막 페이지
        if(totalRowCount % pagePerRow != 0) { // 전체 페이지 / 컬럼을 나눴을 때 0이 아니면 +1
        	endPage++;
        }
        
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalRowCount", totalRowCount);
        request.setAttribute("pagePerRow", pagePerRow);
        request.setAttribute("pagePerCol", pagePerCol);
        request.setAttribute("endPage", endPage);
        request.setAttribute("bbsList", bbsDAO.getBbsList(startRow, pagePerRow));
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./comunity/page.jsp");
		
		forward.setRedirect(false);
		// true - sendRedirect() 방식으로 이동 (주소,화면 변경O)
		// false - forward() 방식으로 이동 (주소 변경x, 화면 변경 O)
		
		return forward;
	}

}
