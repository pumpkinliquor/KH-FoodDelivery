<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*, java.sql.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/ownerHeader.jsp"></jsp:include>

<section>
	<div class="container">
		<div class="row">
			<div class="col-sm-10">
				<h4>어떻게 수정 요청하나요?</h4>
			</div>
			<div class="col-sm-2">
				<button>목록으로</button>				
			</div>
			<div class="col-sm-2">
				<p>작성자 <b>hwang3324</b></p>
			</div>
			<div class="col-sm-2">
				<p>2019-02-28 12:14</p>
			</div>
			<div class="col-sm-2">
				<p>조회 12회</p>
			</div>
			<div class="col-sm-2">
				<p>댓글 12건</p>
			</div>
			<div class="col-sm-2"></div>
			<div class="col-sm-2">
				<button>수정</button>
				<button>삭제</button>			
			</div>	
		</div>
		<br/>	
		<div class="row">			
			<div class="col-sm-12">
				궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요
				궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요궁금해요
			</div>
			<div class="col-sm-2"></div>
		</div>
		<hr/>
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<textarea rows="3" cols="100" class="form-control" style="resize:none;"></textarea>
			</div>
			<div class="col-sm-1">
				<button>등록</button>
			</div>
		</div>
	</div>
</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
