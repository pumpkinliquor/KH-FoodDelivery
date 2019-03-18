package com.kh.food.admin.notice.model.vo;

import java.io.Serializable;
import java.util.Date;

public class MemberNotice implements Serializable{

	private static final long serialVersionUID = -7196829967752477232L;
	private int noticeNum;
	private String noticeTitle;
	private Date writeDate;
	private String formatWriteDate;
	private String noticeContent;
	
	public MemberNotice() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberNotice(int noticeNum, String noticeTitle, Date writeDate, String formatWriteDate,
			String noticeContent) {
		super();
		this.noticeNum = noticeNum;
		this.noticeTitle = noticeTitle;
		this.writeDate = writeDate;
		this.formatWriteDate = formatWriteDate;
		this.noticeContent = noticeContent;
	}

	public int getNoticeNum() {
		return noticeNum;
	}

	public void setNoticeNum(int noticeNum) {
		this.noticeNum = noticeNum;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public String getFormatWriteDate() {
		return formatWriteDate;
	}

	public void setFormatWriteDate(String formatWriteDate) {
		this.formatWriteDate = formatWriteDate;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "MemberNotice [noticeNum=" + noticeNum + ", noticeTitle=" + noticeTitle + ", writeDate=" + writeDate
				+ ", formatWriteDate=" + formatWriteDate + ", noticeContent=" + noticeContent + "]";
	}
	
}
