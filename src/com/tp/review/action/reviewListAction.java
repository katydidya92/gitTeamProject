package com.tp.review.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.admin.action.PagingVO;
import com.tp.bbs.db.FileDAO;

public class reviewListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("M : reviewListAction_execute() 호출");

		// 한글데이터 처리
		request.setCharacterEncoding("UTF-8");

		ReDAO rdao = new ReDAO();
		PagingVO pvo = new PagingVO();

		String pageNum = request.getParameter("pageNo");
		if (pageNum == null) {
			pageNum = "1";
		}

		int pageNo = Integer.parseInt(pageNum);

		pvo.setPageNo(pageNo);

		String sc_ck = request.getParameter("sc_ck");
		String search = request.getParameter("search");
		String order_type = request.getParameter("order_type");
		System.out.println("sc_ck : " + sc_ck);
		System.out.println("search : " + search);
		System.out.println("order_type : " + order_type);

		List bbsList;

		if (sc_ck == null || sc_ck.equals("null")) {
			pvo.setTotalCount(rdao.getBbsCount());
			bbsList = rdao.getBbsList(pvo);
		} else if (sc_ck.equals("userID") || sc_ck.equals("userNickName") || sc_ck.equals("bbs_title")
				|| sc_ck.equals("bbs_content")) {
			pvo.setTotalCount(rdao.getBbsCount(sc_ck, search));
			bbsList = rdao.getBbsList(pvo, sc_ck, search);
		} else {
			pvo.setTotalCount(rdao.getBbsCount());
			bbsList = rdao.getBbsList(pvo);
		}

		if (order_type == null || order_type.equals("null")) {
			pvo.setTotalCount(rdao.getBbsCount());
			bbsList = rdao.getBbsList(pvo);
		} else if (order_type.equals("NEW") || order_type.equals("READCOUNT") || order_type.equals("LIKE")
				|| order_type.equals("CMT")) {
			pvo.setTotalCount(rdao.getBbsCount());
			bbsList = rdao.getBbsList(pvo, order_type);
		} else {
			pvo.setTotalCount(rdao.getBbsCount());
			bbsList = rdao.getBbsList(pvo);
		}

		request.setAttribute("pvo", pvo);
		request.setAttribute("sc_ck", sc_ck);
		request.setAttribute("search", search);
		request.setAttribute("bbsList", bbsList);

		// 파일 처리
		FileDAO fdao = new FileDAO();
		ArrayList fileName = fdao.getFileList();

		// 담아가지고
		request.setAttribute("fileName", fileName);

		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./review/reviewListPage.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
