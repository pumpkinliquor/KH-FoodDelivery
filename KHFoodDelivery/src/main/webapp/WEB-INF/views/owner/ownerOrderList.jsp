<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*, java.sql.*" 
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import ="java.sql.*" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<%  
	List<Map<String,String>> orderList = (List)request.getAttribute("orderList");
	int sum = 0;
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
.orderTable{
	text-align:center;
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
							<th width=18%>주문일시</th>
							<th width=27%>주문명</th>
							<th width=9%>배달비</th>
							<th width=9%>결제금액</th>
							<th width=10%>결제방식</th>
							<th width=20%>상태</th>
						</tr>
					</thead>
					<tbody>
					
					<c:forEach var="o" items="${list}" varStatus="status">		
							<tr style="cursor:pointer;" onclick="fn_detailOrder(${o.payOrderNum});">						
								<td class="td1"><c:out value="${status.count}"/></td>
								<td class="td1">${o.formatDate}</td>
								<td class="td1">${o.memberName}님의 주문입니다.</td>
								<td class="td1"></td>							
								<td class="td1">${price[status.index].price}</td>
								<td class="td1">${o.payOrderMethod}</td>							
								<td><button class="btn btn-default statusBtn">주문접수</button><button class="btn btn-default statusBtn">배달중</button><button class="btn btn-default statusBtn">배달완료</button><button class="btn btn-default statusBtn">주문취소</button></td>
							</tr>
							
					</c:forEach> 
						
						<%-- <% for(int i=0; i<orderList.size(); i++){%>				
							<%for(int j=0; j<orderList.size(); j++) {%>
								<c:choose >
									<c:when test='<%=orderList.get(i).get("PAYORDERNUM")==orderList.get(j).get("PAYORDERNUM")%>'></c:when>
								 <%if(orderList.get(i).get("PAYORDERNUM")==orderList.get(j).get("PAYORDERNUM")){%>				
								
								<%} else{%> 
								<c:otherwise>
								<tr style="cursor:pointer;" onclick="fn_detailOrder(<%=orderList.get(i).get("PAYORDERNUM")%>);">						
								<td class="td1"><c:out value="<%=i+1%>"/></td>
								<td class="td1"><c:out value='<%=orderList.get(i).get("PRICE")%>'/></td>
								<td class="td1"><c:out value='<%=orderList.get(0).get("MEMBERNAME")%>'/></td>
								<td class="td1"><c:out value='<%=orderList.get(1).get("MEMBERNAME")%>'/></td>
								<td class="td1"></td>							
								<td class="td1"></td>
								<td class="td1"></td>							
								<td><button class="btn btn-default statusBtn">주문접수</button><button class="btn btn-default statusBtn">배달중</button><button class="btn btn-default statusBtn">배달완료</button><button class="btn btn-default statusBtn">주문취소</button></td>
								</tr>
								 <%} %> 
								</c:otherwise>
								
								</c:choose>
							<%} %>
						<% }%>	 --%>
						<tr style="cursor:pointer;" onclick="location.href='${path}/owner/oneVSoneView.do?qnaCode=${one.QNACODE}'">
								<td class="td1">1</td>
								<td class="td1">2019-03-11/ 10:aa34</td>
								<td class="td1">아이스 아메리카노 외 3잔</td>
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
                                  <div class="col-md-12 " style="overflow-y:auto;overflow-x:hidden;height:550px;">                                                
                                            <table class="table table-hover board menu">     
                                                    <!-- data-toggle="modal" data-target="#myModal" -->

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
				/* for(var i=0; i<data.length; i++)
				{
					$('.menu').prepend("<tr style='cursor:pointer;'><td width='44%'>"+data[i].MENUNAME+"</td><td width='12%'>"+data[i].PRICE+"원</td></tr>")
				} */
			 	$('.orderName').text(data[0].MEMBERNAME);
				$('.orderDate').text(data[0].PAYDATE);
				$('.orderRequest').text(data[0].PAYREQUEST);
				
				var html = "";
				var sum = "";
				for(var i=0; i<data.length; i++)
				{	
					html += "<tr style='cursor:pointer;'><td width='44%'>"+data[i].MENUNAME+"</td><td width='12%'>"+data[i].PRICE+"원</td></tr>";
					sum = Number(sum) + Number(data[i].PRICE);
				}
				html += "<tr style='cursor:pointer;'><td width='44%'>주문금액</td><td width='12%'>"+sum+"원</td></tr>"
				html += "<tr style='cursor:pointer;'><td width='44%'>배달비</td><td width='12%'>"+sum+"원</td></tr>"
				html += "<tr style='cursor:pointer;'><td width='44%'>총결제금액</td><td width='12%'>"+sum+"원</td></tr>"
				html += "<tr style='cursor:pointer;'><td width='44%'>결제방법</td><td width='12%'>"+data[0].PAYORDERMETHOD+"</td></tr>"
				html += "<tr style='cursor:pointer;'><td width='44%'>주문자</td><td width='12%'>"+data[0].MEMBERNAME+"</td></tr>"
				html += "<tr style='cursor:pointer;'><td width='44%'>결제일</td><td width='12%'>"+data[0].PAYDATE+"</td></tr>"			
				$(".menu").html(html);
				$('#myModal').modal(); 
				
			}
	});
}


</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include> 