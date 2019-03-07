<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*, java.sql.*" 
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<style>
     section .section-title {
    text-align: center;
    color: #007b5e;
    margin-bottom: 50px;
    text-transform: uppercase;
}

a {
  -webkit-transition: all 0.5s;
  -moz-transition: all 0.5s;
  transition: all 0.5s;
  font-family: 'Open Sans', sans-serif;
  color: #000;
}
a:hover {
  -webkit-transition: all 0.5s;
  -moz-transition: all 0.5s;
  transition: all 0.5s;
  color: #000;
  text-decoration: none;
}

h1,h2,h3,h4,h5{
       font-family: 'Open Sans', sans-serif;
}
p, ul,li{
    font-family: 'Open Sans', sans-serif;
    font-size: 14px;
    line-height: 25px;
}
.form-inline .form-control.custom-file-upload {
  border: 1px solid #ccc;
  
  padding: 6px 12px;
  cursor: pointer;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  width: 100%;
}

.wrap-input-container {
  display: inline-block;
  position: relative;
  overflow: hidden;
}
.wrap-input-container input {
position: absolute;
font-size: 400px;
opacity: 0;
z-index: 1;
top: 0;
left: 0;
}

.categoryDiv{
  margin-top: 20px;
  height:200px;
}

</style>

<jsp:include page="/WEB-INF/views/common/ownerHeader.jsp"></jsp:include>
<script>

$(function(){
	$(".menu").click(function(){
		console.log("클릭에들어왔니?");
		var menu = $(".menu").val();
		$.ajax({
			url:"${path}/owner/menuEnroll.do",
			data:{"menu":menu},
			success:function(data)
			{
				
			}
			
		});
	});
});

</script>
<section>
	<div class="container">
                <div class="row">
                    <div class="col-md-3 ">
                         <div class="list-group ">
                          <a href="${path }/owner/menuEnroll.do" class="list-group-item list-group-item-action active menu">메뉴/카테고리 등록</a>
                          <a href="${path }/owner/menuManage.do" class="list-group-item list-group-item-action menu">메뉴관리</a>
                          <a href="${path }/owner/menuSoldOut.do" class="list-group-item list-group-item-action menu">품절관리</a>
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
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <h4>메뉴 등록</h4>
                                        <hr>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <form action="${path }/owner/enrollMenu.do">
                                          <div class="form-group row">
                                            <label for="username" class="col-4 col-form-label">메뉴명</label> 
                                            <div class="col-8">
                                              <input id="menuName" name="menuName" placeholder="" class="form-control here" required="required" type="text">
                                            </div>
                                          </div>                                  
                                          <div class="form-group row">
                                            <label for="select" class="col-4 col-form-label">메뉴카테고리</label> 
                                            <div class="col-8">
                                              <select id="select" name="menuCategoryCode" class="custom-select">
                                              	<c:forEach var="c" items="${category }">
                                                <option value="${c.MENUCATEGORYCODE }">${c.MENUCATEGORY }</option>
                                                </c:forEach>
                                              
                                              </select>
                                            </div>
                                          </div>
                                          <div class="form-group row">
                                            <label for="website" class="col-4 col-form-label">가격</label> 
                                            <div class="col-8">
                                              <input id="menuPrice" name="menuPrice" placeholder="" class="form-control here" type="text">
                                            </div>
                                          </div>
                                          <div class="form-group row">
                                            <label for="publicinfo" class="col-4 col-form-label">메뉴설명</label> 
                                            <div class="col-8">
                                              <textarea id="menuContent" name="menuContent" cols="40" rows="4" class="form-control"></textarea>
                                            </div>
                                          </div>
                                          <div class="form-group row">
                                            <label for="newpass" class="col-4 col-form-label">메뉴사진</label> 
                                              <div class="col-sm-8 wrap-input-container">
                                                <label class="custom-file-upload form-control">
                                                  <i class="fa fa-cloud-upload"></i> Upload Document
                                                </label>
                                                <input class="file-upload" name="menuImage" type="file">
                                              </div>
                                          </div> 
                                          <div class="form-group row">
                                            <div class="offset-4 col-8">
                                              <button name="submit" type="submit" class="btn btn-primary">등록</button>
                                            </div>
                                          </div>
                                        </form>
                                    </div>
                                </div>
                                
                                  

                            </div>
                        </div>

                        <div class="card categoryDiv">
                          <div class="card-body">
                              <div class="row">
                                  <div class="col-md-12">
                                      <h4>카테고리 등록</h4>
                                      <hr>
                                  </div>
                              </div>
                              <div class="row">
                                  <div class="col-md-12">
                                      <form action="${path }/owner/enrollCategory.do" method="post">
                                        <div class="form-group row">
                                          <label for="menuCategory" class="col-4 col-form-label">카테고리명</label> 
                                          <div class="col-8">
                                            <input id="menuCategory" name="menuCategory" placeholder="" class="form-control here" required="required" type="text">
                                          </div>
                                        </div>                                  
                                        <div class="form-group row">
                                          <div class="offset-4 col-8">
                                            <button name="submit" type="submit" class="btn btn-primary">등록</button>
                                          </div>
                                        </div>
                                      </form>
                                  </div>
                              </div>
                              
                                

                          </div>
                      </div>
                    </div>
                </div>
            </div>




</section>





<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>