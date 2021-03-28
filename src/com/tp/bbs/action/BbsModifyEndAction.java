package com.tp.bbs.action;

import java.io.File;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.tp.bbs.db.BbsBean;
import com.tp.bbs.db.BbsDAO;
import com.tp.bbs.db.FileDAO;

public class BbsModifyEndAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : bbsModifyEndAction 호출");

		request.setCharacterEncoding("UTF-8");

		ActionForward forward = new ActionForward();
		// 파일저장

		ServletContext ctx = request.getServletContext();
		String realpath = ctx.getRealPath("/upload");
		System.out.println(" M : ctx :::: " + ctx);
		System.out.println(" M : realpath :::: " + realpath);
		
		int maxSize = 10 * 1024 * 1024;

		MultipartRequest multi = new MultipartRequest(request, realpath, maxSize, "UTF-8",
				new DefaultFileRenamePolicy());
		/*FileDAO fdao = new FileDAO();
		
		
		
		String userID = multi.getParameter("userID"); // 세션 처리 후 변경
		
		int bbsID = Integer.parseInt(request.getParameter("bbsID"));
		
		String fileName = "";
		File file = multi.getFile("fileName");
		String prev = fdao.getFile(1); // bbsID
		System.out.println(prev);
		File prevFile = new File(realpath + "/" + prev);
		if (prevFile.exists()) {
			prevFile.delete();
		}*/
		// 정보저장하고
		BbsBean bb = new BbsBean();

		bb.setBbsID(Integer.parseInt(multi.getParameter("bbsID")));
		// bb.setBbs_ref(Integer.parseInt(multi.getParameter("bbs_ref")));
		// bb.setBbs_ref(Integer.parseInt(multi.getParameter("bbs_ref")));
		// bb.setBbs_seq(Integer.parseInt(multi.getParameter("bbs_seq")));
		// bb.setBbs_lev(Integer.parseInt(multi.getParameter("bbs_lev")));
		// bb.setBbs_available(Integer.parseInt(multi.getParameter("bbs_available")));
		bb.setBbs_category(Integer.parseInt(multi.getParameter("bbs_category")));
		bb.setBbs_title(multi.getParameter("bbs_title"));
		bb.setBbs_content(multi.getParameter("bbs_content"));
		// bb.setBbs_readcount(Integer.parseInt(multi.getParameter("bbs_readcount")));
		// bb.setUserID(multi.getParameter("userID"));
		// bb.setUserNickName(multi.getParameter("userNickName"));
		// bb.setFileID(Integer.parseInt(multi.getParameter("fileID")));
		// bb.setCmtID(Integer.parseInt(multi.getParameter("cmtID")));
		// bb.setBest(Integer.parseInt(multi.getParameter("best")));
		// bb.setIsAdmin(Integer.parseInt(multi.getParameter("isAdmin")));
		// bb.setIp(multi.getParameter("ip"));

		System.out.println(")))))))))))))))))))))))" + bb);

		// DAO 처리하고
		BbsDAO bbdao = new BbsDAO();
		bbdao.updateBbs(bb);

		System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$" + bb.getBbsID());
		// 정보 저장해서
		/*int bbsID = bb.getBbsID();*/

		// 페이지 이동
		
		forward.setPath("/BbsView.bo?bbsID="+bb.getBbsID());
		/*forward.setPath("/Main.do");*/
		forward.setRedirect(false);

		return forward;

	}

}
