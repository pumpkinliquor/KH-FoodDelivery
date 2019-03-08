<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*, java.sql.*" 
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/ownerHeader.jsp"></jsp:include>
<section>

        <div class="container">
                <div class="row">
                    <div class="col-md-3 ">
                         <div class="list-group ">
                <a href="${path }/owner/menuEnroll.do" class="list-group-item list-group-item-action active">메뉴/카테고리 등록</a>
                          <a href="${path }/owner/menuManage.do" class="list-group-item list-group-item-action">메뉴관리</a>
                          <a href="${path }/owner/menuSoldOut.do" class="list-group-item list-group-item-action">품절관리</a>
                          <a href="#" class="list-group-item list-group-item-action">Enquiry</a>
                          <a href="#" class="list-group-item list-group-item-action">Dealer</a>
                          <a href="#" class="list-group-item list-group-item-action">Media</a>
                          <a href="#" class="list-group-item list-group-item-action">Post</a>
                          <a href="#" class="list-group-item list-group-item-action">Category</a>
                          <a href="#" class="list-group-item list-group-item-action">New</a>
                          <a href="#" class="list-group-item list-group-item-action">Comments</a>
                          <a href="#" class="list-group-item list-group-item-action">Appearance</a>
                          <a href="#" class="list-group-item list-group-item-action">Reports</a>
                          <a href="#" class="list-group-item list-group-item-action">Settings</a>
                          
                          
                        </div> 
                    </div>
                    <div class="col-md-9">                   
                        <div class="card categoryDiv" scroll=auto style="overflow-x:hidden">
                          <div class="card-body">
                              <div class="row">
                                  <div class="col-md-12">
                                      <h4>품절 관리</h4>
                                      <hr>
                                  </div>
                              </div>
                              <div class="row">
                                  <div class="col-md-12">
                                  		<c:forEach items="${category}" var="c" varStatus="status">
                                            <table class="table table-hover board">
                                                <tbody>
                                                    <h5>${c.MENUCATEGORY}</h5>            
                                                    <c:forEach items="${menuList}" var="m" varStatus="status1">
                                                    <c:if test="${c.MENUCATEGORYCODE eq m.MENUCATEGORYCODE}">                     
                                                    <tr style="cursor:pointer;">
                                                        <td width="76%" >${m.MENUNAME }</td>                                               
                                                        <td width="12%"><button onclick="fn_soldOut(${m.MENUCODE},this)" class="btn btn-default">품절</button></td>
                                                        <td width="12%"><button class="btn btn-default">품절취소</button></td>
                                                    </tr>
                  									</c:if>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                         </c:forEach> 
                                            
                                  </div>
                              </div>
                              
                                

                          </div>
                      </div>
                    </div>
                </div>
            </div>
	
	<script>
		function fn_soldOut(menuCode,e){
			console.log(e);
			console.log("솔드아웃 들어왔니?");
			$.ajax({
				url:"${path}/menu/updateMenuSoldOut.do",
				data: {"menuCode" : menuCode},
				success : function(data)
				{
					console.log(data);
					if(data == 1)
						{
							$(e).css("color","red");				
						}
				}
			})
		} 
	
	</script>

</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>