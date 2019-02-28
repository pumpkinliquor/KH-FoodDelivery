<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*, java.sql.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"></jsp:include>

<style>
#noticeViewDate {
	color: #898989;
}

button#noticeCancelkBtn{
	background-color: transparent;
	border-color: transparent;
}

button#noticeUpBtn{
background-color: transparent;
	border-color: transparent;
}

button#noticeListBtn{
background-color: transparent;
	border-color: transparent;
}
</style>


<section>
	<div class="container">
		<div class="row">
			<div class="col-sm-10">
				<h4>제목제목제목제목제목제목</h4>
			</div>
			<div class="col-sm-2">		
			</div>
			<div class="col-sm-1">
				<p>글번호 <b>1</b></p>
			</div>
			<div class="col-sm-3">
				<p>2019-02-28 11:15:28</p>
			</div>
			<div class="col-sm-2">
			</div>
			<div class="col-sm-2">
			</div>
			<div class="col-sm-2"></div>
			<div class="col-sm-2">			
				<button id="noticeCancelkBtn" name="noticeCancelkBtn" class="btn btn-default float-right">삭제</button>
				<button id="noticeUpBtn" type="submit" onclick="return validate();" class="btn btn-default float-right">수정</button>
			</div>	
		</div>
		<hr/>
		<br/>	
		<div class="row">			
			<div class="col-sm-12">
				아아ㅏ앙ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ아아아아아ㅏ앙ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ아아아아아ㅏ앙ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ아아아
					아아ㅏ앙ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ아아아아아ㅏ앙ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇdddddddddddddddddddddddㅇㅇㅇ아아아
						아아ㅏ앙ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ아아아아아ㅏ앙ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ아아아아아ㅏ앙ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ아아아
					아아ㅏ앙ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ아아아아아ㅏ앙ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇdddddddddddddddddddddddㅇㅇㅇ아아아
			</div>
			<div class="col-sm-2"></div>
		</div>
		<br>
		<hr>
		<button id="noticeListBtn" class="btn btn-default">목록</button>
	</div>
</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>