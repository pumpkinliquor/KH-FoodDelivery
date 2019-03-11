package com.kh.food.owner.notice.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.food.owner.notice.attachment.vo.OwnerNoticeAttachment;

@Repository
public class OwnerNoticeDaoImpl implements OwnerNoticeDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	@Override
	public List<Map<String, String>> ownerNoticeList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("admin.selectOwnerNoticeList");
	}
	@Override
	public Map<String, String> selectOwnerNotice(int ownerNoticeNum) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin.selectOwnerNotice", ownerNoticeNum);
	}
	@Override
	public int deleteOwnerNotice(int ownerNoticeNum) {
		// TODO Auto-generated method stub
		return sqlSession.delete("admin.deleteOwnerNotice", ownerNoticeNum);
	}
	
	//공지사항 등록
	@Override
	public int insertOwnerNotice(Map<String, String> notice) {
		// TODO Auto-generated method stub
		return sqlSession.insert("admin.insertOwnerNotice", notice);
	}
	//공지사항 등록 사진
	@Override
	public int insertOwnerNoticeAttach(OwnerNoticeAttachment a) {
		// TODO Auto-generated method stub
		return sqlSession.insert("admin.insertOwnerNoticeAttach",a);
	}
	
	//사장공지사항 사진뷰
	@Override
	public List<Map<String, String>> selectOwnerAttach(int ownerNoticeNum) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("admin.selectOwnerAttach", ownerNoticeNum);
	}

	
	
	
}
