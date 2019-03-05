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
        <div class="commentList" style="margin-top:2em;">
        	<c:forEach var="comment" items="${commentList}">
		        <table class="table table-bordered">
			        	<th>
			        	<small>
				            <span class='info'><strong style='color:#220706;'>${comment.OWNERID }</strong></span>
				            <span class='line'>|</span>
				            <span class='reviewdate'>${comment.WRITEDATE }</span>
				            <span style="float:right;" class="reviewBtn">
				            <button class="UpdBtn" onclick="location.href='${path}/owner/reviewUpdate.do'" type="button">수정</button>
				            <button class="delBtn" onclick="location.href='${path}/owner/reviewDelete.do'" type="button">삭제</button>
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
</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
