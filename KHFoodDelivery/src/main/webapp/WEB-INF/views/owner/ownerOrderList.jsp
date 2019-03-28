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
	
	border-color: #4D4D4D !important;
	background-color:white !important;
	color:#4D4D4D;
}
.orderTable .td1{
	padding-top:30px;
}
.orderTable{
	text-align:center;
}
.trueBtn{
	color : red;
}
.notBtn{
	color : black;
}

</style>
<section>
<div class="container">
	<div style="text-align:center; margin-bottom:5em;">
		<h2 style="font-weight:bold;">주문 내역</h2>
		<!-- <button onclick="refund();">환불</button> -->
	</div>
	<div style="text-align:center; margin-bottom:15px;">
		<span>하루동안 총 <span style="color:red; font-weight:bold; font-size:20px;">${todayOrderCount.TODAYORDERCOUNT}</span>건의 주문내역이 있습니다.</span>
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
					
					<c:set var="index" value="0"/>
					<c:forEach var="o" items="${orderOneList}" varStatus="status">		
							<tr style="cursor:pointer;">						
								<td onclick="fn_detailOrder(${o.payOrderNum});" class="td1"><c:out value="${status.count}"/></td>
								<td onclick="fn_detailOrder(${o.payOrderNum});" class="td1">${o.payDate}</td>
								<td onclick="fn_detailOrder(${o.payOrderNum});" class="td1">${o.memberName}님의 주문입니다.</td>
								<td onclick="fn_detailOrder(${o.payOrderNum});" class="td1">${o.deliveryPay}</td>							
								<td onclick="fn_detailOrder(${o.payOrderNum});" class="td1">${o.price}</td>
								<td onclick="fn_detailOrder(${o.payOrderNum});" class="td1">${o.payOrderMethod}</td>							
								<td>
								<c:if test="${o.orderState ne 4 }">
								<c:if test="${o.orderState eq 1 }">
								<button id="state1"  value="1" onclick="fn_state(${o.payOrderNum},this)" class="btn btn-default statusBtn trueBtn">주문접수</button>
								</c:if>
								<c:if test="${o.orderState ne 1 }">
								<button id="state1"  value="1" onclick="fn_state(${o.payOrderNum},this)" class="btn btn-default statusBtn notBtn">주문접수</button>			
								</c:if>
								<c:if test="${o.orderState eq 2 }">
								<button id="state2" value="2" class="btn btn-default statusBtn trueBtn" onclick="fn_state(${o.payOrderNum},this)">배달중</button>
								</c:if>
								<c:if test="${o.orderState ne 2 }">
								<button id="state2" value="2" class="btn btn-default statusBtn notBtn" onclick="fn_state(${o.payOrderNum},this)">배달중</button>			
								</c:if>
								<c:if test="${o.orderState eq 3 }">
								<button value="3" id="state3" class="btn btn-default statusBtn trueBtn" onclick="fn_state(${o.payOrderNum},this)">배달완료</button>							
								</c:if>
								<c:if test="${o.orderState ne 3 }">
								<button value="3" id="state3" class="btn btn-default statusBtn notBtn" onclick="fn_state(${o.payOrderNum},this)">배달완료</button>
								</c:if>
								<c:if test="${o.orderState eq 4 }">
								<button id="state4" value="4" class="btn btn-default statusBtn trueBtn" onclick="fn_state1(${o.payOrderNum},this)">주문취소</button>								
								</c:if>
								<c:if test="${o.orderState ne 4 }">
								<button id="state4" value="4" class="btn btn-default statusBtn notBtn" onclick="fn_state1(${o.payOrderNum},this)">주문취소</button>							
								</c:if>
								</c:if>
								<c:if test="${o.orderState eq 4 }">
								<button id="state1"  value="1" onclick="fn_state(${o.payOrderNum},this)" class="btn btn-default statusBtn notBtn" disabled="disabled">주문접수</button>			
								<button id="state2" value="2" class="btn btn-default statusBtn notBtn" onclick="fn_state(${o.payOrderNum},this)" disabled="disabled">배달중</button>			
								<button id="state3" value="3" class="btn btn-default statusBtn notBtn" onclick="fn_state(${o.payOrderNum},this)" disabled="disabled">배달완료</button>
								<button id="state4" value="4" class="btn btn-default statusBtn trueBtn" onclick="fn_state1(${o.payOrderNum},this)" disabled="disabled">주문취소</button>							
								</c:if>
								</td>
							</tr>
					<c:set var="index" value="${index + 1 }"/>		
					</c:forEach> 
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
                                                        <td class="" width="12%"></td>
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
                                                        <td class="memberAddress" width="70%"></td>
                                                    </tr>
                                                    <tr style="cursor:pointer;">
                                                        <td width="30%" >전화번호</td>                                                 
                                                        <td class="memberPhone" width="70%"></td>
                                                    </tr>
                                                    <tr style="cursor:pointer;">
                                                        <td width="10%" >요청사항</td>                                                 
                                                        <td class="orderRequest" width="80%"></td>
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

function fn_state1(payOrderNum,e)
{

	var orderState = $(e).val();
	
		var UP = confirm("정말로 주문취소 하시겠습니까?");
		
		if(UP == true)
			{
			 $.ajax({
					url:"${path}/order/updateOrderState1.do",
					data:{"payOrderNum" : payOrderNum , "orderState" : orderState},
					success:function(data)
					{
							if(data!=0)
							{
								if(orderState == 4)
									{
									$(e).css("color","red").attr("disabled",true).attr("readonly",false);
									$(e).prev().css("color","black").attr("disabled",true).attr("readonly",false);
									$(e).prev().prev().css("color","black").attr("disabled",true).attr("readonly",false);
									$(e).prev().prev().prev().css("color","black").attr("disabled",true).attr("readonly",false);									
									}
								alert("주문취소를 하셨습니다.");
								
							}
							else
							{
									alert("변경실패!");
							}
					}
				})		 
			}
		else
			{
				alert("주문취소를 취소하셨습니다.");
			}
}
function refund()
{
	location.href="${path}/owner/payRefund.do"
}	


function fn_detailOrder(payOrderNum){
	
	$.ajax({
			url:"${path}/owner/selectPayOrderNum.do",
			data: {"payOrderNum":payOrderNum},
			success : function(data)
			{

				/* for(var i=0; i<data.length; i++)
				{
					$('.menu').prepend("<tr style='cursor:pointer;'><td width='44%'>"+data[i].MENUNAME+"</td><td width='12%'>"+data[i].PRICE+"원</td></tr>")
				} */
			 	$('.orderName').text(data[0].MEMBERNAME);
				$('.orderDate').text(data[0].PAYDATE);
				$('.orderRequest').text(data[0].PAYREQUEST);
				$('.memberPhone').text(data[0].MEMBERPHONE);
				$('.memberAddress').text(data[0].PAYADDRESS)
				var html = "";
				var sum = "";
				for(var i=0; i<data.length; i++)
				{	
					html += "<tr style='cursor:pointer;'><td width='44%'>"+data[i].MENUNAME+"</td><td width='12%'>"+data[i].PRICE+"원</td></tr>";
					sum = Number(sum) + Number(data[i].PRICE);
				}
				var totalPrice = Number(sum) + Number(data[0].DELIVERYPAY);
				html += "<tr style='cursor:pointer;'><td width='44%'>주문금액</td><td width='12%'>"+sum+"원</td></tr>"
				html += "<tr style='cursor:pointer;'><td width='44%'>배달비</td><td width='12%'>"+data[0].DELIVERYPAY+"원</td></tr>"
				html += "<tr style='cursor:pointer;'><td width='44%'>총결제금액</td><td width='12%'>"+totalPrice+"원</td></tr>"
				html += "<tr style='cursor:pointer;'><td width='44%'>결제방법</td><td width='12%'>"+data[0].PAYORDERMETHOD+"</td></tr>"
				html += "<tr style='cursor:pointer;'><td width='44%'>주문자</td><td width='12%'>"+data[0].MEMBERNAME+"</td></tr>"
				html += "<tr style='cursor:pointer;'><td width='44%'>결제일</td><td width='12%'>"+data[0].PAYDATE+"</td></tr>"			
				$(".menu").html(html);
				$('#myModal').modal(); 
				
			}
	});
}

	function fn_state(payOrderNum,e)
	{
		

		var orderState = $(e).val();
/* 		if($(e).attr('id') == 'state1')
			{
				orederState = 1;
			}
		else if($(e).attr('id')==state2)
			{
				orederState = 2;
			}
		else if($(e).attr('id')==state3)
			{
				orederState = 3;
			}
		else{
			orederState = 4;
		} */
		
		 $.ajax({
			url:"${path}/order/updateOrderState.do",
			data:{"payOrderNum" : payOrderNum , "orderState" : orderState},
			success:function(data)
			{

					if(data!=0)
					{
						$(e).css("color","red");
						if(orderState == 1)
							{
								$(e).css("color","red");
								$(e).next().css("color","black");
								$(e).next().next().css("color","black");
								$(e).next().next().next().css("color","black");
								
							
							}
						else if(orderState == 2)
							{
								$(e).css("color","red");
								$(e).prev().css("color","black");
								$(e).next().css("color","black");
								$(e).next().next().css("color","black");
							}
						else
							{
								$(e).css("color","red");
								$(e).prev().css("color","black");
								$(e).prev().prev().css("color","black");
								$(e).next().css("color","black");
							}
						
					}
					else
					{
							alert("변경실패!");
					}
			}
		})		 
	}


</script>
<jsp:include page="/WEB-INF/views/common/ownerFooter.jsp"></jsp:include> 