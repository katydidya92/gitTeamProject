package com.tp.users.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tp.users.db.UserDAO;

public class UserJoinCheckAction2 implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : UserEmailCheckAction_execute() 호출 ");

		HttpSession session = request.getSession();
		String userID = (String) session.getAttribute("userID");

		UserDAO udao = new UserDAO();
		udao.joinCheck(userID);

		session.removeAttribute("userEmail");
		session.removeAttribute("authNum");

		ActionForward forward = new ActionForward();
		forward.setPath("./Main.do");
		forward.setRedirect(true);
		return forward;
	}
}
