package com.kh.food.owner.member.model.dao;

import com.kh.food.owner.member.model.vo.Owner;

public interface OwnerMemberDao {

	int insertOwner(Owner o);

	int createAuthKey(String ownerEmail, String key);

}
