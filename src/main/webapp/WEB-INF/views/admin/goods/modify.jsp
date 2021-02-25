<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
<div class="container">
	<div class="row">
		<div class="col-lg-9">
	   		<br>
	   			<div id="carouselExampleIndicators">				
					<form method="post" role="form" autocomplete="off">
						<table class="table" style="border:1px solid #dddddd">
							<tr>
								<th colspan=3 style="background-color:#d3d3d3; text-align:center;">상품 등록</th>
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
									<select name="cateCode">
										<option value="none">=== 선택 ===</option>
										<option disabled>=== 무기 ===</option>
										<option value="101">돌격소총(AR)</option>
										<option value="102">기관단총(SMG)</option>
										<option value="103">산탄총(SG)</option>
										<option value="104">소총(DMR)</option>
										<option value="105">저격총(SR)</option>
										<option disabled>=== 탄 ===</option>
										<option value="201">5.56mm</option>
										<option value="202">7.62mm</option>
										<option value="203">9mm</option>
										<option disabled>=== 방탄구 ===</option>
										<option value="301">방탄헬멧</option>
										<option value="302">방탄조끼</option>
										<option value="303">전술가방</option>
									</select>
								</td>
								<input type="hidden" name="gdsNum" value="${goods.gdsNum}"/>
							</tr>
							<tbody id="twrite">
								<tr>
									<th>제품명</th>
									<td colspan=2><input id="gdsName" name="gdsName" value="${goods.gdsName}"  class="tbox" size="80" maxlength="30" /></td>
								</tr>
								<tr>
									<th>가격</th>
									<td colspan=2><input id="gdsPrice" name="gdsPrice" value="${goods.gdsPrice}" class="tbox" size="80" maxlength="30" /></td>
								</tr>
								<tr>
									<th>상품 수량</th>
									<td colspan=2><input id="gdsStock" name="gdsStock" value="${goods.gdsStock}" class="tbox" size="80" maxlength="30" /></td>
								</tr>
								<tr>
									<th>상품 소개</th>
									<td colspan=2><textarea id="gdsDes" name="gdsDes" vale="${goods.gdsDes}" cols="83" rows="10" maxlength="2048" class="tbox"/></textarea></td>
								</tr>
								<!--  
								<tr>
									<th>이미지<input type="file" id="gdsIms" name="gdsIms"></th>
									<td colspan=2><div class="select_img"><img src=""/></div></td>
								</tr>	
								-->		
								<tr>
									<td colspan=3 style="text-align:center;">
										<button type="submit" class="btn btn-primary" id="update_Btn">완료</button>
										<button type="submit" class="btn btn-warning" id="back_Btn">취소</button>
									</td>
								</tr>
							</tbody>
						</table>
						<script>
							$("#back_Btn").click(function(){
								//history.back();
								location.href = "/admin/goods/view?n=" +${goods.gdsNum};
							})
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