<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*, java.sql.*" 
pageEncoding="UTF-8"%>
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<!-- <script>
 var IMP = window.IMP; // 생략가능
IMP.init('imp51687071'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
IMP.request_pay({
    pg : 'inicis', // version 1.1.0부터 지원.
    pay_method : 'card',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : '주문명:결제테스트', //주문음식이름
    amount : 100, //가격 받아가야함
    buyer_email : 'wjdqls7773@gmail.com', //사는 사람 이메일 받아가야됨
    buyer_name : '간신배', //이름도
    buyer_tel : '010-1234-5678', //번호도
    buyer_addr : '서울특별시 강남구 역삼동 KH정보교육원', //주소도
    buyer_postcode : '123-456',
    m_redirect_url : '/customer/payEnd.do' //주문완료 창 생기면 
}, function(rsp) {
    if ( rsp.success ) {
        var msg = '결제가 완료되었습니다. 주문 내역을 확인해주세요!';
/*         msg += '고유ID : ' + rsp.imp_uid;
        msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '결제 금액 : ' + rsp.paid_amount;
        msg += '카드 승인번호 : ' + rsp.apply_num; */
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '실패 사유 : ' + rsp.error_msg;
    }
    alert(msg);
});

</script> -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>