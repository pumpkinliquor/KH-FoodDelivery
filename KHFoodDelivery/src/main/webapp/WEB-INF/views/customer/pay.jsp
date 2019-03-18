<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*, java.sql.*" 
pageEncoding="UTF-8"%>
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<!-- 주문하기 창에 띄울것 -->
<script>
$(document).on('click','#pay',function(){ //결제하기 버튼 아이디쓸것
    var title=$('#').text();			//가게명
    var totalPrice=$('#').val();   		//총 합계금액     
 	var IMP = window.IMP; // 생략가능
	IMP.init('imp51687071'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	IMP.request_pay({
    pg : 'inicis', // version 1.1.0부터 지원.
    pay_method : 'card',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : title, //주문음식이름
    amount : totalPrice, //가격 받아가야함
    buyer_email : 'wjdqls7773@gmail.com', //사는 사람 이메일 받아가야됨
    buyer_name : '간신배', //이름도
    buyer_tel : '010-1234-5678', //번호도
    buyer_addr : '서울특별시 강남구 역삼동 KH정보교육원', //주소도
    buyer_postcode : '123-456',
    m_redirect_url : ''
}, function(rsp) {
    if ( rsp.success ) {
       var msg = '결제가 완료되었습니다. 주문 내역을 확인해주세요!';
       msg += '고유ID : ' + rsp.imp_uid;
       msg += '상점 거래ID : ' + rsp.merchant_uid;
       msg += '결제 금액 : ' + rsp.paid_amount;
       msg += '카드 승인번호 : ' + rsp.apply_num; 
       location.href="${path}/customer/customerPay.do?amount="+totalPrice; //보낼값들

    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '<br>실패 사유 : ' + rsp.error_msg;
    }
    alert(msg);
});
});

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>