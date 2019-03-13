<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*, java.sql.*" 
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import ="java.sql.*" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<%  
	List<Map<String,String>> orderList = (List<Map<String,String>>)request.getAttribute("orderList");
%>
<jsp:include page="/WEB-INF/views/common/ownerHeader.jsp"></jsp:include>
<style>
.search{
	float:right;
	padding-bottom:1em;
}
#keywordBtn{
	margin-top:10px;
   	width:4em;
}
#keyword{
	margin-top:10px;
	width:13em;
}
.statusBtn{
	font-size:10px;
	margin-left:3px;
	margin-top:3px;
	width:45%;
}
.orderTable .td1{
	padding-top:30px;
}

</style>
<section>
<div class="container">
	<div style="text-align:center; margin-bottom:5em;">
		<h2 style="font-weight:bold;">주문 내역</h2>
	</div>
	<div style="text-align:center; margin-bottom:15px;">
		<span>하루동안 총 <span style="color:red; font-weight:bold; font-size:20px;">3</span>건의 주문내역이 있습니다.</span>
	</div>
	<div class="row" style="clear:both;">
		<div class="col-md-12">
				<table class="table table-hover orderTable">
					<thead>
						<tr>
							<th width=7%>번호</th>
							<th width=15%>주문일시</th>
							<th width=25%>메뉴명</th>
							<th width=8%>주문인</th>
							<th width=7%>배달비</th>
							<th width=8%>결제금액</th>
							<th width=10%>결제방식</th>
							<th width=20%>상태</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="sum" value="0"/>
						<c:forEach var="o" items="${orderList}" varStatus="status">
													<% for(int i=0; i<orderList.size(); i++){%>
														
													<% }%>
							<c:if test="${orderList[status.index].PAYORDERNUM ne orderList[status.index+1].PAYORDERNUM}">			
							<tr style="cursor:pointer;" onclick="fn_detailOrder(${o.PAYORDERNUM});">						
								<td class="td1"><c:out value="${status.count}"/></td>
								<td class="td1">${o.PAYDATE}</td>
								<td class="td1">${o.MENUNAME}</td>
								<td class="td1">${o.MEMBERNAME}</td>
								<td class="td1"></td>							
								<td class="td1"></td>
								<td class="td1">${o.PAYORDERMETHOD}</td>							
								<td><button class="btn btn-default statusBtn">주문접수</button><button class="btn btn-default statusBtn">배달중</button><button class="btn btn-default statusBtn">배달완료</button><button class="btn btn-default statusBtn">주문취소</button></td>
							</tr>
							</c:if>
							
						</c:forEach>							
						<tr style="cursor:pointer;" onclick="location.href='${path}/owner/oneVSoneView.do?qnaCode=${one.QNACODE}'">
								<td class="td1">1</td>
								<td class="td1">2019-03-11/ 10:aa34</td>
								<td class="td1">아이스 아메리카노 외 3잔</td>
								<td class="td1">김일호</td>
								<td class="td1">2000</td>
								<td class="td1">16000</td>
								<td class="td1">카카오페이</td>
								<td><button class="btn btn-default statusBtn">주문접수</button><button class="btn btn-default statusBtn">배달중</button><button class="btn btn-default statusBtn">배달완료</button><button class="btn btn-default statusBtn">주문취소</button></td>
							</tr>
					</tbody>
				</table>
				<div class="paging">
					${pageBar}
				</div>
		</div>
	</div>
</div>

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					
				</div>
				<div class="modal-body">

					   <div class="card categoryDiv" scroll=auto style="overflow-x:hidden">
                          <div class="card-body">
                              <div class="row">
                                  <div class="col-md-12">
                                      <h4>주문 상세 내역</h4>
                                      <hr>
                                  </div>
                              </div>
                              <div class="row">
                                  <div class="col-md-12">                                                
                                            <table class="table table-hover board">
                                                <tbody>          
                                                    <!-- data-toggle="modal" data-target="#myModal" -->
                                                    <tr style="cursor:pointer;">
                                                        <td width="44%" >싸이버거 1개</td>                                                 
                                                        <td width="12%">5600원</td>
                                                    </tr>
                                                    <tr style="cursor:pointer;">
                                                        <td width="44%" >치킨커틀렛버거 1개</td>                                                 
                                                        <td width="12%">5600원</td>
                                                    </tr>
                                                    <tr style="cursor:pointer;">
                                                        <td width="44%" >싸이버거 1개</td>                                                 
                                                        <td width="12%">5600원</td>
                                                    </tr>
                                                    <tr style="cursor:pointer;">
                                                        <td class="orderPrice" width="44%" >주문금액</td>                                                 
                                                        <td width="12%">18400원</td>
                                                    </tr>
                                                    <tr style="cursor:pointer;">
                                                        <td width="44%" >배달비</td>                                                 
                                                        <td width="12%">3000원</td>
                                                    </tr>
                                                    <tr style="cursor:pointer;">
                                                        <td width="44%" >총 결제금액</td>                                                 
                                                        <td width="12%">21400원</td>
                                                    </tr>
                                                    <tr style="cursor:pointer;">
                                                        <td width="70%">결제방법</td>                                                 
                                                        <td class="orderMethd" width="30%">네이버페이</td>
                                                    </tr>
                                                    <tr style="cursor:pointer;">
                                                        <td width="70%">주문자</td>                                                 
                                                        <td class="orderName" width="30%"></td>
                                                    </tr>
                                                    <tr style="cursor:pointer;">
                                                        <td width="70%">결제일</td>                                                 
                                                        <td class="orderDate" width="30%"></td>
                                                    </tr>
                                                    
                                                </tbody>
                                            </table>                             
                                            <table class="table table-hover board">
                                                <tbody>                  
                                                    <tr style="cursor:pointer;">
                                                        <td width="30%" >배달주소</td>                                                 
                                                        <td width="70%">서울 강서구 가양동 1461 가양2단지 아파트 209동 1006호</td>
                                                    </tr>
                                                    <tr style="cursor:pointer;">
                                                        <td width="30%" >전화번호</td>                                                 
                                                        <td width="70%">01091634624</td>
                                                    </tr>
                                                    <tr style="cursor:pointer;">
                                                        <td width="10%" >요청사항</td>                                                 
                                                        <td class="orderRequest" width="80%">문을 크게 두드리지 말아주세요 집에 아기가 있어요. 아기가 울지도 몰라요</td>
                                                    </tr>
                                                </tbody>
                                            </table> 
                                  </div>
                              </div>
                              
                                

                          </div>
                      </div>



				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

</section>


<script>
function fn_detailOrder(payOrderNum){
	
	$.ajax({
			url:"${path}/owner/selectPayOrderNum.do",
			data: {"payOrderNum":payOrderNum},
			success : function(data)
			{
				console.log(data);
				console.log(data[0].PAYDATE);
				$('.orderName').text(data[0].MEMBERNAME);
				$('.orderDate').text(data[0].PAYDATE);
				$('.orderRequest').text(data[0].PAYREQUEST);
				$('#myModal').modal();
			}
		
	});
}


</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include> 