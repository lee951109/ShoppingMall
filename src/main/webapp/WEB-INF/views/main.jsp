<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/main.css">	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>

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
			본문 영역
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

  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>