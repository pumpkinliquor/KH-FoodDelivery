package com.kh.food.owner.notice.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kh.food.owner.notice.attachment.vo.OwnerNoticeAttachment;
import com.kh.food.owner.notice.model.dao.OwnerNoticeDao;


@Service
public class OwnerNoticeServiceImpl implements OwnerNoticeService {

	@Autowired
	OwnerNoticeDao dao;

	//사장 공지사항리스트
	@Override
	public List<Map<String, String>> ownerNoticeList() {
		// TODO Auto-generated method stub
		return dao.ownerNoticeList();
	}

	@Override
	public int ownNotCount() {
		// TODO Auto-generated method stub
		return dao.ownNotCount();
	}

	//사장공지사항 뷰
	@Override
	public Map<String, String> selectOwnerNotice(int ownerNoticeNum) {
		// TODO Auto-generated method stub
		return dao.selectOwnerNotice(ownerNoticeNum);
	}

	//사장공지사항 사진뷰
	@Override
	public List<Map<String, String>> selectOwnerAttach(int ownerNoticeNum) {
		// TODO Auto-generated method stub
		return dao.selectOwnerAttach(ownerNoticeNum);
	}

	//사장공지사항 삭제
	@Override
	public int deleteOwnerNotice(int ownerNoticeNum) {
		// TODO Auto-generated method stub
		return dao.deleteOwnerNotice(ownerNoticeNum);
	}

	 //사장공지사항 글등록
	@Override
	public int insertOwnerNotice(Map<String, String> notice, List<OwnerNoticeAttachment> files) {
		// TODO Auto-generated method stub
		int result=0;
		try {
			result=dao.insertOwnerNotice(notice);
			if(result==0)
			{
				throw new Exception();
			}
			for(OwnerNoticeAttachment a: files)
			{
				a.setOwnerNoticeNum(Integer.parseInt( notice.get("ownerNoticeNum").toString()));
				result=dao.insertOwnerNoticeAttach(a);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		return result;
	}

	
	//사장 공지사항 수정완료
	@Override
	public int ownerNoticeUpdateEnd(Map<String, Object> map, List<OwnerNoticeAttachment> files) {
		// TODO Auto-generated method stub
		int result=0;
		try {
			result=dao.ownerNoticeUpdateEnd(map);
			if(result==0)
			{
				throw new Exception();
			}
			for(OwnerNoticeAttachment a : files)
			{
				a.setOwnerNoticeNum(Integer.parseInt(map.get("ownerNoticeNum").toString()));
				result=dao.ownerNoticeAUpdateEnd(a);
				if(result==0) throw new Exception();
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
					
		
		return result;
	}


	
	 
	  
	 

	
	
}
