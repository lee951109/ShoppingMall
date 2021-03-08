<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>무기 목록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
#container_box table{
	width:900px;
	margin-left:auto;
	margin-right:auto;
}
#container_box table th{
	font-size:20px;
	font-weight:bold;
	text-align:center;
	padding:10px;
	border-bottom:2px solid #666;
}
#container_box table tr:hover{background:#eee;}
#container_box table td{padding:10px; text-align:center;}
#container_box table img{width:150px; height:auto;}
.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0;
}

</style>
</head>

<body>
<div class="container-fluid">
  <br>
  <h3>상품 목록</h3>
 
</div>

<header id="header">
	<div id="header_box">
		<%@ include file="../include/adminHeader.jsp" %>
	</div>
</header>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top">
	<%@ include file="../include/adminNav.jsp" %>
</nav>

<!-- 바디 영역! -->

	<div id="container_box">
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>상품이미지</th>
					<th>상품명</th>
					<th>카테고리</th>
					<th>가격</th>
					<th>수량</th>
					<th>등록날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="list">
					<tr>
						<td>${list.gdsNum}</td>
						<td><img src="${list.gdsThumbImg}"></td>
						<td>
							<a href="/admin/goods/detail?n=${list.gdsNum}">${list.gdsName}</a>
						</td>
						<td>${list.categoryVO.cateName}</td>
						<td>
							<fmt:formatNumber value="${list.gdsPrice}" pattern="###,###,###"/>원
						</td>
						<td>${list.gdsStock}개</td>
						<td>
							<fmt:formatDate value="${list.gdsDate}" pattern="yyyy-mm-dd" />
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>




  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>