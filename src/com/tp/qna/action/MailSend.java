package com.tp.qna.action;

import java.io.PrintWriter;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.admin.action.GoogleAuthentication;

public class MailSend implements Action {
	private int result = 0;

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");

		String sender = request.getParameter("sender");
		String receiver = request.getParameter("receiver");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");

		Thread mailThread = new Thread(new Runnable() {
			@Override
			public void run() {

				Properties prop = System.getProperties();
				prop.put("mail.smtp.starttls.enable", "true");
				prop.put("mail.smtp.host", "smtp.gmail.com");
				prop.put("mail.smtp.auth", "true");
				prop.put("mail.smtp.port", "587");
				Authenticator auth = new GoogleAuthentication();

				Session session = Session.getDefaultInstance(prop, auth);
				MimeMessage msg = new MimeMessage(session);

				try {
					msg.setSentDate(new Date());
					msg.setFrom(new InternetAddress(sender));
					InternetAddress to = new InternetAddress(receiver);
					// 이메일을 다중 발송하는 것도 가능
					// InternetAddress[] toList = {to};
					// msg.setRecipient(Message.RecipientType.TO, toList);
					msg.setRecipient(Message.RecipientType.TO, to);
					msg.setSubject(subject, "UTF-8");
					msg.setText(content, "UTF-8");
					Transport.send(msg);
					
					result = 1;
				} catch (Exception e) {
					result = -1;
				}
			}
		});

		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();
		if (result == -1) {
			out.println("<script>");
			out.println("alert('전송에 실패했습니다 관리자에게 문의하세요!');");
			out.println("history.back();");
			out.println("</script>");
			out.close();

			return null;
		} else {
			out.println("<script>");
			out.println("alert('전송 완료!');");
			out.println("location.href='./Main.do';");
			out.println("</script>");
			out.close();

			return null;
		}

	}

}
