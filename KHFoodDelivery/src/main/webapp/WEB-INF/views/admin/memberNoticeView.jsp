<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*, java.sql.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/Astyle.css" />

<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"></jsp:include>

<style>
div#noticeContectDiv{
	min-height: 200px;
}
</style>
<script>
//게시글 삭제
function fn_memberNoticeDel(e){
	
	var num = $(e).val();
	
	location.href="${path}/admin/memberNoticeDel.do?noticeNum="+num;
	alert("삭제되었습니다.");
}


//파일다운로드
function fileDownLoad(oriName,reName){
	if(oriName==null||reName==null){
		alert("첨부파일을 다운로드 할 수 없습니다.");
		return false;
	}
	if(confirm(oriName+"을(를) 다운로드 하시겠습니까?")){
		oriName=encodeURIComponent(oriName);
		location.href="${path}/admin/fileDownLoad.do?oriName="+oriName+"&reName"+reName;
		return true;
	}
}



/*  function fn_memberNoticeUp(e){
	var num2=$(e).val();
	location.href="${path}/admin/memNoticeUpdate.do?noticeNum="+num2;
	
} */


</script>


<section>
	<div class="container">
		<div class="row">
			<div class="col-sm-10">
				<h4>${notice.NOTICETITLE }</h4>
			</div>
			<div class="col-sm-2">		
			</div>
			<div class="col-sm-2">
				<p>글 번호 <b>${notice.NOTICENUM }</b></p>
			</div>
			<div class="col-sm-2">
				<p>작성자 <b>관리자</b></p>
			</div>
			<div class="col-sm-3">
				<p>${notice.WRITEDATE }</p>
			</div>
			<div class="col-sm-1">
			</div>
			<div class="col-sm-1">
			</div>
			<div class="col-sm-1"></div>
			<div class="col-sm-2">			
				<button id="noticeCancelkBtn" name="noticeCancelkBtn" class="btn btn-default float-right" value="${notice.NOTICENUM }" onclick="fn_memberNoticeDel(this)">삭제</button>
				<button id="noticeUpBtn"  class="btn btn-default float-right" value="${notice.NOTICENUM }" onclick="fn_memberNoticeUp(this)">수정</button>
			</div>	
		</div>
		<hr/>
		<br/>	
		<div class="row">			
			<div class="col-sm-12" id="noticeContectDiv">
				${notice.NOTICECONTENT}
			</div>
			<div>
			<c:forEach items="${attach}" var="a" varStatus="vs">
        <button type="button" style="padding:0px; background-color:white; cursor:pointer; border:0px;" class="fileDownLoadBtn" onclick="fileDownLoad('${a.ORIGINALFILENAME}','${a.RENAMEDFILENAME}');">
         	<img src="${path }/resources/images/owner/icons/attach_file_icon.png" width=17px;/> - ${a.ORIGINALFILENAME}
        </button>
    	</c:forEach>
    	</div>
			<div class="col-sm-2"></div>
		</div>
		<br>
		<hr>
		<button id="noticeListBtn" class="btn btn-default" onclick="location.href='${path}/admin/memberNoticeList.do'">목록</button>
	</div>
</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>