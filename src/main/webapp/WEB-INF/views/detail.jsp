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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
div.goods div.goodsImg { float:left; width:350px; }
div.goods div.goodsImg img { width:350px; height:auto; }
		
div.goods div.goodsInfo { float:right; width:330px; font-size:22px; }
div.goods div.goodsInfo p { margin:0 0 20px 0; }
div.goods div.goodsInfo p span { display:inline-block; width:100px; margin-right:15px; } 
		
div.goods div.goodsInfo p.cartStock input { font-size:22px; width:50px; padding:5px; margin:0; border:1px solid #eee; }
div.goods div.goodsInfo p.cartStock button { font-size:26px; border:none; background:none; } 
div.goods div.goodsInfo p.addToCart { text-align:right; }
div.goods div.goodsInfo p.addToCart button { font-size:22px; padding:5px 10px; border:1px solid #eee; background:#eee;}
div.goods div.gdsDes { font-size:18px; clear:both; padding-top:30px; }

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
			<form role="form" method="post">
				<input type="hidden" name="gdsNum" value="${detail.gdsNum}" />
			</form>
	
			<div class="goods">
				<div class="goodsImg">
					<img src="${detail.gdsImg}">
				</div>
		
				<div class="goodsInfo">
					<p class="gdsName"><span>상품명</span>${detail.gdsName}</p>
			
					<p class="cateName"><span>카테고리</span>${detail.cateName}</p>
				
					<p class="gdsPrice">
						<span>가격</span><fmt:formatNumber pattern="###,###,###" value="${detail.gdsPrice}"/>원
					</p>
			
					<p class="cartStock">
						<span>구매수량</span>
						<button type="button" class="plus">+</button>
						<input type="number" class="numBox" readonly min="1" max="${detail.gdsStock}" value="1" />
						<button type="button" class="minus">-</button>
						
						<script>
							$(".plus").click(function(){
								var num = $(".numBox").val();
								var plusNum = Number(num) + 1;
								
								if(plusNum >= ${detail.gdsStock}){
									$(".numBox").val(num);
								}else{
									$(".numBox").val(plusNum);
								}						
							});
							$(".minus").click(function(){
								var num = $(".numBox").val();
								var minusNum = Number(num) - 1;
								
								if(minusNum <= 0){
									$(".numBox").val(num);	
								}else{
									$(".numBox").val(minusNum);
								}
							});
						</script>
					</p>
			
					<p class="addCart">
						<button type="button">카트에 담기</button>
					</p>
			
					<div class="gdsDes">${detail.gdsDes}</div>
				</div>
			</div>
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