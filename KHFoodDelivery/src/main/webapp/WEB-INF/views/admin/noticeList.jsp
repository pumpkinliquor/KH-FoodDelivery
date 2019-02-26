<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<head>
<!-- 부트스트랩관련 라이브러리 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    
<style>
    #topTable {
        background-color: rgba(253, 190, 138, 0.945);
        color: white;
    }
</style>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-12">

                <h3 id="h3board">공지사항</h3>
                <h5 id="h5_board">
                    <a href="">메인화면></a> <a href="#">공지사항</a>
                </h5>
                <hr>


            </div>

         </div>

          <form action="${pageContext.request.contextPath}/notice/noticeList.do" method="post">
            <h3 style="float:left">글 수</h3> &nbsp;&nbsp; <h3 style="color:red; float: left;">2</h3>
            <table class="table table-hover board">

                <thead id="noticeThead">
                    <tr id="topTable">
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>날짜</th>
                        <th>조회수</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>공지</td>
                        <td><a href="#">첫공지사항!</a></td>
                        <td>관리자</td>
                        <td>19.02.23</td>
                        <td>12345</td>
                    </tr>

                    <tr>
                        <td>공지</td>
                        <td>첫공지사항!</td>
                        <td>관리자</td>
                        <td>19.02.23</td>
                        <td>12345</td>
                    </tr>


                </tbody>
            </table>
            <br>
            </form>
            <div>
                <a href="#" class="btn btn-default pull-right">글쓰기</a>

                  
            </div>
            <div class="text-center">
                <button type="button" class="btn btn-default" name="board_prev">
                    <span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span>
                </button>
              
                    <button type="button" class="btn btn-default" aria-label="Left Align" name="board_next">
                        <span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span>
                    </button>
                
            </div>
    </div>

</body>
</html>