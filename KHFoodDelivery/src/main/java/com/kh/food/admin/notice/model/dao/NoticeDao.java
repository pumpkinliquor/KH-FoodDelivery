package com.kh.food.admin.notice.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.food.admin.notice.attachment.vo.NoticeAttachment;

public interface NoticeDao {

	List<Map<String,String>> selectMemberNoticeList();
	Map<String,String> selectMemberNotice(int noticeNum);
	List<Map<String,String>> ownerNoticeList();
	int deleteMemberNotice(int noticeNum);
	int insertMemberNotice(Map<String,String> notice);
	int insertMemberNoticeAttach(NoticeAttachment a);
	int updateNotice(int noticeNum);
}
