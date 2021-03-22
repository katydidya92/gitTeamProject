package com.tp.bbs.bean;

import java.sql.Timestamp;

public class CmtBean {
	private int cmtID;
	private String userNickName;
	private String cmt_content;
	private int bbsID;
	private int cmt_seq;
	private int cmt_lev;
	private int cmt_available;
	private int bbs_category;
	private Timestamp cmt_date;
	private String ip;
	private int likeID;

	public int getCmtID() {
		return cmtID;
	}

	public void setCmtID(int cmtID) {
		this.cmtID = cmtID;
	}

	public String getUserNickName() {
		return userNickName;
	}

	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}

	public String getCmt_content() {
		return cmt_content;
	}

	public void setCmt_content(String cmt_content) {
		this.cmt_content = cmt_content;
	}

	public int getBbsID() {
		return bbsID;
	}

	public void setBbsID(int bbsID) {
		this.bbsID = bbsID;
	}

	public int getCmt_seq() {
		return cmt_seq;
	}

	public void setCmt_seq(int cmt_seq) {
		this.cmt_seq = cmt_seq;
	}

	public int getCmt_lev() {
		return cmt_lev;
	}

	public void setCmt_lev(int cmt_lev) {
		this.cmt_lev = cmt_lev;
	}

	public int getCmt_available() {
		return cmt_available;
	}

	public void setCmt_available(int cmt_available) {
		this.cmt_available = cmt_available;
	}

	public int getBbs_category() {
		return bbs_category;
	}

	public void setBbs_category(int bbs_category) {
		this.bbs_category = bbs_category;
	}

	public Timestamp getCmt_date() {
		return cmt_date;
	}

	public void setCmt_date(Timestamp cmt_date) {
		this.cmt_date = cmt_date;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public int getLikeID() {
		return likeID;
	}

	public void setLikeID(int likeID) {
		this.likeID = likeID;
	}

	@Override
	public String toString() {
		return "CmtBean [cmtID=" + cmtID + ", userNickName=" + userNickName + ", cmt_content=" + cmt_content
				+ ", bbsID=" + bbsID + ", cmt_seq=" + cmt_seq + ", cmt_lev=" + cmt_lev + ", cmt_available="
				+ cmt_available + ", bbs_category=" + bbs_category + ", cmt_date=" + cmt_date + ", ip=" + ip
				+ ", likeID=" + likeID + "]";
	}
	
	
}
