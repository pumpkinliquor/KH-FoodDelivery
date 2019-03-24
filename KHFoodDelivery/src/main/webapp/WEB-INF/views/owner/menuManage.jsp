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
	.categoryDiv1{
		margin-bottom:20px;
	}
	.nullDiv{
		text-align:center;
		font-size : 50px;
		margin-top:100px;
		color:#4D4D4D;
	}
	.btn-default{
		background-color:white;
		
	}
	.bt1{
	border-color: #4D4D4D !important;
	background-color:white !important;
	color:#4D4D4D !important;
	}
</style>
<jsp:include page="/WEB-INF/views/common/ownerHeader.jsp"></jsp:include>

<section>



	    <div class="container">
                <div class="row">
                    <div class="col-md-3 ">
                         <div class="list-group ">
                          <a href="${path }/owner/menuEnroll.do?businessCode=${businessCode}" class="list-group-item list-group-item-action menu">메뉴/카테고리 등록</a>
                          <a href="${path }/owner/menuManage.do?businessCode=${businessCode}" class="list-group-item list-group-item-action active menu">메뉴관리</a>
                          <a href="${path }/owner/menuSoldOut.do?businessCode=${businessCode}" class="list-group-item list-group-item-action menu">품절관리</a>
                          
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
                                        <form method="post" action="${path }/menu/deleteCategory.do?businessCode=${businessCode}" onsubmit="return validate();">
                                          <div class="form-group row">
                                            <div class="col-8">
                                                <select id="select" name="menuCategory" class="custom-select" required="required">
                                                    <c:forEach var="c" items="${category }">
                                                    <option value="${c.MENUCATEGORYCODE}">${c.MENUCATEGORY}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="col-4">
                                                <button name="submit" type="submit" class="btn btn-primary bt1">삭제</button>
                                            </div>
                                          </div>                                  
                                          <div class="form-group row">
                                            
                                          </div>
                                        </form>
                                    </div>
                                </div>
                                
                                  

                            </div>
                        </div>

                        <div class="card categoryDiv" style="overflow-y:auto;overflow-x:hidden;height:500px;">
                          <div class="card-body">
                              <div class="row">
                                  <div class="col-md-12">
                                      <h4>메뉴 관리</h4>
                                      <hr>
                                  </div>
                              </div>
                              <div class="row">
                                  <div class="col-md-12">
                                  			<c:if test="${ !empty category}">
                                  			<c:forEach items="${category}" var="c" varStatus="status">
                                                    
                                            <table class="table table-hover board">
                                                <tbody>
                                                    <h5>${c.MENUCATEGORY}</h5>            
                                                    <c:forEach items="${menuList}" var="m" varStatus="status1">
                                                    <c:if test="${m.MENUSTATE eq 0}">
                                                    <c:if test="${c.MENUCATEGORYCODE eq m.MENUCATEGORYCODE}">
                                                    <!-- data-toggle="modal" data-target="#myModal" -->
                                                    <tr style="cursor:pointer;" onclick="updateMenu(${m.MENUCODE},${businessCode })">
                                                        <td width="44%" >${m.MENUNAME }</td>
                                                        <td width="32%"><input type="text"  value="${m.MENUPRICE}" class="form-control here menu11" placeholder=""></td>
                                                        <td width="12%"><button onclick="updatePrice(this,${m.MENUCODE},${businessCode })" class="btn btn-default bt1">수정</button></td>
                                                        <td width="12%"><button onclick="deleteMenu(${m.MENUCODE},${businessCode });" class="btn btn-default bt1">삭제</button></td>
                                                    </tr>
                  									</c:if>
                  									</c:if>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                            </c:forEach>                                       
                                            </c:if>
                                            <c:if test="${empty category }">
                                            		<div class="nullDiv">
                                            		<p>사장님!  메뉴 / 카테고리  등록해주세요!</p>
                                            		</div>
                                            </c:if>
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
								<form action="${path }/owner/updateMenu.do" method="post">
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
											<input type="number" id="menuPrice" name="menuPrice"
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
                                            <label id="menuImage1" for="menuImage" class="custom-file-upload form-control">Upload Image</label>
                                                <input id="menuImage" class="file-upload" name="menuImage" type="file" onchange="chk_file_type(this);" accept="image/gif,image/jpeg,image/png">
                                          </div>
                                    </div>      
									<div class="form-group row">
										<div class="col-4"></div>
										<div class="col-8">
											 <input type="hidden" id="menuCode" name="menuCode">
											 <input type="hidden" id="businessCode" name="businessCode">
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
				
				function updatePrice(e,menuCode,businessCode)
				{
					var price = $(e).parent().prev().children().val();
					location.href="${path}/menu/updateMenuPrice.do?menuPrice="+price+"&menuCode="+menuCode+"&businessCode="+businessCode;
				}
				
				function deleteMenu(menuCode,businessCode)
				{
					location.href="${path}/menu/deleteMenu.do?menuCode="+menuCode+"&businessCode="+businessCode;
				}
				
				function updateMenu(menuCode,businessCode)
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
							
							$('#businessCode').val(businessCode);
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
				
				
				function chk_file_type(el) {
	
				if(!/\.(jpeg|jpg|png|gif|bmp)$/i.test(el.value)){ 
			
			        alert('이미지 파일만 업로드 가능합니다.'); 
			        $('label[id*="menuImage1"]').text('Upload Image');
			        el.value = ''; 
			        el.focus(); 
			
			    }
				else
					{
						$('label[id*="menuImage1"]').text($('#menuImage').val()); 
					}
				}

				
			</script>
</section>



<jsp:include page="/WEB-INF/views/common/ownerFooter.jsp"></jsp:include>