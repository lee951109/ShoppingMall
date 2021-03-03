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
									<td colspan=2><textarea id="gdsDes" name="gdsDes" cols="83" rows="10" maxlength="2048" class="tbox">${goods.gdsDes}</textarea></td>
								</tr>
								<tr>
									<th>이미지<input type="file" id="gdsIms" name="file"></th>
									<td colspan=2>
										<div class="select_img"><img src="${goods.gdsImg}"/></div>
										<input type="hidden" name="gdsImg" value="${goods.gdsImg}"/>
										<input type="hidden" name="gdsThumbImg" value="${goods.gdsThumbImg}"/>
										<%=request.getRealPath("/") %>
									</td>
									
								</tr>		
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
							});
								//이미지 미리보기
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