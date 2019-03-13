<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"></jsp:include>

<style>
	h4#titleText{ display: inline; }	
	div#qnaList{ margin-top: 15px; }
	thead#tableHead{ background-color: #4D4D4D; color: rgba(255, 255, 255, .5); }
	.pnt{ cursor: pointer; }
	table#qnaTable{ table-layout: fixed; word-wrap: break-word; }
	table#qnaTable th, table#qnaTable td{ text-align: center; vertical-align: middle; }
	
	div#qna-search{ margin-top: 40px; float: right;}
	div#qna-sort{ float: left; margin-top: 20px;}
	table#table-sort{ border: 1px solid #444444; border-collapse: collapse; }
	table#table-sort th{ background-color: #4D4D4D; color: rgba(255, 255, 255, .5); border: 1px solid #444444; padding: 0; }
	table#table-sort td{ border: 1px solid #444444; padding: 0; }
	input[type=checkbox], input[type=radio] {display: none; }
		
</style>

<script>
	function fn_qnaView(no){
		location.href="${path}/admin/memberQnaView.do?no="+no;		
	}
</script>

<section>
	<div class="container">	
		<h4 id="titleText">회원 문의 내역 </h4>
		
		<form class="form-controll navbar-right" role="search" action="${path }/admin/searchMemberQna.do" method="post">
			<div class="row">				
				<div class="col-sm-6">
					<div id="qna-sort">
						<table id="table-sort">
							<tbody>
								<tr>
									<th>답변상태 </th>
									<td>
										<div class="btn-group" data-toggle="buttons">
											<label class="btn btn-secondary active">
												<input type="radio" name="isRe" id="all" value="3" autocomplete="off" checked> 전체
											</label>
											<label class="btn btn-secondary">
												<input type="radio" name="isRe" id="complete" value="1" autocomplete="off"> 완료 
											</label>
											<label class="btn btn-secondary">
												<input type="radio" name="isRe" id="incomplete" value="0" autocomplete="off"> 대기 
											</label>
										</div>														
									</td>
								</tr>
								<tr>
									<th>카테고리</th>
									<td>										
										<div class="btn-group" data-toggle="buttons">
											<label class="btn btn-secondary active">
												<input type="checkbox" name="category" value=" " checked autocomplete="off"> 전체
											</label>
											<label class="btn btn-secondary">
												<input type="checkbox" name="category" value="결제" autocomplete="off"> 결제
											</label>
											<label class="btn btn-secondary">
												<input type="checkbox" name="category" value="회원" autocomplete="off"> 회원
											</label>
											<label class="btn btn-secondary">
												<input type="checkbox" name="category" value="주문" autocomplete="off"> 주문
											</label>
											<label class="btn btn-secondary">
												<input type="checkbox" name="category" value="포인트" autocomplete="off"> 포인트
											</label>
											<label class="btn btn-secondary">
												<input type="checkbox" name="category" value="리뷰" autocomplete="off"> 리뷰
											</label>
										</div>
									</td>
								</tr>
							</tbody>
						</table>		
					</div>	
				</div>
				<div class="col-sm-6">
					<div class="input-group">					
						<div class="form-group">
							<div class="input-group" id="qna-search">
								<input type="text" class="form-control" name="keyword" id="keyword" autocomplete="off" placeholder="제목을 입력하세요"/>
								<span class="input-group-btn">
									<input type="submit" class="btn btn-default" id="searchBar" value="검색"/>
								</span>
							</div>
						</div>
					</div>
				</div>		
			</div>
		</form>
			
			
			<div id="qnaList">
				<table class="table table-hover" id="qnaTable">
					<thead id="tableHead">
						<tr>	
							<th>카테고리</th>	
							<th style="width: 60%">제목</th>
							<th>작성자</th>
							<th>날짜</th>	
							<th>답변여부</th>						
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${mqList}" var="mq">
							<tr class="pnt" onclick="fn_qnaView(${mq.qnaCode})">
								<td>${mq.qnaCategory }</td>
								<td>${mq.qnaTitle }</td>
								<td>${mq.memberId }</td>
								<td>${mq.formatWriteDate }</td>
								<c:if test="${mq.isRe eq 0}">
									<%-- <td><img src="${path }/resources/images/admin/incomplete.png" width="30px" height="30px"/></td> --%>
									<td>대기</td>
								</c:if>
								<c:if test="${mq.isRe > 0 }">
									<%-- <td><img src="${path }/resources/images/admin/complete.png" width="30px" height="30px"/></td> --%>
									<td>완료</td>
								</c:if>
							</tr>				
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>