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
<!-- modal jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<style>
div.goods div.goodsImg {float:left; width:350px; }
div.goods div.goodsImg img { width:350px; height:auto; }
		
div.goods div.goodsInfo {float:right; width:330px; font-size:22px; margin-left:30px}
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
				<input type="hidden" name="gdsNum" id="gdsNum" value="${detail.gdsNum}" />
			</form>
	
			<div class="goods">
				<div class="goodsImg">
					<img src="${detail.gdsImg}">
				</div>
		
				<div class="goodsInfo">
					<p class="gdsName"><span>상품명</span>${detail.gdsName}</p>
			
					<p class="cateName"><span>카테고리</span>${detail.categoryVO.cateName}</p>
				
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
						<button type="button" class="btn btn-dark addCart_btn">카트에 담기</button>
					</p>
					<script>
						$(".addCart_btn").click(function(){
							var gdsNum = $("#gdsNum").val();
							var cartStock = $(".numBox").val();
							console.log("gdsNum : " + gdsNum);
							console.log("cartStock : " + cartStock);
							
							// ReviewVO 형태로 데이터 생성
							var data = {
									gdsNum: gdsNum,
									cartStock: cartStock
							};
							$.ajax({
								url: "/detail/addCart",
								type: "post",
								dataType: "json",
								data: data,
								success:function(result){
									if(result == 1){
										alert("장바구니에 담았습니다.");
										console.log("성공result : " + result);
										$(".numBox").val("1"); // 초기화
									}else{
										alert("로그인 후 사용 가능합니다.");
										console.log("실패result : " + result);
										$(".numBox").val("1"); 
									}
								},
								error: function(err){
									console.log("error : " + err);
								}
							}); //ajax end
						}); //click end
					</script>
				
					<div class="gdsDes">${detail.gdsDes}</div>
				</div>
				</div>
				<br>
				<hr/>
				<!-- 리뷰 작성하기 -->
			<div class="reply" style="clear:both;">
				<c:if test="${member == null }">
  					<p>리뷰를 남기시려면 <a href="/member/login">로그인</a>해주세요</p>
 				</c:if>
 
 				<c:if test="${member != null}">
 					<div class="card shadow mb-4">
 						<div class="card-header py-3">
 							<i class="fa fa-comments"></i>Review
 							<button id="addReviewBtn" class="btn btn-dark btn-sm float-right">리뷰 작성</button>
 						</div>
 					</div>
				</c:if>
				<script>
					var reviewService = (function(){
						
						//등록처리
						function add(review, callback, error){
							console.log("add review..");
							
							$.ajax({
								type: "post",
								url: "replies/review",
								data: JSON.stringify(review),
								contentType: "application/json; charset=utf-8",
								success: function(result, status, xhr){
									if(callback){
										callback(result);
									}
								},
								error: function(xhr, status, er){
									if(error){
										error(er);
									}
								}
							})//ajax
						}
						return {add:add};
					}); // reviewService end
				</script>
					<section class="replyList">
						<ol>
							<li>replyList</li>
						</ol>
					</section>
				</div>
				
		</section>
		
		<!-- 모달 -->
		<div class="modal" id="reviewModal">
			<div class="modal-dialog">
				<div class="modal-content">
				
					<!-- modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">리뷰 작성</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					
					<!-- modal body -->
					<div class="modal-body">
						<div class="form-group">
							<label>작성자</label>
							<input class="form-control" name="userId" value="userId">
						</div>
						<div class="form-group">
							<label>내용</label>
							<input class="form-control" name="reviewContent" value="reviewContent">
						</div>
						<div class="form-group">
							<label>작성날자</label>
							<input class="form-control" name="reviewDate" value="">
						</div>
					</div>
					
					<!-- modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-warning" id="modalModBtn">수정</button> 
						<button type="button" class="btn btn-danger" id="modalDelBtn">삭제</button> 
						<button type="button" class="btn btn-dark" id="modalRegBtn">등록</button> 
						<button type="button" class="btn btn-default" id="modalCloBtn">닫기</button> 
					</div>
				</div>
			</div>
		</div>
		<!-- modal end -->
		<script type="text/javascript">
			$(document).ready(function(){
				
				var gdsNumValue = "${GoodsVO.gdsNum}";
				
				var modal = $("#reviewModal"); //moadl
				var inputContent = modal.find("input[name=reviewContent]"); //리뷰 내용
				var inputUserId = modal.find("input[name=userId]"); //작성자
				var inputDate = modal.find("input[name=reviewDate]");	//작성일
				
				var modalModBtn = $("#modalModBtn"); //수정버튼
				var modalDelBtn = $("#modalDelBtn"); //삭제버튼
				var modalRegBtn = $("#modalRegBtn"); //등록버튼
				
				//리뷰작성 버튼 클릭시 모달창 띄우기!
				$("#addReviewBtn").on("click", function(e){
					modal.find("input").val(""); //입력창 항목 초기화
					inputDate.closest("div").hide(); //날짜 숨기기
					modal.find("button[id != 'modalCloBtn']").hide(); //닫기버튼만 보이기
					
					modalRegBtn.show(); //등록버튼은 다시 보이게
					$("#reviewModal").modal("show"); //modal창 보이기
				});
				
				//등록 버튼 클릭시 댓글 등록
				modalRegBtn.on("click",function(e){
					var review = {
							reviewContent: inputContent.val(),
							reviewUserId: inputUserId.val(),
							gdsNum: gdsNumValue
					};
				
					//리뷰 등록요청
					reviewService.add(review, function(result){
						alert(result); //결과 메시지 출력
						modal.find("input").val(""); //입력 항목 초기화
						modal.modal("hide"); //모달 창 닫기
						
						showList(1);
					});
				});
			});
		</script>
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