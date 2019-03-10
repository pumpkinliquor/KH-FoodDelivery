package com.kh.food.admin.notice.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.food.admin.notice.attachment.vo.NoticeAttachment;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	//회원공지사항리스트
		@Override
		public List<Map<String, String>> selectMemberNoticeList() {
			// TODO Auto-generated method stub
			
			return sqlSession.selectList("admin.selectMemberNoticeList");
		}

		//회원공지사항 뷰
		@Override
		public Map<String, String> selectMemberNotice(int noticeNum) {
			// TODO Auto-generated method stub
			return sqlSession.selectOne("admin.selectMemberNotice",noticeNum);
		}
		//회원공지사항 파일 뷰 필요
		@Override
		public List<Map<String, String>> selectAttach(int noticeNum) {
			// TODO Auto-generated method stub
			return sqlSession.selectList("admin.selectAttach", noticeNum);
		}

		//회원공지사항 삭제
			@Override
			public int deleteMemberNotice(int noticeNum) {
				// TODO Auto-generated method stub
				return sqlSession.delete("admin.deleteMemberNotice", noticeNum);
			}

		

			//회원공지사항 등록
			@Override
			public int insertMemberNotice(Map<String, String> notice) {
				// TODO Auto-generated method stub
				return sqlSession.insert("admin.insertMemberNotice", notice);
			}
			//회원공지사항 파일 등록
			@Override
			public int insertMemberNoticeAttach(NoticeAttachment a) {
				// TODO Auto-generated method stub
				return sqlSession.insert("admin.insertMemberNoticeAttach", a);
			}
		
			
		

		@Override
			public int updateNotice(int noticeNum) {
				// TODO Auto-generated method stub
				return sqlSession.selectOne("admin.updateNotice", noticeNum);
			}

		

		
	
	
	
	
}
