<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>미정</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/main.css">	
<style>
	 section#content ul li {display:inline-block; margin:10px; }
	 section#content div.goodsThumb img { width:200px; height:200px; }
	 section#content div.goodsName { padding:10px 0; text-align:center; }
 	 section#content div.goodsName a { color:#000; }
</style>
</head>

<body>
<header id="header">
	<div id="header_box">
		<%@ include file="include/header.jsp" %>
	</div>
</header>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top">
	<%@ include file="include/nav.jsp" %>
</nav>


<section id="container">
	<div id="container_box">
		<section id="content">
			<ul>
				<c:forEach items="${list}" var="list">
					<li>
						<div class="goodsThumb">
							<img src="${list.gdsThumbImg}">
						</div>
						<div class="goodsName">
							<a href="/detail?n=${list.gdsNum}">${list.gdsName}</a>
						</div>
					</li>
				</c:forEach>
			</ul>
		</section>
		<aside id="aside">
			<%@ include file="include/aside.jsp" %>
		</aside>
	</div>
</section>


<footer id="footer">
	<div id="footer_box">
		<%@ include file="include/footer.jsp" %>
	</div>
</footer>
</body>
</html>