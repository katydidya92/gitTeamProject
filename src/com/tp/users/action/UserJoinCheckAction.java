package com.tp.users.action;

import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.admin.action.GoogleAuthentication;
import com.tp.users.db.UserBean;
import com.tp.users.db.UserDAO;

public class UserJoinCheckAction implements Action {
	private int result = 0;

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : UserEmailCheckAction_execute() 호출 ");

		UserBean ub = new UserBean();
		UserDAO udao = new UserDAO();

		HttpSession session = request.getSession();
		String userID = (String) session.getAttribute("userID");
		String userEmail = udao.getUser(userID).getUserEmail();

		StringBuffer authNum = new StringBuffer();

		for (int i = 0; i < 6; ++i) {
			int randNum = (int) (Math.random() * 10.0D);
			authNum.append(randNum);
		}
		authNum.toString();
		System.out.println("authNum 번호 : " + authNum.toString());

		result = udao.joinEmailCheck(userID);

		// 이메일 전송 스레드로
		Thread mailThread = new Thread(new Runnable() {
			@Override
			public void run() {
				// 답변 등록 메일로 알림
				System.out.println("받는사람 이메일확인" + userEmail);

				String receiver = userEmail;
				String subject = "[GTB]회원가입 인증번호 메일입니다.";
				String content = "안녕하세요 " + userID + "님, <br>" + "귀하의 인증번호는    [<b>" + authNum + "</b>]   입니다.";

				response.setContentType("text/html);charset=UTF-8");

				// smtp 정보
				try {
					Properties properties = System.getProperties();
					properties.put("mail.smtp.starttls.enable", "true");
					properties.put("mail.smtp.host", "smtp.gmail.com");
					properties.put("mail.smtp.auth", "true");
					properties.put("mail.smtp.port", "587");

					Authenticator auth = new GoogleAuthentication();
					Session s = Session.getDefaultInstance(properties, auth);
					Message message = new MimeMessage(s);

					Address receiver_address = new InternetAddress(receiver);

					// 메일 전송에 필요한 값
					message.setHeader("content-type", "text/html;charest=UTF-8");
					message.addRecipient(Message.RecipientType.TO, receiver_address);
					message.setSubject(subject);
					message.setContent(content, "text/html;charset=UTF-8");
					message.setSentDate(new java.util.Date());
					Transport.send(message);
					result = 1;
				} catch (Exception e) {
					result = -1;
					e.printStackTrace();
				}
				// 메일전송끝
			}
		});

		mailThread.start();

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		if (result == -1) { // 전송실패
			out.print("<script>");
			out.print(" alert('메일 전송 실패!');");
			out.print(" history.back();");
			out.print("</script>");

			out.close();

			return null;
		}

		ActionForward forward = new ActionForward();

		session.setAttribute("authNum", authNum);
		session.setAttribute("userEmail", userEmail);
		session.setAttribute("userID", userID);
		forward.setPath("./UserJoinCheck.do");
		forward.setRedirect(true);
		return forward;
	}
}
