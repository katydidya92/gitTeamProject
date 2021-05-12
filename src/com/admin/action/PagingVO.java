package com.admin.action;

public class PagingVO {
	
	private int pageNo; // 페이지 번호
	private int firstPageNo; // 첫 번째 페이지 번호
	private int prevPageNo; // 이전 페이지 번호
	private int nextPageNo; // 다음 페이지 번호
	private int finalPageNo; // 마지막 페이지 번호
	
	private int pagingBoxCount; // 출력하고 싶은 페이징 네비 박스 수
	private int startPageNo; // 시작 페이지 (페이징 네비 기준)
	private int endPageNo; // 끝 페이지 (페이징 네비 기준)
	
	private int pagePerCol; // 게시 글 세로 수
	private int totalCount; // 게시 글 전체 수
	private int startRow; // DB에서 출력할 Row 시작번호(DB에서 검색하기 위해 사용하는 수(limit(?,?)의 첫 번째 ?)
	private int showPageRow; // 출력하고 싶은 게시글 수출력하고 싶은 게시글 수(DB에서 검색해서 보여주는 ROW 수(limit(?,?)의 두 번째 ?)

	public int getShowPageRow() {
		return showPageRow;
	}

	public void setShowPageRow(int showPageRow) {
		this.showPageRow = showPageRow;
	}

	public int getFirstPageNo() {
		return firstPageNo;
	}

	public void setFirstPageNo(int firstPageNo) {
		this.firstPageNo = firstPageNo;
	}

	public int getPrevPageNo() {
		return prevPageNo;
	}

	public void setPrevPageNo(int prevPageNo) {
		this.prevPageNo = prevPageNo;
	}

	public int getStartPageNo() {
		return startPageNo;
	}

	public void setStartPageNo(int startPageNo) {
		this.startPageNo = startPageNo;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getEndPageNo() {
		return endPageNo;
	}

	public void setEndPageNo(int endPageNo) {
		this.endPageNo = endPageNo;
	}

	public int getNextPageNo() {
		return nextPageNo;
	}

	public void setNextPageNo(int nextPageNo) {
		this.nextPageNo = nextPageNo;
	}

	public int getFinalPageNo() {
		return finalPageNo;
	}

	public void setFinalPageNo(int finalPageNo) {
		this.finalPageNo = finalPageNo;
	}

	public int getPagingBoxCount() {
		return pagingBoxCount;
	}

	public void setPagingBoxCount(int pagingBoxCount) {
		this.pagingBoxCount = pagingBoxCount;
	}

	public int getPagePerCol() {
		return pagePerCol;
	}

	public void setPagePerCol(int pagePerCol) {
		this.pagePerCol = pagePerCol;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		this.makePaging();
	}

	private void makePaging() {
		// 기본 값 설정
		if (this.totalCount == 0) return; // 게시 글 전체 수가 없는 경우
		if (this.pageNo == 0) this.setPageNo(1);
		if (this.showPageRow == 0) this.setShowPageRow(6);
		if (this.pagingBoxCount == 0) this.setPagingBoxCount(5);
		if (this.startRow == 0) this.setStartRow(0);
		if (this.pagePerCol == 0) this.setPagePerCol(3);
		this.setFirstPageNo(1); // 첫 번째 페이지 번호
		
		int startRow = (pageNo - 1) * showPageRow;
		this.setStartRow(startRow);

		int finalPage = (totalCount + (showPageRow - 1)) / showPageRow; // 마지막 페이지
		if (this.pageNo > finalPage)
			this.setPageNo(finalPage); 

		if (this.pageNo < 0 || this.pageNo > finalPage)
			this.pageNo = 1; // 현재 페이지 유효성 체크

		boolean isNowFirst = pageNo == 1 ? true : false; // 시작 페이지 (전체)
		boolean isNowFinal = pageNo == finalPage ? true : false; // 마지막 페이지 (전체)

		int startPage = ((pageNo - 1) / pagingBoxCount) * pagingBoxCount + 1; // 시작 페이지 (페이징 네비 기준)
		int endPage = startPage + pagingBoxCount - 1; // 끝 페이지 (페이징 네비 기준)

		if (endPage > finalPage) { // [마지막 페이지 (페이징 네비 기준) > 마지막 페이지] 보다 큰 경우
			endPage = finalPage;
		}

		if (isNowFirst) {
			this.setPrevPageNo(1); // 이전 페이지 번호
		} else {
			this.setPrevPageNo(((pageNo - 1) < 1 ? 1 : (pageNo - 1))); // 이전 페이지 번호
		}

		this.setStartPageNo(startPage); // 시작 페이지 (페이징 네비 기준)
		this.setEndPageNo(endPage); // 끝 페이지 (페이징 네비 기준)

		if (isNowFinal) {
			this.setNextPageNo(finalPage); // 다음 페이지 번호
		} else {
			this.setNextPageNo(((pageNo + 1) > finalPage ? finalPage : (pageNo + 1))); // 다음 페이지 번호
		}

		this.setFinalPageNo(finalPage); // 마지막 페이지 번호
	}

}
