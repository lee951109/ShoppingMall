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
<!-- CK에디터 -->
<script src="/resources/ckeditor/ckeditor.js"></script>

<style>
footer {
  height: 100px;
  margin-top: -100px;
  background-color: gray;
 }
 .select_img img{
 	width:500px;
 	margin:20px 0;
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
      <a class="nav-link dropdown-toggle" href="/list?c=100&l=1" id="navbardrop" data-toggle="dropdown">
        무기(Weapon)
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="/list?c=101&l=2">돌격소총(AR)</a>
        <a class="dropdown-item" href="/list?c=102&l=2">기관단총(SMG)</a>
        <a class="dropdown-item" href="/list?c=103&l=2">산탄총(SG)</a>
        <a class="dropdown-item" href="/list?c=104&l=2">소총(DMR)</a>
        <a class="dropdown-item" href="/list?c=105&l=2">저격총(SR)</a>
      </div>
    </li>
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="/list?c=200&l=1" id="navbardrop" data-toggle="dropdown">
        탄(Bullet)
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="/list?c=201&l=2">5.56mm</a>
        <a class="dropdown-item" href="/list?c=202&l=2">7.62mm</a>
        <a class="dropdown-item" href="/list?c=203&l=2">9mm</a>
      </div>
    </li>
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="/list?c=300&l=1" id="navbardrop" data-toggle="dropdown">
        방탄구(Armor)
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="/list?c=301&l=2">방탄헬멧(Helmet)</a>
        <a class="dropdown-item" href="/list?c=302&l=2">방탄조끼(Jacket)</a>
        <a class="dropdown-item" href="/list?c=303&l=2">전술가방(Backpack)</a>
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
					<form method="post" role="form" autocomplete="off" enctype="multipart/form-data">
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
								<td colspan=2>
									<label>1차 분류</label>
									<select class="category1">
										<option value="">전체</option>
									</select>
									<label>2차 분류</label>
									<select class="category2" name="cateCode">
										<option value="">전체</option>
									</select>
								</td>
							</tr>
							<tbody id="twrite">
								<tr>
									<th>제품명</th>
									<td colspan=2><input id="gdsName" name="gdsName" class="tbox" size="80" maxlength="30" /></td>
								</tr>
								<tr>
									<th>가격</th>
									<td colspan=2><input id="gdsPrice" name="gdsPrice" class="tbox" size="80" maxlength="30" /></td>
								</tr>
								<tr>
									<th>상품 수량</th>
									<td colspan=2><input id="gdsStock" name="gdsStock" class="tbox" size="80" maxlength="30" /></td>
								</tr>
								<tr>
									<th>상품 소개</th>
									<td colspan=2><textarea id="gdsDes" name="gdsDes" cols="83" rows="10" maxlength="2048" class="tbox"/></textarea></td>
								</tr>
								<tr>
									<th>이미지<input type="file" name="file" id="gdsImg"></th>
									<td colspan=2>
										<div class="select_img"><img src=""/></div>
										<%=request.getRealPath("/") %>
									</td>
								</tr>		
								<tr>
									<td colspan=3 style="text-align:center;">
										<button type="submit" class="btn btn-dark" id="register_Btn">등록</button>
									</td>
								</tr>
							</tbody>
						</table>
					</form>			
				</div>
			</div>
			<!-- /.col-lg-9 -->
		</div>
   		<!-- /.row -->
	</div>
	<!-- /.container -->
	

<script>
	//썸네일 보여죽;
  $("#gdsImg").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_img img").attr("src", data.target.result).width(500);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });
  
  
  //CK에디터
  var ckeditor_config = {
		  resize_enaleb : false,
		  enterMode : CKEDITOR.ENTER_BR,
		  shiftEnterMode : CKEDITOR.ENTER_P,
		  filebrowserUploadUrl : "/admin/goods/ckUpload"
  		};
  	CKEDITOR.replace("gdsDes", ckeditor_config);
  	
  	//price, stock에 숫자만 입력 가능하게 하는 함수
  	var regExp = /[^0-9]/gi; //숫자만 허용하는 정규 표현식
  	$("#gdsPrice").keyup(function(){
  		numCheck($(this));
  	});
  	$("#gdsStock").keyup(function(){
  		numCheck($(this));
  	});
  	function numCheck(selector){
  		var tempVal = selector.val();
  		selector.val(tempVal.replace(regExp,""));
  	}
  	
  	
  	
  //컨트롤러에서 데이터 받기 (category)
	var jsonData = JSON.parse('${category}'); //parse 메소드는 string객체를 json객체로 변환시켜준다
	console.log(jsonData);
	
	//필요한 배열과 오브젝트 변수 생성
	var cate1Arr = new Array();
	var cate1Obj = new Object();

	// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
	for(var i = 0; i < jsonData.length; i++) {
 
 		if(jsonData[i].level == "1") { //레벨이 1인 데이터가 있다면
  			cate1Obj = new Object();  //초기화
  			
  			//cate1Obj에 cateCode와 cateName을 저장
  			cate1Obj.cateCode = jsonData[i].cateCode;
  			cate1Obj.cateName = jsonData[i].cateName;
  			
  			//cate1Obj에 저장된 값을 cate1Arr 배열에 저장
 			cate1Arr.push(cate1Obj);
 		}
	}

	// 1차 분류 셀렉트 박스에 데이터 삽입
	var cate1Select = $("select.category1")

	for(var i = 0; i < cate1Arr.length; i++) {
		//cate1Arr에 저장된 값을 cate1Select에 추가(append를 사용하여 콘텐츠를 추가함)
 		cate1Select.append("<option value='" + cate1Arr[i].cateCode + "'>"
      		+ cate1Arr[i].cateName + "</option>"); 
	}
	
	//클래스가 category1인 select변수의 값이 변경됐을 때 실행
	$(document).on("change", "select.category1", function(){ //select.category1이 변경되면 실행
		
		 //필요한 배열과 오브젝트 변수를 생성
		 var cate2Arr = new Array();
		 var cate2Obj = new Object();
		 
		 // 2차 분류 셀렉트 박스에 삽입할 데이터 준비
		 for(var i = 0; i < jsonData.length; i++) {
		  
		  if(jsonData[i].level == "2") {//레벨 2인 데이터가 있다면
		   cate2Obj = new Object();  //초기화
		   //cate2Obj에 cateCode,cateName,cateCodeRef를 저장
		   cate2Obj.cateCode = jsonData[i].cateCode;
		   cate2Obj.cateName = jsonData[i].cateName;
		   cate2Obj.cateCodeRef = jsonData[i].cateCodeRef;
		   //cate2Obj에 저장된 값을 cate2Arr 배열에 저장
		   cate2Arr.push(cate2Obj);
		  }
		 }
		 
		 var cate2Select = $("select.category2");
		 //cate2Select의 값을 제거함(초기화)
		 cate2Select.children().remove();
		 
		 //cate1Select에서 선택한 값을 기준으로 cate2Select의 값을 조정
		 $("option:selected", this).each(function(){
		  
		  var selectVal = $(this).val(); // 현재 선택한 cateSelect의 값을 저장
		  cate2Select.append("<option value='"+ selectVal + "'>전체</option>");// cate2Select의 '전체'에 현재 선택한 cate1Select와 같은 값 부여
		  								//selectVal은 '현재 선택한 1차 분류의 코드' 이므로 2차 분류의 기본선택지인 '전체'에도 같은코드가 적용됨
		  //cate2Arr의 데이터를 cate2Select에 추가
		  for(var i = 0; i < cate2Arr.length; i++) {
			  //현재 선택한 cateSelect의 값과 일치하는 cate2Arr의 데이터를 가져옴
		   if(selectVal == cate2Arr[i].cateCodeRef) {
		    cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
		         + cate2Arr[i].cateName + "</option>");
		   }
		  }
		});
	});
	
 </script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>