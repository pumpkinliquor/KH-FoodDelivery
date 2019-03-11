package com.kh.food.admin.notice.model.service;

import java.util.List;
import java.util.Map;

import com.kh.food.admin.notice.attachment.vo.NoticeAttachment;

public interface NoticeService {

	List<Map<String,String>> selectMemberNoticeList();
	Map<String,String> selectMemberNotice(int noticeNum);
	List<Map<String,String>>selectAttach(int noticeNum);
	int deleteMemberNotice(int noticeNum);
	int insertMemberNotice(Map<String,String> notice, List<NoticeAttachment> files);
	int updateNotice(int noticeNum);
}
