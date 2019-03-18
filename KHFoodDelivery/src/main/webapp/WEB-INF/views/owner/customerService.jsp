<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*, java.sql.*" 
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/ownerHeader.jsp"></jsp:include>
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
    	width:17em;
    	text-align:center;
    }
    #oneVSoneBtn{
    	margin-bottom:10px;
    	width:17em;
    	text-align:center;
    }
    #emailHelp{
    	padding-left:12px;
    } 
    .middle{
    	padding-top:15%;
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
<section>
	<div class="container">
	   	<div class="top">
	   		<div class="row">
	   			<div class="col-md-12">
	   				<button class="oneVSoneBtn" id="oneVSoneBtn" onclick="location.href='${path}/owner/oneVSoneForm.do'">1:1문의</button>
	   				<button class="questBtn" id="questBtn" onclick="location.href='${path}/owner/myOneVSone.do'">나의 문의내역</button>
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
							<button type="submit" id="oneVSoneWrite1" class="oneVSoneWrite1" onclick="location.href='${path}/owner/ownerNoticeListOwnerView.do'">더보기</button>
					    </div>
				    </div>
					<table class="table table-bordered">
						<thead style="cursor:pointer;" onclick="location.href='${path}owner/ownerNoticeListOwnerView.do'">
							<tr>
								<th width="11%">번호</th>
								<th width="65%">제목</th>
								<th width="24%">날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="notice" items="${selectNoticeList }" begin="0" end="4" step="1" varStatus="vs">
							<tr style="cursor:pointer;" onclick="location.href='${path}/owner/ownerNoticeListOwnerView.do'">
								<td>${vs.count }</td>
								<td><a href="#">${notice.OWNERNOTICETITLE }</a></td>
								<td>${notice.OWNERWRITEDATE }</td>
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
					<table class="table table-bordered">
						<thead style="cursor:pointer;" onclick="location.href='${path}/owner/oneVSoneList.do'">
							<tr>
								<th width="12%">번호</th>
								<th width="15%">문의자</th>
								<th width="50%">문의 제목</th>
								<th width="23%">문의 날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="qna" items="${selectQnaList }" begin="0" end="4" step="1" varStatus="vs">
							<tr style="cursor:pointer;" onclick="location.href='${path}/owner/oneVSoneList.do'">
								<td>${vs.count }</td>
								<td>${qna.OWNERID }</td>
								<td><a href="${path}/owner/oneVSoneView.do?qnaCode=${qna.QNACODE}">${qna.QNATITLE }</a></td>
								<td>${qna.WRITEDATE }</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/ownerFooter.jsp"></jsp:include>