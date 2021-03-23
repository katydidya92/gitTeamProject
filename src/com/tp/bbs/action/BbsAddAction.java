package com.tp.bbs.action;

import java.sql.Timestamp;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.tp.bbs.db.BbsBean;
import com.tp.bbs.db.BbsDAO;

public class BbsAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : BbsAddAction_execute 호출");
		
		request.getParameter("UTF-8");
		
		ServletContext ctx = request.getServletContext();
		String realpath = ctx.getRealPath("/upload");
		System.out.println(" M : realpath :::: "+realpath);
		
		
		int maxSize = 10*1024*1024;
		
		MultipartRequest multi =
				new MultipartRequest(
						request,
						realpath,
						maxSize,
						"UTF-8",
						new DefaultFileRenamePolicy() 
						);
		
		System.out.println("M : 파일업로드  완료");
		
		BbsBean bbs = new BbsBean();
		
		bbs.setBbs_category(Integer.parseInt(multi.getParameter("bbs_category")));
		bbs.setBbs_title(multi.getParameter("bbs_title"));
		bbs.setBbs_content(multi.getParameter("bbs_content"));
		bbs.setBbs_date(new Timestamp(System.currentTimeMillis()));
		 
		
		/*
		bbs.setFileID(Integer.parseInt(multi.getParameter("fileID")));
		System.out.println("fileID:::::::::::::::      "+bbs.getFileID());
		*/
		
		System.out.println("M : 파라미터 저장완료");
		
		BbsDAO bbsdao = new BbsDAO();
		
		bbsdao.insertBbs(bbs);
		
		System.out.println("DAO : insertBbs 완료");
		
		ActionForward forward = new ActionForward();
		forward.setPath("./BbsList.bbs");
		forward.setRedirect(true);
		
		return forward;
	}

}
