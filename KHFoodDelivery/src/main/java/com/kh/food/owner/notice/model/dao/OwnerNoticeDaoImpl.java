package com.kh.food.owner.notice.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.food.owner.notice.attachment.vo.OwnerNoticeAttachment;

@Repository
public class OwnerNoticeDaoImpl implements OwnerNoticeDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> ownerNoticeList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rows=new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("ownerNotice.selectOwnerNoticeList",null,rows);
	}
	
	@Override
	public int ownNotCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("ownerNotice.ownNotCount");
	}


	


	@Override
	public Map<String, String> selectOwnerNotice(int ownerNoticeNum) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("ownerNotice.selectOwnerNotice", ownerNoticeNum);
	}
	@Override
	public int deleteOwnerNotice(int ownerNoticeNum) {
		// TODO Auto-generated method stub
		return sqlSession.delete("ownerNotice.deleteOwnerNotice", ownerNoticeNum);
	}
	
	//공지사항 등록
	@Override
	public int insertOwnerNotice(Map<String, String> notice) {
		// TODO Auto-generated method stub
		return sqlSession.insert("ownerNotice.insertOwnerNotice", notice);
	}
	//공지사항 등록 사진
	@Override
	public int insertOwnerNoticeAttach(OwnerNoticeAttachment a) {
		// TODO Auto-generated method stub
		return sqlSession.insert("ownerNotice.insertOwnerNoticeAttach",a);
	}
	
	//사장공지사항 사진뷰
	@Override
	public List<Map<String, String>> selectOwnerAttach(int ownerNoticeNum) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("ownerNotice.selectOwnerAttach", ownerNoticeNum);
	}


	//사장공지사항 수정 글
	@Override
	public int ownerNoticeUpdateEnd(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.update("ownerNotice.ownerNoticeUpdateEnd", map);
	}

	//사장공지사항 수정 파일
	@Override
	public int ownerNoticeAUpdateEnd(OwnerNoticeAttachment a) {
		// TODO Auto-generated method stub
		return sqlSession.update("ownerNotice.ownerNoticeAUpdateEnd", a);
	}

	//사장 메인 공지사항
	@Override
	public List<Map<String, String>> ownerNoticeList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("ownerMain.ownerNoticeList");
	}

	
	
	
}
