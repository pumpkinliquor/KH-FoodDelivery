<%@ page language="java" contentType="text/html; charset=UTF-8"
   import="java.util.*, java.sql.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"></jsp:include>
</head>
<style>
#noticeTitleTd{
   width:800px;
}
#topTable {
   background-color: #4D4D4D;
   color: rgba(255, 255, 255, .5);
}

#noticeListCount {
   float: left;
}

#noticeListCount2 {
   color: red;
   float: left;
}
.pnt{
   cursor:pointer;
}
</style>
<script>
function fn_noticeView(){
   location.href="${path }/admin/noticeView.do";
}
</script>
<body>



   <div class="container">
      <div>
         <h4>공지사항</h4>
      </div>

      <table class="table table-hover notice">

         <thead id="noticeThead">
            <tr id="topTable">
               <th>번호</th>
               <th>제목</th>
               <th>날짜</th>

            </tr>
         </thead>
          <c:forEach items="${list }"  var="mn" >
         <tbody>
            <tr class="pnt" onclick="fn_noticeView()">
               <td >${mn.NOTICENUM }</td>
               <td id="noticeTitleTd">${mn.NOTICETITLE}</td>
               <td>${mn.WRITEDATE}</td>

            </tr>

         </tbody>
         </c:forEach>
      </table>



      <button type="button" class="btn btn-light float-right"
         onclick="location.href='${path}/admin/noticeForm.do'">글쓰기</button>


   </div>


   <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>