package com.kh.spring.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	SqlSessionTemplate session;
	
	

	@Override
	public int insertBoard(Map<String, String> board) {
		return session.insert("board.insertBoard",board);
	}

	@Override
	public List<Map<String, String>> selectBoardList(int cPage,int numPerPage) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("board.selectBoardList",null,rb);
	}

	@Override
	public int selectBoardCount() {
		return session.selectOne("board.selectBoardCount");
	}
	
}
