<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"></jsp:include>

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
				<p>${mq.formatWriteDate }</p>
			</div>
			<div class="col-sm-3">				
			</div>			
			<div class="col-sm-2">
				<button class="btn">수정</button>
				<button class="btn">삭제</button>			
			</div>	
		</div>
		<hr/>
		<br/>	
		<div class="row">			
			<div class="col-sm-12">
				<p>${mq.qnaContent }</p>
			</div>
			<div class="col-sm-2"></div>
		</div>
		<hr/>
		<div class="row">			
			<div class="col-sm-12">
				<textarea rows="3" cols="100" class="form-control"></textarea>
				<button>등록</button>
			</div>			
		</div>
	</div>
</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>