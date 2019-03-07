<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*, java.sql.*" 
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<style>
	.menu11{
		text-align:right;
		
	}
	

	
</style>
<jsp:include page="/WEB-INF/views/common/ownerHeader.jsp"></jsp:include>

<section>



	    <div class="container">
                <div class="row">
                    <div class="col-md-3 ">
                         <div class="list-group ">
                          <a id="enrollMenu" class="list-group-item list-group-item-action active">메뉴/카테고리 등록</a>
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
                        <div class="card categoryDiv1">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <h5>카테고리 삭제</h5>
                                        <hr>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <form method="post" action="${path }/menu/deleteCategory.do">
                                          <div class="form-group row">
                                            <div class="col-8">
                                                <select id="select" name="menuCategory" class="custom-select">
                                                    <c:forEach var="c" items="${category }">
                                                    <option value="${c.MENUCATEGORYCODE}">${c.MENUCATEGORY}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="col-4">
                                                <button name="submit" type="submit" class="btn btn-primary">삭제</button>
                                            </div>
                                          </div>                                  
                                          <div class="form-group row">
                                            
                                          </div>
                                        </form>
                                    </div>
                                </div>
                                
                                  

                            </div>
                        </div>

                        <div class="card categoryDiv" scroll=auto style="overflow-x:hidden">
                          <div class="card-body">
                              <div class="row">
                                  <div class="col-md-12">
                                      <h4>메뉴 관리</h4>
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
                                                        <td width="44%" >${m.MENUNAME }</td>
                                                        <td width="32%"><input type="text"  value="${m.MENUPRICE}" class="menu11" placeholder=""></td>
                                                        <td width="12%"><button onclick="updatePrice(${m.MENUPRICE})" class="btn btn-default remove">수정</button></td>
                                                        <td width="12%"><button class="btn btn-default">삭제</button></td>
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
				
				function updatePrice(price)
				{
					location.href="${path}/menu/updateMenuPrice?menuPrice="+price;
				}
			</script>
</section>



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>