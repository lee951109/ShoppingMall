<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0;
}

</style>
</head>

<body>
<header id="header">
	<div id="header_box">
		<%@ include file="include/adminHeader.jsp" %>
	</div>
</header>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top">
	<%@ include file="include/adminNav.jsp" %>
</nav>


<!-- 바디 영역! -->
<div class="container-fluid">

본문 영역
</div>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>