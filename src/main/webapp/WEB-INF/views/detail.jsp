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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/css/main.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
div.goods div.gdsDes {font-size:18px; clear:both; padding-top:30px; text-align:center;}

section.reviewForm { padding:30px 0; }
section.reviewForm div.input_area { margin:10px 0; }
section.reviewForm textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:500px;; height:150px; }

section.reviewList { padding:30px 0; }
section.reviewList ol { padding:0; margin:0; }
section.reviewList ol li { padding:10px 0; border-bottom:2px solid #eee; }
section.reviewList div.userInfo { }
section.reviewList div.userInfo .userId { font-size:24px; font-weight:bold; }
section.reviewList div.userInfo .reviewDate { color:#999; display:inline-block; margin-left:10px; }
section.reviewList div.reviewContent { padding:10px; margin:20px 0; }

div.reviewModal { position:relative; z-index:1; display:none; }
div.modalBackground { position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.8); z-index:-1; }
div.modalContent { position:fixed; top:20%; left:calc(50% - 250px); width:500px; height:250px; padding:20px 10px; background:#fff; border:2px solid #666; }
div.modalContent textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:500px; height:200px; }

</style>

<script>
function displayTime(timeValue){
	var today = new Date(); //현재 날짜 및 시간
		//getTime()은 1970년1월1일 기준으로한 밀리 초 값을 보여준다
	var gap = today.getTime() - timeValue; 
	
	var dateObj = new Date(timeValue);
	var str = "";
	
	if(gap < (1000 * 60 * 60 * 24)){ //1000 * 60 * 60 * 24 = 하루를 초로 계산한 시간이다 (86400000)
		var hh = dateObj.getHours();
		var mi = dateObj.getMinutes();
		var ss = dateObj.getSeconds();
		
		return [(hh>9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi, ':', (ss > 9 ? '' : '0') + ss].join('');
	}else{
		var yy = dateObj.getFullYear();
		var mm = dateObj.getMonth() + 1; // getMonth() is zero-based
		var dd = dateObj.getDate();
		
		return [yy, '/', (mm > 9 ? '' : '0')+mm, '/', (dd > 9 ? '' : '0') + dd].join('');
	}
};
function getReviews(){
	var gdsNum = ${detail.gdsNum};
	
		$.getJSON("/reviews/all/" + gdsNum,function(data){
			var str = "";
			//console.log(data.length);
			

			$(data).each(function(){
			//console.log(data);
						
				str +="<li data-reviewNum='" + this.reviewNum + "'>"
					+ "<div class='userInfo'>"
					+ "<span class='userId'>" + this.userId + "</span>"
					+ "<span class='reviewDate'>" + displayTime(this.reviewDate) + "</span>"
					+ "</div>"
					+ "<div class='reviewContent'>" + this.reviewContent + "</div>"
					
					+ "<c:if test='${member != null}'>"
					+ "<div class='reviewFooter'>"
					+ "<button class='btn btn-dark btn-xs' id='modify' data-reviewNum='" + this.reviewNum + "'>수정</button>"
					+ "<button class='btn btn-danger btn-xs' id='delete' data-reviewNum='" + this.reviewNum + "'>삭제</button>" 
					+ "</c:if>"
					+ "</li>";
			});
			$("#reviews").html(str);
		});
}
	
		//리뷰 삭제 함수
$(document).on("click","#delete", function(){
	var delConfirm = confirm("정말로 삭제하시겠습니까?");
	
	if(delConfirm){
		var reviewNum = $(this).attr("data-reviewNum"); //data-reviewNum의 속성을 가져온당
		$.ajax({
			url : "/reviews/" + reviewNum,
			type: 'delete',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method_Override" : "post"
			},
			success : function(result){
				if(result == "delSuccess"){
					getReviews();
				}else{
					alert("작성자 외 삭제가 불가능합니다.");
				}
			},
			error: function(err){
				console.log("에러는 : " + err);
			}
		});
		}
	});

	
</script>
</head>

<body>

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
					<img src="${detail.gdsImg}" style="border: 1px solid black;">
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
										var success = confirm("장바구니로 이동하시겠습니까?");
											if(success){
											location.href="cartList";
											}else{$(".numBox").val("1"); // 초기화
											}
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
				</div>
					<div class="gdsDes">${detail.gdsDes}</div>
				</div>
				<br>
				<hr/>
				
				<div class="review">
					<c:if test="${member == null}">
						<p>리뷰를 작성하시려면<a href="/member/login">로그인</a>해주세요.</p>
					</c:if>
					<c:if test="${member != null}">
					<section class="reviewForm">
						<form role="form" method="post" autocomplete="off">
							<input type="hidden" name="gdsNum" id="gdsNum" value="${detail.gdsNum}">
							<div class="input_area">
								<textarea name="reviewContent" id="reviewContent"></textarea>
							</div>

							<div class="input_area">
								<button type="button" id="reviewBtn" class="btn btn-dark">리뷰 등록</button>
							</div>
							<script>
							$("#reviewBtn").on("click",function(){
								var reviewContent = $("textarea#reviewContent").val();
								var gdsNum = $("#gdsNum").val();
								
									$.ajax({
										type : 'post',
										url : '/reviews/new/',
										headers : {
											"Content-Type" : "application/json",
											"X-HTTP-Method_Override" : "post"
										},
										dataType : 'text',
										data : JSON.stringify({ //JSON으로 데이터를 전달하기 위함
											gdsNum : gdsNum,
											reviewContent : reviewContent
										}),
										success : function(result){	//성공이라면 result
											if(result == "regSuccess"){	//ReviewController "regSuccess"의 regSuccess
											alert("등록 되었습니다.");
											$("#reviewContent").val("");
											getReviews();
																
											}
										},
										error : function(err){
											console.log("에러는 : " + err);
										}
									});
							});

							
							</script>
						
						</form>
					</section>
					</c:if>
					<button type="button" class="btn btn-dark" data-toggle="collapse" data-target="#demo">Review List</button>
					<div id="demo" class="collapse">
					<section class="reviewList">
					
						<ol id="reviews">
						
						</ol>
						<script>
							getReviews();
						</script>
					</section>
					</div>
				</div>			
		</section>
		<aside id="aside">
			<%@ include file="include/aside.jsp" %>
		</aside>
	</div>
</section>
<div class="reviewModal">
	<div class="modalContent">
  		<div>
   			<textarea class="modal_reviCon" name="modal_reviCon"></textarea>
  		</div>
  		<div>
   			<button type="button" class="btn btn-dark" id="modifyBtn">수정</button>
   			<button type="button" class="btn btn-danger" id="cancelBtn">취소</button>
  		</div> 
 	</div>
 	<div class="modalBackground"></div>
</div>
<script>
	$(document).on("click","#modify", function(){
		$(".reviewModal").fadeIn(200);
		
		var reviewNum = $(this).attr("data-reviewNum");
		var reviewContent = $(this).parent().parent().children(".reviewContent").text();
		//this = 수정버튼의 parent(reviewfooter).parent(<li>)의 자식인 class=reviewContent의 text를 찾음.
		//console.log(reviewContent);
		$(".modal_reviCon").val(reviewContent);
		$("#modifyBtn").attr("data-reviewNum", reviewNum);
		
	});
							
	$("#cancelBtn").click(function(){
		$(".reviewModal").fadeOut(200);
	});

	
	$("#modifyBtn").click(function(){
		var modConfirm = confirm("수정하시겠습니까?");
		
		if(modConfirm){
			var reviewNum = $(this).attr("data-reviewNum");								
			var reviewContent = $(".modal_reviCon").val();
		$.ajax({
			url : '/reviews/' + reviewNum,
			type: 'put',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method_Override" : "put"
			},
			dataType: 'text',
			data: JSON.stringify({reviewContent : reviewContent}),
			success : function(result){
				if(result == "modSuccess"){
					$(".reviewModal").fadeOut(200);
					getReviews();
				}else{
					alert("작성자 외 수정이 불가능합니다." +result);
				}
			},
			error : function(err){
				console.log("에러 : " + err);
				console.log("Object : " + Object)
			}
		});
		}
	});
				
</script>
<footer id="footer">
	<div id="footer_box">
		<%@ include file="include/footer.jsp" %>
	</div>
</footer>
</body>
</html>