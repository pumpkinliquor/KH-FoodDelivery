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
	#menuImage{
		display:none;
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
                                                    <!-- data-toggle="modal" data-target="#myModal" -->
                                                    <tr style="cursor:pointer;" onclick="updateMenu(${m.MENUCODE})">
                                                        <td width="44%" >${m.MENUNAME }</td>
                                                        <td width="32%"><input type="text"  value="${m.MENUPRICE}" class="menu11" placeholder=""></td>
                                                        <td width="12%"><button onclick="updatePrice(this,${m.MENUCODE})" class="btn btn-default remove">수정</button></td>
                                                        <td width="12%"><button onclick="deleteMenu(${m.MENUCODE});" class="btn btn-default">삭제</button></td>
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


	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					
				</div>
				<div class="modal-body">

					<div class="card-body">
						<div class="row">
							<div class="col-md-12">
								<h4>메뉴 수정</h4>
								<hr>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<form action="${path }/owner/updateMenu.do" method="post"
									onsubmit="return fn_enroll_validate();">
									<div class="form-group row">
										<label for="username" class="col-4 col-form-label">메뉴이름</label>
										<div class="col-8">
											<input type="text" id="menuName" name="menuName"
												placeholder="아이디" class="form-control here"
												required="required"> <input type="hidden"
												name="checkId" value="0" />
										</div>
									</div>
									<div class="form-group row">
										<label for="name" class="col-4 col-form-label">메뉴가격</label>
										<div class="col-8">
											<input type="text" id="menuPrice" name="menuPrice"
												placeholder="" class="form-control here">
										</div>
									</div>
									<div class="form-group row">
										<label for="lastname" class="col-4 col-form-label">메뉴설명</label>
										<div class="col-8">
											<textarea id="menuContent" name="menuContent" cols="40" rows="4" class="form-control"></textarea>
										</div>
									</div>
									<div class="form-group row">
                                        <label for="newpass" class="col-4 col-form-label">메뉴사진</label> 
                                          <div class="col-sm-8 wrap-input-container">
                                            <label id="menuImage1" for="menuImage" class="custom-file-upload form-control">Upload Document</label>
                                                <input id="menuImage" class="file-upload" name="menuImage" type="file">
                                          </div>
                                    </div>      
									<div class="form-group row">
										<div class="col-4"></div>
										<div class="col-8">
											 <input type="hidden" id="menuCode" name="menuCode">
											<button id="ownerJoinBtn" name="submit" type="submit"
												class="btn btn-primary">수정</button>
										</div>
									</div>
								</form>
							</div>
						</div>

					</div>




				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

	<script>
				
				function updatePrice(e,menuCode)
				{
					var price = $(e).parent().prev().children().val();
					location.href="${path}/menu/updateMenuPrice.do?menuPrice="+price+"&menuCode="+menuCode;
				}
				
				function deleteMenu(menuCode)
				{
					location.href="${path}/menu/deleteMenu.do?menuCode="+menuCode;
				}
				
				function updateMenu(menuCode)
				{
					console.log("업데이트메뉴 들어왔니?");
					
		 			$.ajax({
						url: "${path}/owner/selectOneMenu.do",
						dataType: "json",
						data : {
							"menuCode" : menuCode
						},
						success : function(data){
							
							console.log("뭐냐"+data.MENUNAME);
							console.log(data);
							
							$('#menuCode').val(data.MENUCODE);
							$('#menuName').val(data.MENUNAME);
							$('#menuPrice').val(data.MENUPRICE);
							$('#menuIMAGE').val(data.MENUIMAGE);
							$('#menuContent').val(data.MENUCONTENT);
							$('label[id*="menuImage1"]').text(data.MENUIMAGE); 
							$('#myModal').modal();
							
						}
						
					}); 
					
				}
				
				$('#menuImage').change(function(){
					/* console.log($('#menuImage').val())
					console.log("파일 선택 들어왔니?"); */
					$('label[id*="menuImage1"]').text($('#menuImage').val()); 
				})
			</script>
</section>



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>