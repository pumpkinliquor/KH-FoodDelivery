<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
			<ul>
				<li style="list-style: none; float: left;">${maps.menuTitle }</li>
			</ul>
			<br>
			<ul>
				<li style="list-style: none; float: left;"><button
						class="btn btn-default" type="button">x</button>${maps.menuPrice }원</li>
				<li
					style="list-style: none; margin-right: 1em; text-align: right; padding-top: 5px;"><a
					class="btn btn-minus">-</a>${maps.menuCount }<a class="btn btn-plus">+</a></li>
			</ul>
			<hr>
