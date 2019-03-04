package com.kh.food.owner.member.model.dao;

import java.util.Map;

import com.kh.food.owner.member.model.vo.Owner;

public interface OwnerMemberDao {

	int insertOwner(Owner o);
	Owner selectLogin(String ownerId);
	Map<String, String> selectSearchId(Map<String, String> map);
	
}
