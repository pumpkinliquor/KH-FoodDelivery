<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*, java.sql.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/ownerHeader.jsp"></jsp:include>
<style>
	 .modal {
	       text-align: center;
	}

	@media screen and (min-width: 768px) { 
		.modal:before {
			display: inline-block;
			vertical-align: middle;
			content: " ";
			height: 100%;
		 }
	}	

	.modal-dialog {
		display: inline-block;
		text-align: left;
		vertical-align: middle;
	}

	div.modal-content{
		width: 400px;
	}
	textarea#updateContext{
		resize: none;
	}
</style>	
<section>
	<div class="container">
		<div class="row">
			<div class="col-sm-10">
				<h4>${views.QNATITLE }</h4>
			</div>
			<div class="col-sm-2" style="margin-bottom:1em;">
				<button class="btn btn-default" onclick="location.href='${path}/owner/oneVSoneList.do'">문의게시판</button>
			</div>
			<div class="col-sm-2">
				<p>작성자 <b>${views.OWNERID }</b></p>
			</div>
			<div class="col-sm-3">
				<p>${views.WRITEDATE }</p>
			</div>
			<div class="col-sm-5">
				<p>분류 : ${views.QNACATEGORY }
			</div>
			<div class="col-sm-2">
				<button onclick="qnaDelete(${views.QNACODE});" class="btn btn-default">삭제</button>
			</div>	
		</div>
		<br/>	
		<div class="row">			
			<div class="col-sm-12">
				${views.QNACONTENT }
			</div>
		</div>
		<hr/>
		<script>
		//파일다운로드
		function fileDownLoad(oriName, reName){
			if(oriName==null||reName==null){
				alert("첨부파일을 다운로드 할 수 없습니다.");
				return false;
			}
			if(confirm(oriName+"을(를) 다운로드 하시겠습니까?")){
				oriName=encodeURIComponent(oriName); //한글일 가능성 때문 
				location.href="${path}/owner/fileDownLoad.do?oriName="+oriName+"&reName="+reName;
				return true;
			}
		}
		//게시물 삭제
		function qnaDelete(qnaCode){
			if(confirm("정말 삭제하시겠습니까?")){
			location.href="${path}/owner/qnaDelete.do?qnaCode="+qnaCode;
			return true;
			}
		}
		//로그인 예외처리
		function loginException(){
			alert('로그인 하십시오.');
			location.href='${path}/owner/login.do';
		}
		</script>
		<div class="filesDiv" style="margin-bottom:5em; text-align:left;">
		<c:forEach items="${attach}" var="a" varStatus="vs">
        <button type="button" style="padding:0px; background-color:white; cursor:pointer; border:0px;" class="fileDownLoadBtn" onclick="fileDownLoad('${a.ORIGINALFILENAME}','${a.RENAMEDFILENAME}');">
         	<img src="${path }/resources/images/owner/icons/attach_file_icon.png" width=17px;/> - ${a.ORIGINALFILENAME}
        </button>
    	</c:forEach>
    	</div>
		<div class="rounded" style="border:1px solid rgb(173, 173, 173); padding-bottom:1em; padding-right:1em; padding-left:1em;">
	        <div class="commentList" style="margin-top:2em;">
	        	<c:forEach var="comment" items="${commentList}">
			        <table class="table table-bordered">
			        	<th>
			        	<small>
				            <span class='info'><strong style='color:#220706;'>관리자</strong></span>
				            <span class='line'>|</span>
				            <span class='reviewdate'>${comment.WRITEDATE }</span>
				            <span style="float:right;" class="reviewBtn">
				            </span>
			            </small>
			            </th>
			            <tr>
			            <td>${comment.REVIEWCONTEXT }</td>
			            </tr>
			        </table>
	            </c:forEach>
	        </div>
        </div>
    </div>
</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
