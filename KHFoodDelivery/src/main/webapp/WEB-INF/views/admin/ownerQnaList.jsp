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
	thead#tableHead{ background-color: rgb(219, 83, 83); color: white; }
	.pnt{ cursor: pointer; }
	table#qnaTable{ table-layout: fixed; word-wrap: break-word; }
	table#qnaTable th, table#qnaTable td{ text-align: center; vertical-align: middle; }
	div#qna-category{display: inline; margin-top: 20px;}
	select{display: inline; margin-top: 20px;}
	div#qna-search{display: inline; margin-top: 20px; float: right;}
	div#qna-sort{ float: left; margin-top: 20px;}
	table#table-sort{ border: 1px solid #444444; border-collapse: collapse; }
	table#table-sort th{ background-color: #4D4D4D; color: rgba(255, 255, 255, .5); border: 1px solid #444444; padding: 0; }
	table#table-sort td{ border: 1px solid #444444; padding: 0; }
	input[type=checkbox], input[type=radio] {display: none; }
	input[type=submit] {background-color: rgb(219, 83, 83); color: white;}
	label{background-color: rgb(219, 83, 83); color: white;}
	label.active{background-color: rgb(250, 80, 80); color: white;}
</style>

<script>	
	function fn_qnaView(no){
		location.href="${path}/admin/ownerQnaView.do?no="+no;		
	}		
</script>

<section>
	<div class="container">			
		<h4 id="titleText">사장님 문의 내역</h4>
		
		<form class="form-controll navbar-right" role="search" action="${path }/admin/searchOwnerQna.do" method="post">
			<div class="row">
				<div class="col-sm-4">
					<div id="qna-sort">
						<div class="btn-group" data-toggle="buttons">
							<label class="btn active">
								<input type="radio" name="isRe" id="all" value="3" autocomplete="off" checked> 전체
							</label>
							<label class="btn">
								<input type="radio" name="isRe" id="complete" value="1" autocomplete="off"> 완료 
							</label>
							<label class="btn">
								<input type="radio" name="isRe" id="incomplete" value="0" autocomplete="off"> 대기 
							</label>
						</div>
					</div>
				</div>
				<div class="col-sm-3"></div>
				<div class="col-sm-1">
					<div id="qna-category" class="form-group">
						<select class="form-control" name="category" style="width: auto">
							<option value="전체">전체</option>
							<option value="결제">결제</option>
							<option value="손님">손님</option>
							<option value="주문">주문</option>
							<option value="포인트">포인트</option>
							<option value="리뷰">리뷰</option>
						</select>	
					</div>	
				</div>
				<div class="col-sm-4">
					<div class="input-group" id="qna-search">			
						<div class="form-group">						
							<div class="input-group">														
								<input type="text" class="form-control" name="keyword" id="keyword" autocomplete="off" placeholder="제목을 입력하세요"/>
								<input type="hidden" name="isFirst" value="1"/>
								<span class="input-group-btn">
									<input type="submit" class="btn btn-default" id="searchBar" value="검색"/>
								</span>
							</div>
						</div>
					</div>
				</div>		
			</div>
		</form>

		<!-- 문의 내역 테이블 -->		
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
					<c:forEach items="${oqList}" var="oq">
						<tr class="pnt" onclick="fn_qnaView(${oq.qnaCode})">
							<td><c:out value="${oq.qnaCategory }"/></td>
							<td><c:out value="${oq.qnaTitle }"/></td>
							<td><c:out value="${oq.ownerId }"/></td>
							<td><c:out value="${oq.formatWriteDate }"/></td>
							<c:if test="${oq.isRe eq 0}">
								<td><img src="${path }/resources/images/admin/incomplete.png" width="30px" height="30px"/></td>
							</c:if>
							<c:if test="${oq.isRe > 0 }">
								<td><img src="${path }/resources/images/admin/complete.png" width="30px" height="30px"/></td>
							</c:if>
						</tr>				
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="paging">
			${pageBar}
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/adminFooter.jsp"></jsp:include>