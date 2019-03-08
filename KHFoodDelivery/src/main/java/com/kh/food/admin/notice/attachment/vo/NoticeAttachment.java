package com.kh.food.admin.notice.attachment.vo;

import java.util.Date;

public class NoticeAttachment {

	private int noticeAttachmentNo;
	private int noticeNum;
	private String originalFileName;
	private String renamedFileName;
	private Date uploadDate;
	private int downLoadCount;
	private String status;
	
	public NoticeAttachment() {}

	public NoticeAttachment(int noticeAttachmentNo, int noticeNum, String originalFileName, String renamedFileName,
			Date uploadDate, int downLoadCount, String status) {
		super();
		this.noticeAttachmentNo = noticeAttachmentNo;
		this.noticeNum = noticeNum;
		this.originalFileName = originalFileName;
		this.renamedFileName = renamedFileName;
		this.uploadDate = uploadDate;
		this.downLoadCount = downLoadCount;
		this.status = status;
	}

	public int getNoticeAttachmentNo() {
		return noticeAttachmentNo;
	}

	public void setNoticeAttachmentNo(int noticeAttachmentNo) {
		this.noticeAttachmentNo = noticeAttachmentNo;
	}

	public int getNoticeNum() {
		return noticeNum;
	}

	public void setNoticeNum(int noticeNum) {
		this.noticeNum = noticeNum;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getRenamedFileName() {
		return renamedFileName;
	}

	public void setRenamedFileName(String renamedFileName) {
		this.renamedFileName = renamedFileName;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public int getDownLoadCount() {
		return downLoadCount;
	}

	public void setDownLoadCount(int downLoadCount) {
		this.downLoadCount = downLoadCount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "NoticeAttachment [noticeAttachmentNo=" + noticeAttachmentNo + ", noticeNum=" + noticeNum
				+ ", originalFileName=" + originalFileName + ", renamedFileName=" + renamedFileName + ", uploadDate="
				+ uploadDate + ", downLoadCount=" + downLoadCount + ", status=" + status + "]";
	}
	
}
