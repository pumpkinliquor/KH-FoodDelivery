package com.kh.food.owner.notice.model.vo;

import java.sql.Date;

public class Notice {
	private int noticeNum;
	private String noticeTitle;
	private Date writeDate;
	private String originalFileName;
	private String reNamedFileName;
	private String noticeContent;
	
	public Notice() {
		// TODO Auto-generated constructor stub

	}

	public Notice(int noticeNum, String noticeTitle, Date writeDate, String originalFileName, String reNamedFileName,
			String noticeContent) {
		super();
		this.noticeNum = noticeNum;
		this.noticeTitle = noticeTitle;
		this.writeDate = writeDate;
		this.originalFileName = originalFileName;
		this.reNamedFileName = reNamedFileName;
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

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getReNamedFileName() {
		return reNamedFileName;
	}

	public void setReNamedFileName(String reNamedFileName) {
		this.reNamedFileName = reNamedFileName;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	@Override
	public String toString() {
		return "Notice [noticeNum=" + noticeNum + ", noticeTitle=" + noticeTitle + ", writeDate=" + writeDate
				+ ", originalFileName=" + originalFileName + ", reNamedFileName=" + reNamedFileName + ", noticeContent="
				+ noticeContent + "]";
	}
	
	
}
