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
<style type="text/css">
section#content ul li { margin:10px 0; }
 section#content ul li img { width:250px; height:250px; }
 section#content ul li::after { content:""; display:block; clear:both; }
 section#content div.ThumbNail { float:left; width:250px; }
 section#content div.goodsInfo { float:right; width:calc(100% - 270px)!improtant; }
 section#content div.goodsInfo { font-size:20px; line-height:2; }
 section#content div.goodsInfo span { display:inline-block; width:100px; font-weight:bold; margin-right:10px; }
 section#content div.goodsInfo p {width:"300px"; height:"180px";}
 section#content div.goodsInfo .delete { text-align:right; }
 section#content div.goodsInfo .delete button {font-size:22px; padding:5px 10px;}
 
.allCheck { float:left; width:200px; }
.allCheck input { width:16px; height:16px; }
.allCheck label { margin-left:10px; }
.delBtn { float:right; width:300px; text-align:right; }
.delBtn button {font-size:18px; padding:5px 10px;}

.checkBox { float:left; width:30px; }
.checkBox input { width:16px; height:16px; }

.listResult { padding:20px; background:#eee; }
.listResult .sum { float:left; width:45%; font-size:22px; }

.listResult .orderOpne { float:right; width:45%; text-align:right; }
.listResult::after { content:""; display:block; clear:both; }

.orderInfo { border:5px solid #eee; padding:20px; display:none;}
.orderInfo .inputArea { margin:10px 0; }
.orderInfo .inputArea label { display:inline-block; width:120px; margin-right:10px; }
.orderInfo .inputArea input { font-size:14px; padding:5px; }
#userAddr2, #userAddr3 { width:250px; }

.orderInfo .inputArea:last-child { margin-top:30px; }
</style>
</head>

<body>


<nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top">
	<%@ include file="include/nav.jsp" %>
</nav>


<section id="container">
	<div id="container_box">
		<section id="content">
			<ul>
				<li>
					<div class="allCheck">
						<input type="checkbox" name="allCheck" id="allCheck"><label for="allCheck">모두 선택</label>
						<script>
							$("#allCheck").click(function(){
								var check = $("#allCheck").prop("checked");
										//prop는 속성의 값을 true, false로 반환한다
								if(check){
									$(".chBox").prop("checked",true); 
								}else{
									$(".chBox").prop("checked",false);
								}
							});
						</script>
					</div>
					<div class="delBtn">
						<button type="button" class="btn btn-dark selectDelete_btn">선택 삭제</button>
					
						<script>
							$(".selectDelete_btn").click(function(){
								var confirm_val = confirm("정말 삭제하시겠습니까?");
								
								if(confirm_val){
									var checkArr = new Array();
									
									$("input[class = 'chBox']:checked").each(function(){
										checkArr.push($(this).attr("data-cartNum"));
									});
								$.ajax({
									url : "/deleteCart",
									type : "post",
									dataType: "json",
									data : {chbox : checkArr},
									success: function(result){
										if(result == 1){
											location.href="/cartList";
										}else{
											alert("삭제 실패");
										}	
									}, //success
									error: function(err){
										console.log("에러는"+Object);
									}
								}); //ajax
								}// if
							});//click
						</script>
					
					</div>
				</li>
				<%-- jsp상의 변수 선언 --%>
				<c:set var="sum" value="0" />
				
				<c:forEach items="${cartList}" var="cartList">
					<li>
						<div class="checkBox">
							<input type="checkbox" name="chBox" class="chBox" data-cartNum="${cartList.cartNum}" value="${cartList.goodsVO.gdsPrice * cartList.cartStock}">
							<script>
								$(".chBox").click(function(){
									$("#allCheck").prop("checked",false);
								});
							</script>
						</div>
					
						<div class="ThumbNail">
							<img src="${cartList.goodsVO.gdsThumbImg}">
						</div>
						<div class="goodsInfo">
							<p>
							<span>상품명 :</span>${cartList.goodsVO.gdsName}<br>
							<span>가격 :</span><fmt:formatNumber pattern="###,###,###" value="${cartList.goodsVO.gdsPrice}"/>원<br>
							<span>구매 개수 :</span>${cartList.cartStock}개<br>
							<span>총 가격 :</span><fmt:formatNumber pattern="###,###,###" value="${cartList.goodsVO.gdsPrice * cartList.cartStock}"/>원
							</p>
						</div>
						<div class="delete">
							<button type="button" class="btn btn-dark delete${cartList.cartNum}Btn" data-cartNum="${cartList.cartNum}">삭제</button>
							<script>
							$(".delete${cartList.cartNum}Btn").click(function(){
								var confirm_val = confirm("정말 삭제하시겠습니까?");
								
								if(confirm_val){
									var checkArr = new Array();
									
									checkArr.push($(this).attr("data-cartNum"));
									
								$.ajax({
									url : "/deleteCart",
									type : "post",
									dataType: "json",
									data : {chbox : checkArr},
									success: function(result){
										if(result == 1){
											location.href="/cartList";
										}else{
											alert("삭제 실패");
										}	
									}, //success
									error: function(err){
										console.log("에러는" + err);
									}
								}); //ajax
								}// if
							});//click
						</script>
						
						</div>	
					</li>
					<hr/>
					<%-- 반복할 때마다 sum에 상품 가격(gdsPrice)*상품 갯수(cartStock)만큼을 더함 --%>
				<c:set var="sum" value="${sum + ( cartList.goodsVO.gdsPrice * cartList.cartStock)}"/>	 
				</c:forEach>
			</ul>
			
			<div class="listResult">
				<div class="sum">
					총 합계: <fmt:formatNumber pattern="###,###,###" value="${sum}" />원
				</div>
				<div class="orderOpne">
					<button type="button" class="btn btn-success orderOpne_btn">주문 정보 입력</button>
					<script>
						$(".orderOpne_btn").click(function(){
							$(".orderInfo").slideDown();
							$(".orderOpne_btn").slideUp();
						});
					</script>
				</div>
			</div>
			
			<div class="orderInfo">
				<form role="form" method="post" autocomplete="off">
					<input type="hidden" name="amount" value="${sum}">
					<div class="inputArea">
						<label for="">수령인</label>
						<input type="text" name="orderRec" id="orderRec" required>
					</div>
					
					<div class="inputArea">
						<label for="orderPhone">수령인 연락처</label>
						<input type="text" name="orderPhone" id="orderPhone" required>
					</div>
					
					<div class="inputArea">
						<label for="userAddr1">우편번호</label>
						<input type="text" name="userAddr1" id="userAddr1" required>
					</div>
					
					<div class="inputArea">
						<label for="userAddr2">주소</label>
						<input type="text" name="userAddr2" id="userAddr2" required>
					</div>
					
					<div class="inputArea">
						<label for="userAddr3">상세 주소</label>
						<input type="text" name="userAddr3" id="userAddr3" required>
					</div>
					
					<div class="inputArea">
						<button type="submit" class="btn btn-primary orderBtn">주문</button>
						<button type="button" class="btn btn-danger cancleBtn">취소</button>
						<script>
						$(".cancleBtn").click(function(){
							$(".orderInfo").slideUp();
							$(".orderOpne_btn").slideDown();
						});
					</script>
					</div>
				</form>
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