<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>ShopGun#</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/main.css">	

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>
section#content ul li { border:5px solid #eee; padding:10px 20px; margin-bottom:20px; }
section#content .orderList span { font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px; }
</style>

</head>
<body>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top">
	<%@ include file="include/nav.jsp" %>
</nav>

<section id="container">
	<div id="container_box">
		<section id="content">
			<ul class="orderList">
				<c:forEach items="${orderList}" var="orderList">
					<li>
						<div>
							<p><span>주문번호</span><a href="/orderDetail?n=${orderList.orderId}">${orderList.orderId}</a></p>
							<p><span>수령인</span>${orderList.orderRec}</p>
							<p><span>주소</span>(${orderList.userAddr1})	${orderList.userAddr2} ${orderList.userAddr3}</p>
							<p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderList.amount}"/>원</p>
							<p><span>배송 상태</span>${orderList.delivery}</p>
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