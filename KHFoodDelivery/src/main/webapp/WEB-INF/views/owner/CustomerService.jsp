<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*, java.sql.*" 
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"></jsp:include>
<style>
	/* Bootstrap 수정 */
    .table > thead {
      background-color: rgb(253, 238, 238);
    }
    .table > thead > tr > th {
      text-align: center;
    }
    .table-hover > tbody > tr:hover {
      background-color: #e6ecff;
    }
    .table > tbody > tr > td {
      text-align: center;
    }
    .table > tbody > tr > #title {
      text-align: left;
    }
	#list {
		text-align: center;
    }
	#write {
		text-align: right;
    }
    #oneVsoneTitle{
    	float: left;
    }
    #questBtn{
    	margin-bottom:10px;
    	width:16em;
    	text-align:center;
    }
    #oneVSoneBtn{
    	margin-bottom:10px;
    	width:16em;
    	text-align:center;
    }
    #keywordBtn{
   		margin-top:10px;
    	width:6em;
    }
    #keyword{
    	margin-top:10px;
    	width:26em;
    }
    .search{
    	margin-top:10px;
    }
    #emailHelp{
    	padding-left:12px;
    } 
    .oneVSoneBtn {
		background-color: rgb(200, 226, 255); 
		border: none;
		color: rgb(106, 108, 255);
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 16px;
		cursor:pointer;
		float:left;
		-webkit-transition-duration: 0.4s; /* Safari */
		transition-duration: 0.4s;
	}
	.oneVSoneBtn:hover {
		background-color: rgb(117, 119, 255);
		color: white;
		box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
	}
	.questBtn {
		background-color: rgb(200, 226, 255);
		border: none;
		color: rgb(106, 108, 255);
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 16px;
		cursor:pointer;
		float:left;
		-webkit-transition-duration: 0.4s; /* Safari */
		transition-duration: 0.4s;
	}
	.questBtn:hover {
		background-color: rgb(117, 119, 255); 
		color: white;
		box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
	}
	.oneVSoneWrite1 {
		-moz-box-shadow:inset 0px 1px 11px 5px rgb(200, 226, 255);
		-webkit-box-shadow:inset 0px 1px 11px 5px rgb(200, 226, 255);
		background-color: rgb(200, 226, 255);
		border-radius: 4px;
		padding: 4px 20px;
		border: 1px solid rgb(161, 191, 224);
		color: rgb(106, 108, 255);
		font-weight:bold;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 16px;
		cursor:pointer;
		-webkit-transition-duration: 0.4s; /* Safari */
		transition-duration: 0.4s;
	}
	.oneVSoneWrite1:hover {
		-moz-box-shadow:inset 0px 1px 11px 5px  rgb(117, 119, 255);
		-webkit-box-shadow:inset 0px 1px 11px 5px  rgb(117, 119, 255);
		background-color:  rgb(117, 119, 255); 
		color: white;
	}
	.oneVSoneWrite2 {
		-moz-box-shadow:inset 0px 1px 11px 5px rgb(200, 226, 255);
		-webkit-box-shadow:inset 0px 1px 11px 5px rgb(200, 226, 255);
		background-color: rgb(200, 226, 255);
		border-radius: 4px;
		padding: 4px 20px;
		border: 1px solid rgb(161, 191, 224);
		color: rgb(106, 108, 255);
		font-weight:bold;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 16px;
		cursor:pointer;
		-webkit-transition-duration: 0.4s; /* Safari */
		transition-duration: 0.4s;
	}
	.oneVSoneWrite2:hover {
		-moz-box-shadow:inset 0px 1px 11px 5px  rgb(117, 119, 255);
		-webkit-box-shadow:inset 0px 1px 11px 5px  rgb(117, 119, 255);
		background-color:  rgb(117, 119, 255); 
		color: white;
	}
</style>
</head>
<body>
	<div class="container">
	   	<div class="top">
	   		<div class="row">
	   			<div class="col-md-12">
	   				<button class="oneVSoneBtn" id="oneVSoneBtn" onclick="location.href='${path}/owner/oneVSoneQ.do'">1:1문의</button>
	   				<button class="questBtn" id="questBtn" onclick="">나의 문의내역</button>
	   			</div>
	   		</div>
	   	</div>
	   	
	   	<div class="search">
	   		<div class="row">
	   			<div class="col-md-12">
	   				<form class="form-inline">
	   				<div class="form-group" style="padding-left: 0px;">
					<input type="search" style="margin-right: 5px;" class="form-control" id="keyword" name="keyword" placeholder="제목이나 내용을 입력하세요." value="${param.keyword!=null?param.keyword:''}"/>
					<input type="submit" class="btn btn-outline-primary" id="keywordBtn" value="검색"/>
					</div>
					</form>
					<label for="keyword"><small id="emailHelp" style="float:left;" class="form-text text-muted">Please enter a title or content.</small></label>
	   			</div>
	   		</div>
	   	</div>
		<div class="middle">
			<div class="row">
				<div class="col-md-6">
					<div>
						<div id="oneVsoneTitle">
							<label for="oneVSoneWrite1" class="control-label" style="font-size:30px; font-weight:bold; cursor:pointer;">공지사항</label>
						</div>
						<div id="write">
							<button type="submit" id="oneVSoneWrite1" class="oneVSoneWrite1" onclick="location.href='${path}/owner/noticeList.do'">더보기</button>
					    </div>
				    </div>
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<th width="11%">번호</th>
								<th width="15%">작성자</th>
								<th width="50%">제목</th>
								<th width="24%">날짜</th>
							</tr>
						</thead>
						<tbody>
							<%-- <c:forEach var="notice" items="${noticeList }" begin="1" end="5" varStatus="vs"> --%>
							<c:forEach begin="1" end="5">
							<tr>
								<td>1</td>
								<td>admin</td>
								<td><a href="#">2018-03-21 patch.</a></td>
								<td>2018-03-21</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="col-md-6">
					<div>
						<div id="oneVsoneTitle">
							<label for="oneVSoneWrite2" class="control-label" style="font-size:30px; font-weight:bold; cursor:pointer;">문의게시판</label>
						</div>
						<div id="write">
							<button type="submit" id="oneVSoneWrite2" class="oneVSoneWrite2" onclick="location.href='${path}/owner/oneVSoneList.do'">더보기</button>
					    </div>
				    </div>
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<th width="12%">번호</th>
								<th width="15%">문의자</th>
								<th width="50%">문의 제목</th>
								<th width="23%">문의 날짜</th>
							</tr>
						</thead>
						<tbody>
							<%-- <c:forEach var="qna" items="${qnaList }" begin="1" end="5" varStatus="vs"> --%>
							<c:forEach begin="1" end="5">
							<tr>
								<td>1</td>
								<td>hwang3324</td>
								<td><a href="#">배달비 인상</a></td>
								<td>2019-01-29</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>