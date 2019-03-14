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
			
			return sqlSession.selectList("memberNotice.selectMemberNoticeList");
		}

		//페이징
		@Override
		public int notCount() {
			// TODO Auto-generated method stub
			return sqlSession.selectOne("memberNotice.notCount");
		}


		//회원공지사항 뷰
		@Override
		public Map<String, String> selectMemberNotice(int noticeNum) {
			// TODO Auto-generated method stub
			return sqlSession.selectOne("memberNotice.selectMemberNotice",noticeNum);
		}
		//회원공지사항 파일 뷰 필요
		@Override
		public List<Map<String, String>> selectAttach(int noticeNum) {
			// TODO Auto-generated method stub
			return sqlSession.selectList("memberNotice.selectAttach", noticeNum);
		}

		//회원공지사항 삭제
			@Override
			public int deleteMemberNotice(int noticeNum) {
				// TODO Auto-generated method stub
				return sqlSession.delete("memberNotice.deleteMemberNotice", noticeNum);
			}

		

			//회원공지사항 등록
			@Override
			public int insertMemberNotice(Map<String, String> notice) {
				// TODO Auto-generated method stub
				return sqlSession.insert("memberNotice.insertMemberNotice", notice);
			}
			//회원공지사항 파일 등록
			@Override
			public int insertMemberNoticeAttach(NoticeAttachment a) {
				// TODO Auto-generated method stub
				return sqlSession.insert("memberNotice.insertMemberNoticeAttach", a);
			}

			//회원공지사항 수정 파일
			@Override
			public int memberNoticeAUpdateEnd(NoticeAttachment a) {
				// TODO Auto-generated method stub
				System.out.println("dao 사진 : "+ a);
				return sqlSession.update("memberNotice.memberNoticeAUpdateEnd", a);
			}

			//회원공지사항 수정
			@Override
			public int memberNoticeUpdateEnd(Map<String, Object> map) { 
				// TODO Auto-generated method stub 
				System.out.println("dao 글: " +map );
				return sqlSession.update("memberNotice.memberNoticeUpdateEnd",map); 
			}
	 

			
			
			

			
			

			

	/*
	 * //회원공지사항 수정
	 * 
	 * @Override public int memberNoticeUpdateEnd(int noticeNum) { // TODO
	 * Auto-generated method stub System.out.println("수정: " + noticeNum); return
	 * sqlSession.update("memberNotice.memberNoticeUpdateEnd",noticeNum); }
	 * 
	 * //회원공지사항 수정 사진
	 * 
	 * @Override public int memberNoticeAUpdateEnd(int noticeNum) { // TODO
	 * Auto-generated method stub return
	 * sqlSession.update("memberNotice.memberNoticeAUpdate", noticeNum); }
	 */
		
			

		

		
	
	
	
	
}
