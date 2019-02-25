<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
  <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
  <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
  <!------ Include the above in your HEAD tag ---------->

  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>
</head>
<body>

  <style>
    .memberList_select {
      float: left;

    }
  </style>


  <script>
    $(document).ready(function () {
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
    <div class="row">
      <select class="memberList_select">
        <option>회원</option>
        <option>사장님</option>

      </select>

      <div class="col-md-12">

        <!-- <h4>회원 리스트</h4><br> -->

        <div class="table-responsive">


          <table id="memberListTable" class="table table-bordred table-striped">

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
          <button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete"><span
              class="glyphicon glyphicon-trash"></span></button>
          <!-- <button type="button" class="btn btn-default">삭제</button> -->

          <div class="clearfix"></div>
          <ul class="pagination">
            <li class="disabled"><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
            <li class="active"><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
          </ul>

        </div>

      </div>
    </div>
  </div>




  <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span
              class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
          <h4 class="modal-title custom_align" id="Heading">Delete this entry</h4>
        </div>
        <div class="modal-body">

          <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span> Are you sure you
            want to delete this Record?</div>

        </div>
        <div class="modal-footer ">
          <button type="button" class="btn btn-success"><span class="glyphicon glyphicon-ok-sign"></span> Yes</button>
          <button type="button" class="btn btn-default" data-dismiss="modal"><span
              class="glyphicon glyphicon-remove"></span> No</button>
        </div>
      </div>
      <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
  </div>






  <script>
    $(document).ready(function () {
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


          <table id="ownerListTable" class="table table-bordred table-striped">

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
          <button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete"><span
              class="glyphicon glyphicon-trash"></span></button>
        </div>
      </div>
    </div>
</body>

</html>