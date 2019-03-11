<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"></jsp:include>

<style>
	div#context-area{ min-height: 200px; }
</style>

<section>
	<div class="container">
		<div class="row">
			<div class="col-sm-10">
				<h4>${mq.qnaTitle }</h4>
			</div>
			<div class="col-sm-2">
			</div>
			<div class="col-sm-2">
				<p>카테고리 <b>${mq.qnaCategory }</b></p>
			</div>
			<div class="col-sm-2">
				<p>작성자 <b>${mq.memberId }</b></p>
			</div>
			<div class="col-sm-3">
				<p>작성일<b>${mq.formatWriteDate }</b></p>
			</div>
			<div class="col-sm-4">				
			</div>			
			<div class="col-sm-1">
				<button class="btn">삭제</button>			
			</div>	
		</div>
		<hr/>
		<br/>	
		<div class="row">			
			<div class="col-sm-12" id="context-area">
				<p>${mq.qnaContent }</p>
			</div>
			<div class="col-sm-2"></div>
		</div>
		
		<c:if test="${!empty mqr}">
			<hr/>		
			<div class="row">
				<div class="col-sm-1">
					<p><b>관리자</b></p>
				</div>
				<div class="col-sm-9">
					<p>${mqr.formatWriteDate }</p>
				</div>
				<div class="col-sm-2">
					<button class="btn float-right">삭제</button>
					<button class="btn float-right">수정</button>
				</div>
				<div class="col-sm-12">
					<p>${mqr.reviewContext }</p>
				</div>
			</div>
		</c:if>
		
		<c:if test="${empty mqr }">
			<hr/>
			<div class="row">
				<form action="${path }/admin/insertMemberQnaRe.do" method="post">		
					<div class="col-sm-11">
						<textarea rows="3" cols="100" style="resize: none" class="form-control" name="context"></textarea>
					</div>
					<div class="col-sm-1" style="margin-top: 20px">
						<input type="submit" class="btn" value="등록"/>
					</div>
				</form>			
			</div>
		</c:if>
	</div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>