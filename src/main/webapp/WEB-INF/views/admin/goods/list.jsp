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
</style>
</head>

<body>
<div class="container-fluid">
  <br>
  <h3>상품 목록</h3>
 
</div>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top">
  <a class="navbar-brand" href="#">Logo</a>
  <ul class="navbar-nav">
  <!-- Dropdown -->
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        무기(Weapon)
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="#">돌격소총(AR)</a>
        <a class="dropdown-item" href="#">기관단총(SMG)</a>
        <a class="dropdown-item" href="#">산탄총(SG)</a>
        <a class="dropdown-item" href="#">소총(DMR)</a>
        <a class="dropdown-item" href="#">저격총(SR)</a>
      </div>
    </li>
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        탄(Bullet)
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="#">5.56mm</a>
        <a class="dropdown-item" href="#">7.62mm</a>
        <a class="dropdown-item" href="#">9mm</a>
      </div>
    </li>
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        방탄구(Armor)
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="#">방탄헬멧(Helmet)</a>
        <a class="dropdown-item" href="#">방탄조끼(Jacket)</a>
        <a class="dropdown-item" href="#">전술가방(Backpack)</a>
      </div>
    </li>
     <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        Admin
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="/admin/goods/register">무기 등록</a>
        <a class="dropdown-item" href="/admin/goods/list">무기 목록</a>
        <a class="dropdown-item" href="#">상품 소감</a>
        <a class="dropdown-item" href="#">유저 목록</a>
      </div>
    </li>
  </ul>
  <ul class="nav navbar-nav ml-auto">
   <form class="form-inline my-2 my-lg-0" action="#">
    <input class="form-control mr-sm-2" type="text" placeholder="Search">
    <button class="btn btn-success" type="submit">검색</button>
  </form>
  </ul>
  <ul class="nav navbar-nav ml-auto">
    <c:if test="${member != null}">
    <li class="nav-item">
    	<a class="nav-link" href="/member/logout">로그아웃</a>
    </li>
    <br/>
    <li class="nav-item">
    <p class="nav-link" style="color: white;">${member.userName}님 환영합니다.<p>
    </c:if>
  </ul>
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
						<td>${list.cateName}</td>
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