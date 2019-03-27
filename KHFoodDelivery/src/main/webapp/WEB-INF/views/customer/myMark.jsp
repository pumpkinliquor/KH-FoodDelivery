<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*, java.sql.* , com.kh.food.customer.member.model.vo.*" 
pageEncoding="UTF-8"%>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	Member member = (Member)request.getAttribute("member");
%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<style>
input.memberAddress{display:inline;}


#drop{float:right;}
.btn-ser1{margin-top:0;float:right;}       
#activeOn{background-color: rgb(250, 163, 148); color:white;}
#activeOff:hover{
	background-color: rgb(250, 163, 148);
	color:white;
}    
table#marker tr th{background-color: rgb(250, 163, 148); color:white;}
</style>





<div class="container up" style="padding-bottom:150px">
 			
	<div class="row">     
		<div class="col-md-3" >
		     <div class="list-group">
                <a href="${path }/member/orderList.do?memberId=${sessionScope.logined}&memberNum=${sessionScope.loginedno}" id="activeOff" class="list-group-item list-group-item-action" style="z-index:0;">나의 주문내역</a>
              <a href="${path}/customer/mypage.do?memberId=${sessionScope.logined}" id="activeOff" class="list-group-item list-group-item-action ">회원정보변경</a>
              <a href="${path }/member/markList.do?memberId=${sessionScope.logined}" id="activeOn" class="list-group-item list-group-item-action">즐겨찾는매장</a>
              <a href="${path }/member/myReview.do?memberId=${sessionScope.logined}" id="activeOff" class="list-group-item list-group-item-action">리뷰 관리</a>
              <a href="${path }/member/qnaList.do?memberId=${sessionScope.logined}" id="activeOff" class="list-group-item list-group-item-action ">나의 문의내역</a>
            </div> 
		</div>
		<div class="col-md-9" >
		<h4>${sessionScope.logined }님이 찜한 가게</h4>
			<table class="table table-hover" id="marker">
				<tr> 
					<th colspan='2'>찜한 가게(${count })</th>				
				</tr>
				<c:forEach items="${list}" var="s">
					<tr onclick="location.href='${path}/customer/menuInfo.do?businessCode=${s.businessCode }'" style="cursor:pointer;">
						<td>
							<img alt="${s.storeName}" src="${path}/resources/upload/owner/storeMainImage/${s.storeImage}" style="width:50px; height:50px;"/>
						</td>
						<td style="cursor:pointer;">
							${s.storeName }
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</div>
	
 
     

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>