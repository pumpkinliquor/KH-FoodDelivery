<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"></jsp:include>

<style>
	div#context-area{ min-height: 200px; }
	button {
		background-color: transparent;
		border-color: transparent;
	}
</style>

<script>
	/* 댓글 삭제 */
	function fn_deleteReview(){
		location.href="${path}/admin/deleteMemberQnaReview.do?no=${mq.qnaCode}";
	}
	/* 댓글 수정 */
	function fn_updateReview(){
		$('#reviewUpdateModal').modal();		
	}
	/* 문의 글 삭제 */
	function fn_deleteQna(){
		location.href="${path}/admin/deleteMemberQna.do?no=${mq.qnaCode}";
	}
	/* 파일다운로드 */
	function fileDownLoad(oriName, reName){
		if(oriName==null||reName==null){
			alert("첨부파일을 다운로드 할 수 없습니다.");
			return false;
		}
		if(confirm(oriName+"을(를) 다운로드 하시겠습니까?")){
			oriName=encodeURIComponent(oriName); //한글일 가능성 때문 
			location.href="${path}/admin/memberfileDownLoad.do?oriName="+oriName+"&reName="+reName;
			return true;
		}
	}
</script>

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
			<div class="col-sm-3">				
			</div>			
			<div class="col-sm-2">			
				<button type="button" class="btn" onclick="fn_deleteQna()">삭제</button>
				<button type="button" class="btn" onclick="location.href='${path}/admin/memberQnaList.do'">목록으로</button>			
			</div>	
		</div>
		<hr/>
		<br/>	
		<div class="row">			
			<div class="col-sm-12" id="context-area">
				<p>${mq.qnaContent }</p>
			</div>
			<div>
				<c:forEach items="${attach}" var="a" varStatus="vs">
					 <button type="button" style="padding:0px; background-color:white; cursor:pointer; border:0px;" class="fileDownLoadBtn" onclick="fileDownLoad('${a.ORIGINALFILENAME}','${a.RENAMEDFILENAME}');">
	         			<img src="${path }/resources/images/owner/icons/attach_file_icon.png" width=17px;/> - ${a.ORIGINALFILENAME}
	        		</button>
        		</c:forEach>
			</div>
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
					<button class="btn float-right" onclick="fn_deleteReview()">삭제</button>
					<button class="btn float-right" onclick="fn_updateReview()">수정</button>
				</div>
				<div class="col-sm-12">
					<p>${mqr.reviewContext }</p>
				</div>
			</div>
		</c:if>
		
		<c:if test="${empty mqr }">
			<hr/>
			<form action="${path }/admin/insertMemberQnaRe.do" method="post">		
				<div class="rounded row" style="border:1px solid rgb(173, 173, 173); padding-bottom:1em; padding-right:1em; padding-left:1em; padding-top:1em;">
            		<div class="input-group col-sm-11">
				       	<label for="reviewContext" style="margin-top:5px"> 댓글 </label> &nbsp;
            			<input type="hidden" name="qnaNo" value="${mq.qnaCode }"/>
               			<input type="text" class="form-control" name="context" style="margin-right:1em;" placeholder="내용을 입력하세요.">
         			</div>
         			<div class="col-sm-1">
         				<input type="submit" class="btn" value="등록"/>
         			</div>
        		</div>
			</form>			
		</c:if>
	</div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>


<!-- 모달 구현 -->
<div class="modal" id="reviewUpdateModal" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">댓글 수정</h4>
				<button type="button" class="close" data-dismiss="modal">×</button>
			</div>
			<form action="${path}/admin/updateMemberQnaReview.do?no=${mq.qnaCode}" method="post">
				<div class="modal-body" style="height: 200px;">
					<table class="table">
						<tr>
							<th style="vertical-align: middle">댓글</th>
							<td><textarea name="updateContext" class="form-control" style="resize: none" rows="6">${mqr.reviewContext }</textarea></td>						
						</tr>						
					</table>
				</div>
				<div class="modal-footer">
					<input type="submit" class="btn btn-outline-success" value="수정"/>
				</div>
			</form>
		</div>  
	</div>
</div>