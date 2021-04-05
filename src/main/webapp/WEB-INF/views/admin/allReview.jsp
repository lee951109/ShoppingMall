<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>모든 유저 리뷰</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
#container_box ul li { margin-bottom:20px; border:10px solid #eee; }
.reviewInfo { background:#eee; padding:10px; font-size:18px; }
.reviewInfo span { font-size:20px; font-weight:bold; margin-right:20px; }
.reviewContent { padding:10px; }
</style>
</head>

<body>
<header id="header">
	<div id="header_box">
		<%@ include file="./include/adminHeader.jsp" %>
	</div>
</header>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top">
	<%@ include file="./include/adminNav.jsp" %>
</nav>

<!-- 바디 영역! -->
<section class="container_box">
	<ul>
		<c:forEach items="${reviewList}" var="reviewList">
			<li>
				<div class="reviewInfo">
					<p><span>작성자</span>${reviewList.member.userId} (${reivewList.userId})</p>
					<p><span>작성된 상품</span><a href="/detail?n=${reviewList.gdsNum}">바로가기</a>
				</div>
				<div class="reviewContent">
					${reviewList.reviewContent}
				</div>
			</li>
		</c:forEach>		
	</ul>
</section>



</body>
</html>