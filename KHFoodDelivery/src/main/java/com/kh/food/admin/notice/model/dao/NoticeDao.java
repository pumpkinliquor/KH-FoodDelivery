package com.kh.food.admin.notice.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.food.admin.notice.attachment.vo.NoticeAttachment;

public interface NoticeDao {

	List<Map<String,String>> selectMemberNoticeList(int cPage,int numPerPage);
	int notCount();
	Map<String,String> selectMemberNotice(int noticeNum);
	List<Map<String,String>> selectAttach(int noticeNum);
	int deleteMemberNotice(int noticeNum);
	int insertMemberNotice(Map<String,String> notice);
	int insertMemberNoticeAttach(NoticeAttachment a);
	/* int updateNotice(int noticeNum); */
	
	/*
	 * int memberNoticeUpdateEnd(int noticeNum); int memberNoticeAUpdateEnd(int
	 * noticeNum);
	 */
	int memberNoticeUpdateEnd(Map<String,Object> map);
	int memberNoticeAUpdateEnd(NoticeAttachment a);
}
