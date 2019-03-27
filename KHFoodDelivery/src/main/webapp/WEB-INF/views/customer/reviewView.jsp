<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<style>
	div#context-area{ min-height: 200px; }
	div.row div.bt-group{float:right;}
	button.b1 {
		background-color: black;
		border-color: white;
		color:white;
	}
	div.de{margin-top:-10%;}
	.avatar:hover {

  -webkit-transform: scale(1.8);

 
}
</style>

<script>	

	//문의글 수정
	function updateQna(){
		$('#qnaUpdateModal').modal();
	}
	/* 문의 글 삭제 */
	function deleteQna(){
		location.href="${path}/customer/deletememberQna.do?no=${mq.qnaCode}&memberId=${mq.memberId}";
	}
	

</script>

<section>
 
	<div class="container de" style="padding-top:250px">  
		<div class="row" >
			<div class="col-sm-12">
			</div>
			<div class="col-sm-2">
				<p>카테고리: <b>${review.STORENAME }</b></p>
			</div>
			<%-- <div class="col-sm-2">
				<p>작성자: <b>${mq.memberId }</b></p>
			</div>
			<div class="col-sm-3">
				<p>작성일:  <b>${mq.formatWriteDate }</b></p>
			</div> --%>
			<div class="bt-group col-sm-5">			
				<button type="button" class="btn btn-default b1" onclick="deleteQna()">삭제</button>
				<button type="button" class="btn btn-default b1" onclick="updateQna();">수정</button>	
				<button type="button" class="btn btn-default b1" onclick="location.href='${path }/member/qnaList.do?memberId=${sessionScope.logined}'">목록으로</button>			
			</div>	
		</div>
		<hr/>
		<br/>	
		<div class="row">			
			<div class="col-sm-12" id="context-area">
				<%-- <h4>${mq.qnaContent }</h4> --%>
			
			</div>
				<div>
				<%--  <c:forEach items="${attach}" var="a" varStatus="vs">
	         			
	         		<img name="file" title="profile image" class="avatar img-circle img-thumbnail"  width="300px"  height="300px"alt="avatar" src="${path}/resources/upload/member/qnaAttach/${a.ORIGINALFILENAME}"/>  
        		</c:forEach>  --%>
				</div>
			<div class="col-sm-2 back"></div>
		</div>
	<%-- 	<c:if test="${!empty mqr}">
			<hr/>		
			<div class="row">
				<div class="col-sm-1">
					<p><b>관리자</b></p>
				</div>
				<div class="col-sm-9">
					<p>${mqr.formatWriteDate }</p>
				</div>				
				<div class="col-sm-2">
				</div>
				<div class="col-sm-12">
					<p>${mqr.reviewContext }</p>
				</div>
			</div>
		</c:if> --%>
	</div>
</section>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>


<!-- 모달 구현 -->
<div class="modal" id="qnaUpdateModal" role="dialog">
<script>

$(function(){
	   $('[name=upFile]').on('change',function(){
	      var filename=this.files[0].name;
	      $(this).next('.custom-file-label').html(filename);
	   });
	});

</script>
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">문의글 수정</h4>
				<button type="button" class="close" data-dismiss="modal">×</button>
			</div>
			<form action="${path}/customer/memberQnaUpdate.do" method="post" enctype="multipart/form-data" >
				<div class="modal-body" style="height: 600px;">
					<table class="table">
						<tr>
							<th style="vertical-align: middle">카테고리</th>
							<td><input type="text" name="qnaCategory" class="form-control" value="${mq.qnaCategory }"/></td>						
						</tr>					
						<tr>
							<th style="vertical-align: middle">아이디</th>
							<td><input type="text" name="memberId" class="form-control" value="${mq.memberId }" readonly/></td>						
						</tr>						
						<tr>
							<th style="vertical-align: middle">등록일</th>
					<td><input type="text" name="formatWriteDate" class="form-control" value="${mq.formatWriteDate}" readonly/></td>						
						</tr>	
						<tr>
							<th style="vertical-align: middle">제목</th>
							<td><input type="text" name="qnaTitle" class="form-control" value="${mq.qnaTitle}"/></td>						
						</tr>						 
					
						<tr>
							<th style="vertical-align: middle">문의글</th>
							<td><textarea name="qnaContent" class="form-control" style="resize: none" rows="6">${mq.qnaContent }</textarea></td>						
						</tr>
						<c:forEach items="${attach }" var="a">
						    <tr>
			                <th>
								<div class="input-group-prepend" style="padding:0px;">
			                    	<label for="upFile1"><span class="input-group-text">파일수정</span></label>
				                </div>
							</th>
			                <td>
           	 					<div class="custom-file">
				                    <input type="file" class="custom-file-input" name="upFile" id="upFile1"/>
				                    <label class="custom-file-label" for="upFile1">${a.ORIGINALFILENAME}</label>
		               	 		</div>
		                	</td>
			            </tr>
			            </c:forEach>
			             
						
					</table>
						<input type="hidden" name="qnaCode" value="${mq.qnaCode }"/>
				</div>
				<div class="modal-footer">
					<input type="submit" class="btn btn-outline-success" value="수정"/>
				</div>
			</form>
		</div>  
	</div>
</div>


