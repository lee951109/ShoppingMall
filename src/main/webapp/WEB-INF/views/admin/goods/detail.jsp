<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
footer {
  height: 100px;
  margin-top: -100px;
  background-color: gray;
 }
 .oriImg{
 	width: 500px;
 	height:auto;
 }

</style>
</head>

<body>
<div class="container-fluid">
  <br>
  <h3>상품 등록 페이지</h3>
 
</div>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top">
  <a class="navbar-brand" href="#">Logo</a>
  <ul class="navbar-nav">
  <!-- Dropdown -->
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="search" id="navbardrop" data-toggle="dropdown">
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
        <a class="dropdown-item" href="#">무기 목록</a>
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
<div class="container">
	<div class="row">
		<div class="col-lg-9">
	   		<br>
	   			<div id="carouselExampleIndicators">				
					<form method="post" role="form" autocomplete="off">
						<table class="table" style="border:1px solid #dddddd">
							<tr>
								<th colspan=3 style="background-color:#d3d3d3; text-align:center;">상품 등록
									<input type="hidden" name="n" value="${goods.gdsNum}"/>	
								</th>
							</tr>
							<colgroup>
								<col width="15%">
								<col width="35%">
								<col width="15%">
								<col width="*">
							</colgroup>
							<tr>
								<th>카테고리</th>
								<td style="text-align:left;" colspan=2>
									<span class="cateCode">${goods.cateName}</span>
								</td>
							</tr>
							<tbody id="twrite">
								<tr>
									<th>제품명</th>
									<td colspan=2><span>${goods.gdsName}</span></td>
								</tr>
								<tr>
									<th>이미지</th>
									<td colspan=2><img src="${goods.gdsImg}" class="oriImg"/></td>
								</tr>
								<tr>
									<th>썸네일</th>
									<td colspan=2><img src="${goods.gdsThumbImg}" class="thumbImg" /></td>
								</tr>
								<tr>
									<th>가격</th>
									<td colspan=2><span><fmt:formatNumber value="${goods.gdsPrice}" pattern="###,###,###"/>원</span></td>
								</tr>
								<tr>
									<th>상품 수량</th>
									<td colspan=2><span>${goods.gdsStock}개</span></td>
								</tr>
								<tr>
									<th>상품 소개</th>
									<td colspan=2><span>${goods.gdsDes}</span></td>
								</tr>  		
								<tr>
									<td colspan=3 style="text-align:center;">
										<button type="button" class="btn btn-warning" id="modify_Btn">수정</button>
										<button type="button" class="btn btn-danger" id="delete_Btn">삭제</button>
									</td>
								</tr>
							</tbody>
						</table>
						<script>
							var formObj = $("form[role = 'form']");
							
							$("#modify_Btn").click(function(){
								formObj.attr("action", "/admin/goods/modify");
								formObj.attr("method","get");
								formObj.submit();
							});
							$("#delete_Btn").click(function(){
								var con = confirm("정말로 삭제하시겠습니까?");
								if(con){
									formObj.attr("action", "/admin/goods/delete");
									formObj.submit();
								}
							});
						</script>
					</form>			
				</div>
			</div>
			<!-- /.col-lg-9 -->
		</div>
   		<!-- /.row -->
	</div>
	<!-- /.container -->


  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>