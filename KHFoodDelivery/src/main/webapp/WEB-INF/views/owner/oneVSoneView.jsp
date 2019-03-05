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
			<div class="col-sm-2">
				<button>목록으로</button>				
			</div>
			<div class="col-sm-2">
				<p>작성자 <b>${views.OWNERID }</b></p>
			</div>
			<div class="col-sm-6">
				<p>${views.WRITEDATE }</p>
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
				${views.QNACONTENT }
			</div>
			<div class="col-sm-2"></div>
		</div>
		<hr/>
		<div class="rounded" style="border:1px solid rgb(173, 173, 173); padding-bottom:1em; padding-right:1em; padding-left:1em; padding-top:1em;">
        <label for="reviewContext">댓글</label>
        <form name="commentInsertForm" action="${path }/owner/qnaReviewForm.do">
            <div class="input-group">
               <input type="hidden" name="qnaCode" value="${views.QNACODE}"/>
               <input type="hidden" name="ownerNum" value="${sessionScope.ownerNum }"/>
               <input type="text" class="form-control" id="reviewContext" name="reviewContext" style="margin-right:1em;" placeholder="내용을 입력하세요.">
               <span class="input-group-btn">
                    <button class="btn btn-default" type="submit">등록</button>
               </span>
              </div>
        </form>
        </div>
        <div class="commentList" style="margin-top:2em;">
        	<c:forEach var="comment" items="${commentList}">
        		<script>
				//모달창 띄우기
			    $(function() {
			        $("#modalBtn${comment.QNAREVIEWCODE}").click(function(){
			            $('div.modal').modal();
			            $('#reQnaReviewCode').val(${comment.QNAREVIEWCODE});
			            $('#updateContext').val("${comment.REVIEWCONTEXT}");
			            $('#qnaCode').val(${comment.QNACODE})
			        });
			    });
				//모달 안 수정버튼
				function updateReview() {
					$('#updateReviewFrm').submit();
				}
			    </script>
		        <table class="table table-bordered">
			        	<th>
			        	<small>
				            <span class='info'><strong style='color:#220706;'>${comment.OWNERID }</strong></span>
				            <span class='line'>|</span>
				            <span class='reviewdate'>${comment.WRITEDATE }</span>
				            <span style="float:right;" class="reviewBtn">
				            <button class="updBtn" id="modalBtn${comment.QNAREVIEWCODE}" type="button">수정</button>
				            <button class="delBtn" onclick="location.href='${path}/owner/reviewDelete.do?qnaReviewCode=${comment.QNAREVIEWCODE }&qnaCode=${comment.QNACODE }'" type="button">삭제</button>
				            </span>
			            </small>
			            </th>
			            <tr>
			            <td>${comment.REVIEWCONTEXT }</td>
			            </tr>
		        </table>
            </c:forEach>
        </div>
		<div class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- header -->
					<div class="modal-header">
					<!-- 닫기(x) 버튼 -->
					<button type="button" class="close" data-dismiss="modal">×</button>
					<!-- header title -->
					<div class="modal-title">
					</div>
					</div>
					<!-- body -->
					<div class="modal-body">
					<h6>수정할 내용</h6>
						<form action="${path }/owner/reviewUpdate.do" method="post" id="updateReviewFrm">
						<textarea cols="40" rows="5" name="updateContext" id="updateContext" class="form-control" value="" required></textarea>
						<input type="hidden" name="reQnaReviewCode" id="reQnaReviewCode" value=""/>
						<input type="hidden" name="qnaCode" id="qnaCode" value=""/>
						</form>
					</div>
					<!-- Footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-default" onclick="updateReview();">수정</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
    </div>
</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
