<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*, java.sql.*" 
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/ownerHeader.jsp"></jsp:include>
<script>
$(function(){
   $('[name=upFile]').on('change',function(){
      var filename=this.files[0].name;
      $(this).next('.custom-file-label').html(filename);
   });
});
function validate(){
    var content = $("#qnaContent").val();
    if(content.trim().length==0){
        alert("내용을 입력하세요");
        return false;
    }
    return true;
}
function maxLengthCheck(object){
	if (object.value.length > object.maxLength){
		alert('최대 입력량을 초과하였습니다.');
		object.value = object.value.slice(0, object.maxLength);
	}    
}
function check(){
	var fileNm = $("#upFile1").val();
	var fileNm2 = $("#upFile2").val();
	if (fileNm != ""||fileNm2 != "") {
	    var ext = fileNm.slice(fileNm.lastIndexOf(".") + 1).toLowerCase();
	    var ext2 = fileNm2.slice(fileNm.lastIndexOf(".") + 1).toLowerCase();
	    if (!(ext == "jpg" || ext == "png" || ext2 == "jpg" || ext2 =="png")) {
	        alert("이미지파일 (.jpg, .png ) 만 업로드 가능합니다.");
	        return false;
	    }
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
		<form name="qnaFrm" action="${path }/owner/oneVSoneFormEnd.do" onsubmit="return check();" method="post" enctype="multipart/form-data">
			<table class="table table-bordered">
			    <tbody>
			        	<tr>
			        		<th>작성자</th>
			        		<td>
				        		<input type="text" id="ownerId" class="form-control" value="${sessionScope.ownerId }" readonly/>
			        		</td>
			        	</tr>
			        	<tr>
			        		<th>분류</th>
			        		<td>
			        			<select name="qnaCategory">
			        				<option value="결제">결제</option>
				   					<option value="회원">회원</option>
				   					<option value="주문">주문</option>
				   					<option value="포인트">포인트</option>
				   					<option value="리뷰">리뷰</option>
			        			</select>
			        		</td>
			        	</tr>
			            <tr>
			                <th>제목</th>
			                <td><input type="text" maxlength="50" min="0" oninput="maxLengthCheck(this);" placeholder="50글자 이내 " name="qnaTitle" class="form-control" required></td>
			            </tr>
			            <tr>
			                <th>내용</th>
			                <td><textarea maxlength="1000" oninput="maxLengthCheck(this);" cols="10" placeholder="내용" id="qnaContent" name="qnaContent" class="form-control" style="resize:none; height:15em;" required></textarea></td>
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
			                <th>
								<div class="input-group-prepend" style="padding:0px;">
			                    	<label for="upFile2"><span class="input-group-text">첨부파일#2</span></label>
			                	</div>
							</th>
			                <td>
			                	<div class="custom-file">
				                    <input type="file" class="custom-file-input" name="upFile" id="upFile2">
				                    <label class="custom-file-label" for="upFile2">파일을 선택하세요</label>
			                	</div>
		                	</td>
			            </tr>
			            <tr>
			                <td colspan="2">
			                    <input type="submit" value="문의하기" class="btn btn-outline-success" style="float:right;"/>
			                </td>
			            </tr>
			    </tbody>
			</table>
		</form>
	</div>
</div>
</section>
<jsp:include page="/WEB-INF/views/common/ownerFooter.jsp"></jsp:include>