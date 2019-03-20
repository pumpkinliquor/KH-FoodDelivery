<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*, java.sql.*" 
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/ownerHeader.jsp"></jsp:include>
<style>
.soldBtn{
	color: red;
}

</style>
<section>

        <div class="container">
                <div class="row">
                    <div class="col-md-3 ">
                         <div class="list-group ">
                			  <a href="${path }/owner/menuEnroll.do?businessCode=${businessCode}" class="list-group-item list-group-item-action menu">메뉴/카테고리 등록</a>
	                          <a href="${path }/owner/menuManage.do?businessCode=${businessCode}" class="list-group-item list-group-item-action menu">메뉴관리</a>
	                          <a href="${path }/owner/menuSoldOut.do?businessCode=${businessCode}" class="list-group-item list-group-item-action active menu">품절관리</a>
	                          
                          
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
                                  <div class="col-md-12" style=overflow-y:auto;overflow-x:hidden;height:500px;>
                                  		<c:forEach items="${category}" var="c" varStatus="status">
                                            <table class="table table-hover board">
                                                <tbody>
                                                    <h5>${c.MENUCATEGORY}</h5>            
                                                    <c:forEach items="${menuList}" var="m" varStatus="status1">
                                                    <c:if test="${c.MENUCATEGORYCODE eq m.MENUCATEGORYCODE}">                     
                                                    <tr style="cursor:pointer;">
                                                        <td width="76%" >${m.MENUNAME }</td>
                                                        <c:if test="${m.MENUSOLDOUT eq 1 }">                                               
                                                        <td width="12%"><button onclick="fn_soldOut(${m.MENUCODE},this)" class="btn btn-default soldBtn">품절</button></td>
                                                        </c:if>
                                                        <c:if test="${m.MENUSOLDOUT eq 0 }">
                                                        <td width="12%"><button onclick="fn_soldOut(${m.MENUCODE},this)" class="btn btn-default">품절</button></td>                            
                                                        </c:if>
                                                        <c:if test="${m.MENUSOLDOUT eq 1 }">
                                                        <td width="12%"><button class="btn btn-default" onclick="fn_noSoldOut(${m.MENUCODE},this);">품절취소</button></td>
                                                    	</c:if>
                                                    	<c:if test="${m.MENUSOLDOUT eq 0 }">
                                                    	<td width="12%"><button class="btn btn-default soldBtn" onclick="fn_noSoldOut(${m.MENUCODE},this);">품절취소</button></td>
                                                    	</c:if>
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
			$.ajax({
				url:"${path}/menu/updateMenuSoldOut.do",
				data: {"menuCode" : menuCode},
				success : function(data)
				{
					if(data == 1)
						{
							$(e).css("color","red");
							$(e).parent().next().children().css("color","black");
						}
				}
			})
		} 
		
		function fn_noSoldOut(menuCode,e){
			console.log("솔드아웃 취소 들어왔니?");
			$.ajax({
				url:"${path}/menu/updateCancelSoldOut.do",
				data: {"menuCode" : menuCode},
				success : function(data)
				{
					console.log(data);
					if(data ==1 )
						{
							$(e).css("color","red");
							$(e).parent().prev().children().css("color","black");
						}
				}
			})
		}
	
	</script>

</section>
<jsp:include page="/WEB-INF/views/common/ownerFooter.jsp"></jsp:include>