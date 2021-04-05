<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>특정 주문 목록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
.orderInfo { border:5px solid #eee; padding:10px 20px; margin:20px 0;}
.orderInfo span { font-size:20px; font-weight:bold; display:inline-block; width:90px; }
 
.orderDetail li { margin-bottom:20px; padding-bottom:20px; border-bottom:1px solid #999; }
.orderDetail li::after { content:""; display:block; clear:both; }
 
.thumb { float:left; width:200px; }
.thumb img { width:200px; height:200px; }
.gdsInfo { float:right; width:calc(100% - 220px); line-height:2; }
.gdsInfo span { font-size:20px; font-weight:bold; display:inline-block; width:100px; margin-right:10px; }
.deliveryChange { text-align:right; }
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
<section id="content">
	<div class="orderInfo">					<!-- varStatus="status" 는 상태용 변수-->
		<c:forEach items="${orderDetail}" var="orderDetail" varStatus="status"> 
			<c:if test="${status.first}" > <!-- 첫 번째인지 여부 -->
				<p><span>수령인</span>${orderDetail.orderRec}</p>
				<p><span>주소</span>(${orderDetail.userAddr1})${orderDetail.userAddr2} ${orderDetail.userAddr3}</p>
				<p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderDetail.amount}" />원</p>
				<p><span>배송 상태</span>${orderDetail.delivery}</p>
				
				<div class="deliveryChange">
					<form role="form" method="post" class="deliveryForm">
					
						<input type="hidden" name="orderId" value="${orderDetail.orderId}" />
						<input type="hidden" name="delivery" class="delivery" value="" />
					
						<button class="btn btn-primary" id="deliveryBtn1">배송 중</button>
						<button class="btn btn-success" id="deliveryBtn2">배송 완료</button>
						
						<script>
							$("#deliveryBtn1").click(function(){ //버튼 클릭시 input 값이 배송 중으로 바뀜
								$(".delivery").val("배송 중");
								run();
							});
							$("deliveryBtn2").click(function(){ //버튼 클릭시 input 값이 배송 완료로 바뀜
								$(".delivery").val("배송 완료");
								run();
							});
							
							function run(){
								$(".deliveryForm").submit(); //바뀐 정보의 데이터를 컨트롤러에 보냄
								
							}
						</script>
							
					</form>
				</div>
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



</body>
</html>