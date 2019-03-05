package com.kh.food.owner.member.model.service;

import java.util.Map;

import com.kh.food.owner.member.model.vo.Owner;

public interface OwnerMemberService {

	int insertOwner(Owner o);
	Owner selectLogin(String ownerId);
	Map<String, String> selectSearchId(Map<String, String> map);
	Map<String, String> selectConfirmIdEmail(Map<String, String> map);
	int updateTempPw(Map<String, String> map);
	int ownerCheckId(String ownerId);
}
