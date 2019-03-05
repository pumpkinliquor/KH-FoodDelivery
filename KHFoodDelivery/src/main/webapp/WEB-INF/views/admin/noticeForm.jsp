<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*, java.sql.*" 
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"></jsp:include>

<script>
function fn_validate(){
	var content =${"[name=noticeContent]".val();
	if(content.trim().length==0){
		alert("내용을 입력하세요.");
		return false;
	}
	return true;
	}
	
	
</script>


<div class="container">
	<div class="row">
		<div class="col-md-12">
			<form
				action="${path}/admin/noticeFormEnd.do" method="post">
				<table class="table table-bordered board" id="notice_table" name="notice_table">

					<tbody>
						<tr>
			        		<th>작성자</th>
			        		<td>
				        		<input type="text" name="customerId" class="form-control" value="${sessionScope.customerId=='admin' }" required readonly/>
				        		
			        		</td>
			        	</tr>
						  <tr>
			                <th>제목</th>
			                <td><input type="text" placeholder="제목 " name="noticeTitle" class="form-control"/></td>
			            </tr>
			            <tr>
			                <th>내용</th>
			                <td><textarea cols="10" placeholder="내용" name="noticeCont" class="form-control" style="resize:none; height:15em;"></textarea></td>
			            </tr>
			            <div class="input-group mb-3" style="padding:0px;">
			            <tr>
			                <th>
								<div class="input-group-prepend" style="padding:0px;">
			                    	<span class="input-group-text">첨부파일1</span>
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
			                    	<span class="input-group-text">첨부파일2</span>
			                	</div>
							</th>
			                <td>
			                	<div class="custom-file">
				                    <input type="file" class="custom-file-input" name="upFile" id="upFile2">
				                    <label class="custom-file-label" for="upFile2">파일을 선택하세요</label>
			                	</div>
		                	</td>
			            </tr>
					</div>
			            <tr>
			                <td colspan="2">
			                <button name="noticeListBtn" class="btn btn-default float-left" onclick="location.href='${path}/admin/memberNoticeList.do'">목록</button>
			                    <input type="submit" value="등록" class="btn btn-outline-success float-right" onclick="fn_validate()"/>
			                </td>
			            </tr>
			    </tbody>
			</table>

			</form>

		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>