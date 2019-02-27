<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*, java.sql.*" 
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"></jsp:include>
<!-- 제이쿼리 -->
<!-- <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script> -->
<!------ Include the above in your HEAD tag ---------->

</head>

<style>
.memberList_select {
	float: left;
}

.memberListDelBtn{
	width:20px;
	height:20px;
}
</style>
<body>


 
	<script>
    $(document).ready(function(){
$("#memberListTable #checkall").click(function () {
        if ($("#memberListTable #checkall").is(':checked')) {
            $("#memberListTable input[type=checkbox]").each(function () {
                $(this).prop("checked", true);
            });

        } else {
            $("#memberListTable input[type=checkbox]").each(function () {
                $(this).prop("checked", false);
            });
        }
    });
    
    $("[data-toggle=tooltip]").tooltip();
});

    </script>
	<div class="container">
		<div class="top">
			<div class="row">
				<div class="col-md-12">
					<select class="memberList_select">
						<option>회원</option>
						<option>사장님</option>

					</select>
				</div>
			</div>
		</div>
			<div class="row">
				<div class="col-md-12">




					<table id="memberListTable"
						class="table table-bordred table-striped">

						<thead>
							<tr>
								<th><input type="checkbox" id="checkall" /></th>
								<th>회원 번호</th>
								<th>아이디</th>
								<th>이름</th>
								<th>이메일</th>
								<th>가입날짜</th>
							</tr>
						</thead>
						<tbody>

							<tr>
								<td><input type="checkbox" class="checkthis" /></td>
								<td>5</td>
								<td>wjdqls9357</td>
								<td>최정빈</td>
								<td>wjdqls7773@gmail.com</td>
								<td>2019.02.23</td>
							</tr>

							<tr>
								<td><input type="checkbox" class="checkthis" /></td>
								<td>5</td>
								<td>wjdqls9357</td>
								<td>최정빈</td>
								<td>wjdqls7773@gmail.com</td>
								<td>2019.02.23</td>

							</tr>

							<tr>
								<td><input type="checkbox" class="checkthis" /></td>
								<td>5</td>
								<td>wjdqls9357</td>
								<td>최정빈</td>
								<td>wjdqls7773@gmail.com</td>
								<td>2019.02.23</td>
							</tr>

							<tr>
								<td><input type="checkbox" class="checkthis" /></td>
								<td>5</td>
								<td>wjdqls9357</td>
								<td>최정빈</td>
								<td>wjdqls7773@gmail.com</td>
								<td>2019.02.23</td>
							</tr>

							<tr>
								<td><input type="checkbox" class="checkthis" /></td>
								<td>5</td>
								<td>wjdqls9357</td>
								<td>최정빈</td>
								<td>wjdqls7773@gmail.com</td>
								<td>2019.02.23</td>
							</tr>
						</tbody>

					</table>
					<button><img src="${path}/resources/images/admin/deleteBtn.png" class="memberListDelBtn"></button>
				</div>
			</div>


		<!-- <div class="col-md-6">
			<button class="btn btn-danger btn" data-title="Delete"
				data-toggle="modal" data-target="#delete">
				<span class="glyphicon glyphicon-trash"></span>
			</button>
			<button type="button" class="btn btn-default">삭제</button>

		</div>
 -->
	</div>




	<!-- <div class="modal fade" id="delete" tabindex="-1" role="dialog"
		aria-labelledby="edit" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					</button>
					<h4 class="modal-title custom_align" id="Heading">Delete this
						entry</h4>
				</div>
				<div class="modal-body">

					<div class="alert alert-danger">
						<span class="glyphicon glyphicon-warning-sign"></span> Are you
						sure you want to delete this Record?
					</div>

				</div>
				<div class="modal-footer ">
					<button type="button" class="btn btn-success">
						<span class="glyphicon glyphicon-ok-sign"></span> Yes
					</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove"></span> No
					</button>
				</div>
			</div>
			/.modal-content
		</div>
		/.modal-dialog
	</div> -->




<!-- 사장님 리스트
지우지말것

	<script>
$(document).ready(function(){
$("#ownerListTable #checkall2").click(function () {
        if ($("#ownerListTable #checkall2").is(':checked')) {
            $("#ownerListTable input[type=checkbox]").each(function () {
                $(this).prop("checked", true);
            });

        } else {
            $("#ownerListTable input[type=checkbox]").each(function () {
                $(this).prop("checked", false);
            });
        }
    });
    
    $("[data-toggle=tooltip]").tooltip();
});
</script>
	<div class="container">
		<div class="row">


			<div class="col-md-12">
				<h4>사장님 리스트</h4>
				<div class="table-responsive">


					<table id="ownerListTable"
						class="table table-bordred table-striped">

						<thead>
							<tr>
								<th><input type="checkbox" id="checkall2" /></th>
								<th>사장님 번호</th>
								<th>아이디</th>
								<th>사업주명</th>
								<th>음식카테고리</th>
								<th>가입날짜</th>
							</tr>
						</thead>
						<tbody>

							<tr>
								<td><input type="checkbox" class="checkthis" /></td>
								<td>1</td>
								<td>wjdqlsowner</td>
								<td>최사장</td>
								<td>wjdqls@gmail.com</td>
								<td>010-4545-4545</td>
							</tr>

							<tr>
								<td><input type="checkbox" class="checkthis" /></td>
								<td>1</td>
								<td>wjdqlsowner</td>
								<td>최사장</td>
								<td>wjdqls@gmail.com</td>
								<td>010-4545-4545</td>
							</tr>

							<tr>
								<td><input type="checkbox" class="checkthis" /></td>
								<td>1</td>
								<td>wjdqlsowner</td>
								<td>최사장</td>
								<td>wjdqls@gmail.com</td>
								<td>010-4545-4545</td>
							</tr>

							<tr>
								<td><input type="checkbox" class="checkthis" /></td>
								<td>1</td>
								<td>wjdqlsowner</td>
								<td>최사장</td>
								<td>wjdqls@gmail.com</td>
								<td>010-4545-4545</td>
							</tr>

						</tbody>

					</table>
					<button class="btn btn-danger btn-xs" data-title="Delete"
						data-toggle="modal" data-target="#delete">
						<span class="glyphicon glyphicon-trash"></span>
					</button>
				</div>
			</div>
		</div>
	</div> -->
</body>

</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>