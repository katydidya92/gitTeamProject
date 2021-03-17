package com.tp.backup;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("M : GoodsAddAction_execute() 호출");
		
		
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./GoodsList.ag");
		
		forward.setRedirect(true);
		// true - sendRedirect() 방식으로 이동 (주소,화면 변경O)
		// false - forward() 방식으로 이동 (주소 변경x, 화면 변경 O)
		
		return forward;
	}

}
