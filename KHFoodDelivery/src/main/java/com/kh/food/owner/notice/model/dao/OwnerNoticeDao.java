package com.kh.food.owner.notice.model.dao;

import java.util.List;
import java.util.Map;

public interface OwnerNoticeDao {
	
	List<Map<String,String>>ownerNoticeList();
	Map<String,String>selectOwnerNotice(int ownerNoticeNum);
}
