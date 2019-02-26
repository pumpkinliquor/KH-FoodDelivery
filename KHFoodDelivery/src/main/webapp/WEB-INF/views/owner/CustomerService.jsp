<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*, java.sql.*" 
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<head>
<!-- 부트스트랩 -->
<link	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<!-- 사용자작성 css -->
<link rel="stylesheet" href="${path}/resources/css/style.css" />
<meta charset="UTF-8">
<title>고객센터</title>
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
    	width:29em;
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
	   	<button onclick="location.href='${path }/'">홈</button>
	   		<div class="row">
	   			<div class="col-md-12">
	   				<button class="oneVSoneBtn" id="oneVSoneBtn" onclick="">1:1문의</button>
	   				<button class="questBtn" id="questBtn" onclick="">나의 문의내역</button>
	   			</div>
	   		</div>
	   	</div>
	   	
	   	<div class="search">
	   		<div class="table-responsive">
		   		<div class="row">
		   			<div class="col-md-12" style="padding-left:5px;">
		   				<form class="form-inline">
		   				<div class="form-group" style="padding-left: 0px;">
						<input type="search" style="margin-right: 5px;" class="form-control" id="keyword" name="keyword" placeholder="제목이나 내용을 입력하세요." value="${param.keyword!=null?param.keyword:''}"/>
						<input type="submit" class="btn btn-primary" id="keywordBtn" value="검색"/>
						</div>
						</form>
						<label for="keyword"><small id="emailHelp" style="float:left;" class="form-text text-muted">Please enter a title or content.</small></label>
		   			</div>
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
						<button type="submit" id="oneVSoneWrite1" class="oneVSoneWrite1" onclick="">더보기</button>
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
						<tr>
							<td>1</td>
							<td>admin</td>
							<td><a href="#">2018-03-21 patch.</a></td>
							<td>2018-03-21</td>
						</tr>
						<tr>
							<td>2</td>
							<td>admin</td>
							<td><a href="#">금일 새로운 업데이트</a></td>
							<td>2018-04-23</td>
						</tr>
						<tr>
							<td>3</td>
							<td>admin</td>
							<td><a href="#">이번 KHFoodDelivery 패치입니다.</a></td>
							<td>2018-06-30</td>
						</tr>
						<tr>
							<td>4</td>
							<td>admin</td>
							<td><a href="#">추가 된 메뉴들입니다.</a></td>
							<td>2018-12-02</td>
						</tr>
						<tr>
							<td>5</td>
							<td>admin</td>
							<td><a href="#">사장님들 필독 부탁드립니다.</a></td>
							<td>2019-01-15</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-md-6">
				<div>
					<div id="oneVsoneTitle">
						<label for="oneVSoneWrite2" class="control-label" style="font-size:30px; font-weight:bold; cursor:pointer;">1:1문의내역</label>
					</div>
					<div id="write">
						<button type="submit" id="oneVSoneWrite2" class="oneVSoneWrite2" onclick="">더보기</button>
				    </div>
			    </div>
				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<th width="11%">번호</th>
							<th width="15%">문의자</th>
							<th width="50%">문의 제목</th>
							<th width="24%">문의 날짜</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>hwang3324</td>
							<td><a href="#">배달비 인상</a></td>
							<td>2019-01-29</td>
						</tr>
						<tr>
							<td>2</td>
							<td>leedayun0202</td>
							<td><a href="#">위치 이동 할 수 있을까요?</a></td>
							<td>2019-02-01</td>
						</tr>
						<tr>
							<td>3</td>
							<td>wlzh0108</td>
							<td><a href="#">저희 메뉴 수정부탁드립니다.</a></td>
							<td>2019-02-12</td>
						</tr>
						<tr>
							<td>4</td>
							<td>duaqhtjd123</td>
							<td><a href="#">리뷰 관리는 어디서 하나요?</a></td>
							<td>2019-02-15</td>
						</tr>
						<tr>
							<td>5</td>
							<td>hyuna0523</td>
							<td><a href="#">너무심하네..</a></td>
							<td>2019-02-23</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		</div>
	</div>
</body>
</html>