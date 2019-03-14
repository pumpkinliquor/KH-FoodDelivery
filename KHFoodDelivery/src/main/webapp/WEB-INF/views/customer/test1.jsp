<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<script>
	$(function() {
		$("dd:not(:first)").css("display", "none"); //first dd 빼고 나머지 dd를 none으로 해라

		$("dl dt").click(function() {
			if ($("+dd", this).css("display") == "none") {
				$(this).siblings("dd").slideUp("slow");
				$("+dd", this).slideDown("slow");
			}
		});
	});
</script>
<div id="menubox">
	<dl>
		<dt>인기메뉴</dt>
		<dd>
			<c:forEach begin="0" end="5" step="1">
			<div class="row">
				<div class="col-sm-9">
					<div class="mnl">
						<p>
							감자전<br /> <a>12,000원</a>
						</p>
					</div>
				</div>
				<div class="col-sm-3">
					<img class="mnlogo" src="8.jpg"><br />
				</div>
			</div>
			<hr>
			</c:forEach>
		</dd>
		<c:forEach var="category" items="${categoryList}">
		<dt><a href="${path}/customer/test1.do?menuCategoryCode=${category.MENUCATEGORYCODE}" style="color:black;">${category.MENUCATEGORY }</a></dt>
		<c:forEach var="menu" items="${menuList }">
		<dd>
			<div class="row">
				<div class="col-sm-9">
					<div class="mnl">
						<p>
							${menu.MENUNAME }<br /> <a>${menu.MENUPRICE }</a>
						</p>
					</div>
				</div>
				<div class="col-sm-3">
					<img class="mnlogo" src="8.jpg"><br />
				</div>
			</div>
			<hr>
		</dd>
		</c:forEach>
		</c:forEach>
	</dl>
</div>



