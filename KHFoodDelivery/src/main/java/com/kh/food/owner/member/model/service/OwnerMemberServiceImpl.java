package com.kh.food.owner.member.model.service;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.kh.food.common.MailHandler;
import com.kh.food.common.TempKey;
import com.kh.food.owner.member.model.dao.OwnerMemberDao;
import com.kh.food.owner.member.model.vo.Owner;

@Service
public class OwnerMemberServiceImpl implements OwnerMemberService {

	@Inject
	private JavaMailSender mailSender;
	
	@Autowired
	OwnerMemberDao dao;
	
	@Override
	public int insertOwner(Owner o) throws Exception{
		// TODO Auto-generated method stub
		int result = 0;
		result = dao.insertOwner(o); // 회원가입 DAO
		
		String key = new TempKey().getKey(50, false); // 인증키 생성
		if(result == 1)
		{
		result = dao.createAuthKey(o.getOwnerEmail(), key); // 인증키 DB저장
		}
		
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[ALMOM 서비스 이메일 인증]");
		sendMail.setText(
		new StringBuffer().append("<h1>메일인증</h1>").append("<a href='http://localhost/user/emailConfirm?user_email=").append(o.getOwnerEmail()).append("&key=").append(key).append("' target='_blenk'>이메일 인증 확인</a>").toString());
		sendMail.setFrom("호스트 이메일 아이디", "알몸개발자");
		sendMail.setTo(o.getOwnerEmail());
		sendMail.send();
		return 0;
		
	}

	
}
