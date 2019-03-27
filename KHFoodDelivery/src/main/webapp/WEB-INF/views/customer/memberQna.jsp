<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*, java.sql.*" 
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<script>

$(function(){
	   $('[name=upFile]').on('change',function(){
	      var filename=this.files[0].name;
	      $(this).next('.custom-file-label').html(filename);
	   });
	});

function validate123(){
    var content = $("#qnaContent").val();
    var title = $("#qnaTitle").val();
    if(content.trim().length==0){
        alert("내용을 입력하세요");
        return false;
    }if(title.trim().length==0){
    	alert("제목을 입력하세요");
    	return false;
    }
    return true;
}
</script>
<section>
<div class="container">
	<div style="text-align:center; margin-bottom:5em;">
		<h2 style="font-weight:bold;">1:1문의</h2>
	</div>
	<div class="col-md-12">
		<form name="memQnaFrm" action="${path }/customer/memberQnaAddform.do?no=${sessionScope.loginedno}" onsubmit="return validate123()" method="post" enctype="multipart/form-data" >
		
			<table class="table table-bordered">
			    <tbody>
			        	<tr>
			        		<th>작성자</th>
			        		<td>
				        		<input type="text" id="memberId" class="form-control" value="${sessionScope.logined}" readonly/>
			        		</td>
			        	</tr>
			        	<tr>
			        		<th>분류</th>
			        		<td>
			        			<select name="qnaCategory">
			        				<option value="결제">결제</option>
				   					<option value="주문">주문</option>
				   					<option value="포인트">포인트</option>
				   					<option value="리뷰">리뷰</option>
			        			</select>
			        		</td>
			        	</tr>
			            <tr>
			                <th>제목</th>
			                <td><input type="text" placeholder="제목 " name="qnaTitle" id="qnaTitle" class="form-control" required></td>
			            </tr>
			            <tr>
			                <th>내용</th>
			                <td><textarea cols="8" placeholder="내용" id="qnaContent" name="qnaContent" class="form-control" style="resize:none; height:15em;" required></textarea></td>
			            </tr>
			             <tr>
			                <th>
								<div class="input-group-prepend" style="padding:0px;">
			                    	<label for="upFile1"><span class="input-group-text">첨부파일#1</span></label>
				                </div>
							</th>
			                <td>
           	 					<div class="custom-file">
				                    <input type="file" class="custom-file-input" name="upFile" id="upFile1">
				                    <label class="custom-file-label" for="upFile1">파일을 선택하세요</label>
		               	 		</div>
		                	</td>
			            </tr>
			            <tr>
			                <td colspan="2">
			                    <input type="submit" value="문의하기" class="btn btn-outline-success" style="float:right;"/>
			                </td>
			            </tr>
			        	<input type="hidden"  name="memberId" value="${sessionScope.logined}"/>  
			    </tbody>
			</table>
		</form>
	</div>
</div>

</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>