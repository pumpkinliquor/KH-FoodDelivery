<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*, java.sql.*" 
pageEncoding="UTF-8"%>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>    
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<style>
.img-circle {
    border-radius: 50%;
   	width:150px;
   	height:150px;

}
table#table-sort{ border: 1px solid #444444; border-collapse: collapse; }
	table#table-sort th{ background-color: #4D4D4D; color: rgba(255, 255, 255, .5); border: 1px solid #444444; padding: 0; }
	table#table-sort td{ border: 1px solid #444444; padding: 0; }
	thead#tableHead{ background-color: #4D4D4D; color: rgba(255, 255, 255, .5); } 

</style>
<script>

$(document).ready(function() {

    
    var readURL = function(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('.avatar').attr('src', e.target.result);
            }
    
            reader.readAsDataURL(input.files[0]);
        }
    }
    

    $("#file").on('change', function(){
        readURL(this);
    });
});

function fileUpload(){
	$("#file").click();
}


function detailOrder1(menuCode){
	console.log(menuCode);
	
	$.ajax({
		url:"${path}/member/orderOne.do",
		dataType : 'json',
		data : {
			"payorderNum" : payorderNum
		},
		success : function(mem1){
			console.log(mem1);
			$('.category').val(mem1.STORECATEGORY);
			$('.storeName').val(mem1.STORENAME);
			$('.orderDate').val(mem1.PAYDATE);
			$('.way').val(mem1.PAYORDERMETHOD);
			$('.price').val(mem1.PRICE);
			$('.payRequest').val(mem1.PAYREQUEST);
			$('#orderListModal1').modal();
			
			
		},
		error: function (mem1){
			alert(mem1);
		}
		
	});
	
}

	
</script>
	
	
			
 			
 	
 	
 	
 	
 	
 	<section>
<div class="container">

 			
 			
	<div class="row">
		<div class="col-md-3 ">
		     <div class="list-group ">
  <a href="${path }/member/orderList.do?memberId=${sessionScope.logined}&memberNum=${sessionScope.loginedno}" class="list-group-item list-group-item-action active" style="z-index:0;">나의 주문내역</a>
              <a href="${path}/customer/mypage.do?memberId=${sessionScope.logined}"  class="list-group-item list-group-item-action">회원정보변경</a>
              <a href="${path }/member/markList.do?memberId=${sessionScope.logined}" class="list-group-item list-group-item-action">즐겨찾는매장</a>
              <a href="${path }/member/qnaList.do?memberId=${sessionScope.logined}" class="list-group-item list-group-item-action">나의 문의내역</a>
            </div> 
		</div>
		<div class="col-md-9">	
	
		<h4 id="titleText">${sessionScope.logined}님 주문 내역 </h4>
		
		
		<div id="qnaList">
			<table class="table table-hover" id="qnaTable">
				<thead id="tableHead">
					<tr>	
						<th>카테고리</th>	
						<th>가게명</th>
						<th>주문 날짜</th>	
						<th>리뷰작성</th>
						<th>배송상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${orderList}" var="m">
						<tr class="pnt" >
						
							<td onclick="detailOrder1(${m.PAYORDERNUM});"><c:out value="${m.STORECATEGORY }"/></td>
							<td onclick="detailOrder1(${m.PAYORDERNUM});"><c:out value="${m.STORENAME }"/></td>
							<td onclick="detailOrder1(${m.PAYORDERNUM});"><c:out value="${m.PAYDATE}"/></td>
							<td onclick="detailOrder1(${m.PAYORDERNUM});"><c:out value=""/></td>
							<td><button class="btn btn-default">리뷰</button></td>
						</tr>				
					</c:forEach>
				</tbody>
			</table>
		</div>
		</div>
	</div>
</div>
${pageBar}
</section>
	
 
     

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
<!-- 모달 구현 -->
<div class="modal" id="orderListModal1" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">주문 상세정보 </h4>
				<button type="button" class="close" data-dismiss="modal">×</button>
			</div>
			<form action="${path}/customer/memberQnaUpdate.do" method="post">
				<div class="modal-body" style="height: 500px;">
					<table class="table">
						<tr>
							<th style="vertical-align: middle">카테고리</th>
							<td><input type="text"  class="form-control category" value="" readonly/></td>						
						</tr>					
						<tr>
							<th style="vertical-align: middle">가게명</th>
							<td><input type="text"  class="form-control storeName" value="" readonly/></td>						
						</tr>						
						<tr>
							<th style="vertical-align: middle">주문날짜</th>
					<td><input type="text"  class="form-control orderDate" value="" readonly/></td>						
						</tr>	
						<tr>
							<th style="vertical-align: middle">결제 방식</th>
							<td><input type="text"  class="form-control way" value="" readonly/></td>						
						</tr>					
						<tr>
							<th style="vertical-align: middle">가격</th>
							<td><input type="text"  class="form-control price" value="" readonly/></td>						
						</tr>						 	 
					
						<tr>
							<th style="vertical-align: middle">요청사항</th>
							<td><textarea  class="form-control payRequest" style="resize: none" rows="6" readonly></textarea></td>						
						</tr>															 
					</table>
						
				</div>
				<div class="modal-footer">
					<input type="submit" class="btn btn-outline-success" value="수정"/>
				</div>
			</form>
		</div>  
	</div>
</div>


