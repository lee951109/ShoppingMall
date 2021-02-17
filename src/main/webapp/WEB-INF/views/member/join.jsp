<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheey" href="/resources/css/bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>



</head>

 <body class="text-center">
 <h1>회원가입</h1>
 <div class="container">
 <form method="post">
 <table class="table table-hover">
    <tbody>
      <tr>
        <td>아이디</td>
        <td><input type="text" class="d-inline form-control" id="userId" name="userId" required="required" placeholder="3글자 이상 입력해주세요.">
      	<div class="check_font" id="id_check"></div></td>
      </tr>
      <tr>
        <td>비밀번호</td>
        <td><input type="password" class="d-inline form-control" id="userPass" name="userPass" required="required" placeholder="PassWord.">
      	<div class="check_font" id="pw1_check"></div></td>
      </tr>
	  <tr>
        <td>비밀번호 확인</td>
        <td><input type="password" class="d-inline form-control" id="userPass2" name="userPass2" required="required" placeholder="PassWord Check.">
        <div class="check_font" id="pw2_check"></div></td>
      </tr>
       <tr>
        <td>이름</td>
        <td><input type="text" class="d-inline form-control" id="userName" name="userName" required="required" placeholder="ex)이지현">
		<div class="check_font" id="name_check"></div></td>
      </tr>
       <tr>
        <td>이메일</td>
        <td>
        	<input type="email" class="d-inline form-control" id="email" name="email" required="required" placeholder="ex)jihyunJJang@naver.com">
        	<div class="check_font" id="email_check"></div></td>
        <!--<button type="button" class="btn btn-dark">인증번호 발송</button>
        	<input type="text" class="d-inline col-sm-3" id="emailCheck" name="emailCheck" placeholder="인증번호를 입력해주세요.">
         -->
        <tr>
        <td>핸드폰 번호</td>
        <td><input type="text" class="d-inline form-control" id="phone" name="phone" required="required" placeholder="ex)010-0000-0000">
        <div class="check_font" id="phone_check"></div></td>
      </tr>  
      <tr>
       <td>우편번호</td>
       <td>
       		<input type="text" class="d-inline col-sm-3" id="address1" name="address1" placeholder="우편번호">
       		<button type="button" class="btn btn-dark"><i class="fa fa-search" aria-hidden="true"></i>주소검색</button>	
       </td>
      </tr>
      <tr>
        <td>주소</td>
        <td>
        	<input type="text" class="d-block form-control" id="address2" name="address2" placeholder="주소">
        	<input type="text" class="d-block form-control" id="address3" name="address3" placeholder="상세주소">
        </td>
      </tr>
    </tbody>
  </table>
 	      <button type="submit" class="btn btn-dark" id="join_button">가입하기</button>
 </form>
 </div>    

<script>
$(document).ready(function(){
	//아이디 유효성 검사(1 = 중복 / 0 = 중복)
	var idJ = /^[a-z0-9]{3,12}$/; //a~z 0~9로 시작하는 소문자만 가능 3~12자리 아이디
	var pwJ = /^[A-Za-z0-9]{4,12}$/; //A~Z,a~z,0~9로 시작하는 4~12자리로 비밀번호를 설정
	var nameJ = /^[가-힣]{2,6}$/;
	//-_. 특수문자가 가능하며 중앙에 @ 필수 .뒤에 2~3글자가 필요하다
	var emailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var phoneJ = /^01(0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
	$('#userId').blur(function(){ //blur 이벤트는 포커스가 해제되었을때 발생
		//id = "id_reg" / name = "userId"
		var userId = $('#userId').val();
		$.ajax({
			url : '${pageContext.request.contextPath}/member/idCheck?userId='+ userId,
			type : 'get',
			success : function(data){
				console.log("1 = 중복 / 0 = 중복x :"+ data);
		
				if(data == 1){
					// 1: 아이디가 중복
					$("#id_check").text("사용중인 아이디입니다.");
					$("#id_check").css("color", "red");
					$("#join_button").attr("disabled", true);
				}else{
					if(idJ.test(userId)){
						// 0: 아이디 길이/ 문자열 검사
						$("#id_check").text("");
						$("#join_button").attr("disabled", true);
					}else if(userId == ""){
						$("#id_check").text("아이디를 입력해주세요");
						$("#id_check").css("color", "red");
						$("#join_button").attr("disabled", true);
					}else{
						$("#id_check").text("아이디는 소문자와 숫자 3~12자리만 가능합니다");
						$("#id_check").css("color", "red");
						$("#join_button").attr("disabled", true);
					}
				}
			}, error : function(err){
				console.log("에러 : " +err);
			}
		});
	});
	//비밀번호 유효성 검사
	//정규식 체크
	$('#userPass').blur(function(){
		if(pwJ.test($('#userPass').val())){
			console.log("true");
			$('#pw1_check').text('');
		}else{
			console.log('false');
			$('#pw1_check').text("숫자 or 문자로만 4~12자리 입력해야합니다.");
			$('#pw1_check').css('color', 'red');
			$("#join_button").attr("disabled", true);
		}
	});
	//패스워드 일치 확인
	$('#userPass2').blur(function(){
		if($('#userPass').val() != $(this).val()){
			$('#pw2_check').text('비밀번호가 일치하지 않습니다.');
			$('#pw2_check').css('color', 'red');
			$("#join_button").attr("disabled", true);
		}else{
			$('pw2_check').text('');
		}
	});
	//이름에 특수문자 들어가지 않도록 설정
	$("#userName").blur(function(){
		if(nameJ.test($(this).val())){
			console.log(nameJ.test($('#userName').val()));
			$("#name_check").text('');
		}else{
			$('#name_check').text('이름을 확인해주세요.');
			$('#name_check').css('color', 'red');
			$("#join_button").attr("disabled", true);
		}
	});
	//핸드폰 정규식
	$('#phone').blur(function(){
		if(phoneJ.test($(this).val())){
			console.log(nameJ.test($(this).val()));
			$('#phone_check').text('');
		}else{
			$('#phone_check').text('휴대폰 번호를 확인해주세요.');
			$('#phone_check').css('color', 'red');
			$("#join_button").attr("disabled", true);
		}
	});
	//이메일 정규식
	$('#email').blur(function(){
		if(emailJ.test($(this).val())){
			console.log(emailJ.test($(this).val()));
			$('#email_check').text('');
		}else{
			$('#email_check').text('이메일을 확인해주세요.');
			$('#email_check').css('color', 'red');
			$("#join_button").attr("disabled", true);
		}
	});
});
</script>
    
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>