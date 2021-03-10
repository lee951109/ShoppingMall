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
 .oriImg{
 	width: 500px;
 	height:auto;
 }
.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0;
}


</style>
</head>

<body>
<header id="header">
	<div id="header_box">
		<%@ include file="../include/adminHeader.jsp" %>
	</div>
</header>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top">
	<%@ include file="../include/adminNav.jsp" %>
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
									<span class="cateCode">${goods.categoryVO.cateName}</span>
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