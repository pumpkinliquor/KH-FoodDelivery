package com.kh.food.admin.notice.model.service;

import java.util.List;
import java.util.Map;

public interface NoticeService {

	List<Map<String,String>> selectMemberNoticeList();
	Map<String,String> selectMemberNotice(int noticeNum);
	int deleteMemberNotice(int noticeNum);
}
