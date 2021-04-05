<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ShopGun#</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/main.css">	

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>
.orderInfo { border:5px solid #eee; padding:10px 20px; margin:20px 0;}
.orderInfo span { font-size:20px; font-weight:bold; display:inline-block; width:90px; }
 
.orderDetail li { margin-bottom:20px; padding-bottom:20px; border-bottom:1px solid #999; }
.orderDetail li::after { content:""; display:block; clear:both; }
 
.thumb { float:left; width:200px; }
.thumb img { width:200px; height:200px; }
.gdsInfo { float:right; width:calc(100% - 220px); line-height:2; }
.gdsInfo p {width:300px; height:450;}
.gdsInfo span { font-size:20px; font-weight:bold; display:inline-block; width:100px; margin-right:5px; }
</style>

</head>
<body>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top">
	<%@ include file="include/nav.jsp" %>
</nav>

<section id="container">
	<div id="container_box">
		<section id="content">
			<div class="orderInfo">					<!-- varStatus="status" 는 상태용 변수-->
				<c:forEach items="${orderDetail}" var="orderDetail" varStatus="status"> 
					<c:if test="${status.first}" > <!-- 첫 번째인지 여부 -->
						<p><span>수령인</span>${orderDetail.orderRec}</p>
						<p><span>주소</span>(${orderDetail.userAddr1})${orderDetail.userAddr2} ${orderDetail.userAddr3}</p>
						<p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderDetail.amount}" />원</p>
						<p><span>배송 상태</span>${orderDetail.delivery}</p>
					</c:if> 
				</c:forEach>
			</div>
			
			<ul class="orderDetail">
				<c:forEach items="${orderDetail}" var="orderDetail">
					<li>
						<div class="thumb">
							<img src="${orderDetail.goodsVO.gdsThumbImg}"/>
						</div>
						<div class="gdsInfo">
							<p>
							<span>상품명</span>${orderDetail.goodsVO.gdsName}<br />
							<span>개당 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderDetail.goodsVO.gdsPrice}" /> 원<br />
     						<span>구입 수량</span>${orderDetail.orderDetailVO.cartStock} 개<br />
     						<span>최종 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderDetail.goodsVO.gdsPrice * orderDetail.orderDetailVO.cartStock}" /> 원 
							</p>
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