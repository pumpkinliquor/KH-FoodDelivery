package com.kh.food.admin.notice.model.service;

import java.util.List;
import java.util.Map;

import com.kh.food.admin.notice.attachment.vo.NoticeAttachment;

public interface NoticeService {

	List<Map<String,String>> selectMemberNoticeList(int cPage,int numPerPage);
	int notCount();
	Map<String,String> selectMemberNotice(int noticeNum);
	List<Map<String,String>>selectAttach(int noticeNum);
	int deleteMemberNotice(int noticeNum);
	int insertMemberNotice(Map<String,String> notice, List<NoticeAttachment> files);

	/*
	 * int memberNoticeUpdateEnd(Map<String,String>map); int
	 * memberNoticeAUpdateEnd(List<NoticeAttachment>files);
	 */
	int memberNoticeUpdateEnd(Map<String,Object> map, List<NoticeAttachment> files);
}
