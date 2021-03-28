package com.tp.bbs.action;

import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.tp.bbs.bean.FileBean;
import com.tp.bbs.db.BbsBean;
import com.tp.bbs.db.BbsDAO;
import com.tp.bbs.db.FileDAO;

public class BbsAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("M : PageAddAction_execute() 호출");

		// 한글데이터 처리
		request.setCharacterEncoding("UTF-8");

		// 파일 처리
		ServletContext ctx = request.getServletContext();
		String realpath = ctx.getRealPath("/upload").replace("\\\\", "/");
		System.out.println(" M : ctx :::: " + ctx);
		System.out.println(" M : realpath :::: " + realpath);

		FileDAO fdao = new FileDAO();

		int maxSize = 10 * 1024 * 1024; // 10 MB

		MultipartRequest multi = new MultipartRequest(request, realpath, maxSize, "UTF-8",
				new DefaultFileRenamePolicy());

		Enumeration fileNames = multi.getFileNames();

		String parameter = (String) fileNames.nextElement();
		String fileName = multi.getOriginalFileName(parameter);
		String fileRealName = multi.getFilesystemName(parameter);

		String userID = multi.getParameter("userID"); // 세션 처리 후 변경

		fdao.upload(fileName, fileRealName, userID);

		/*FileBean fb = new FileBean();
		fb.setFileName(fileName);
		fb.setFileRealName(fileRealName);*/
		
		System.out.println("fileName : " + fileName);
		System.out.println("fileRealName : " + fileRealName);
		System.out.println("userID : " + userID); // 세션 아이디로 추후 변경
		
		// 파일 작성 시 bbsID 받아오는 것에서 문제 발생 
		// 추후 DAO랑 수정해야 함
		
		////////////////////////////
		// 게시글 작성
		BbsBean bbs = new BbsBean();
		BbsDAO bdao = new BbsDAO();

		bbs.setBbs_category(Integer.parseInt(multi.getParameter("bbs_category")));
		bbs.setBbs_title(multi.getParameter("bbs_title"));
		bbs.setBbs_content(multi.getParameter("bbs_content"));
		bbs.setUserID(multi.getParameter("userID"));
		bbs.setUserNickName(multi.getParameter("userNickName"));
		bbs.setIp(request.getRemoteAddr());

		bdao.insertBbs(bbs);

		System.out.println("BbsAddAction : " + bbs);

		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./Main.do");
		/* forward.setPath("./BbsList.bo"); */

		forward.setRedirect(true);
		// true - sendRedirect() 방식으로 이동 (주소,화면 변경O)
		// false - forward() 방식으로 이동 (주소 변경x, 화면 변경 O)

		return forward;

	}

}
