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
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 주소 api -->


<style>
#mail_check_input_box_false{
	background-color:#ebebe4;
}
#mail_check_input_box_true{
	background-color:white;
}
.correct{
    color : green;
}
.incorrect{
    color : red;
}

</style>

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
        	<div class="check_font" id="email_check"></div>
        <button type="button" class="btn btn-dark" id="mailBtn">인증번호 전송</button>
        	<div class="mail_check_input_box" id="mail_check_input_box_false">
        	<input type="text" class="d-inline col-sm-3" id="emailCheck" name="emailCheck" disabled="disabled" placeholder="인증번호를 입력해주세요."></div>
        	<div class="clearfix"></div>
        	<span id="mail_check_input_box_warn"></span>
        </td> 
        <tr>
        <td>핸드폰 번호</td>
        <td><input type="text" class="d-inline form-control" id="phone" name="phone" required="required" placeholder="ex)010-0000-0000">
        <div class="check_font" id="phone_check"></div></td>
      </tr>  
      <tr>
       <td>우편번호</td>
       <td>
       		<input type="text" class="d-inline col-sm-3" id="address1" name="address1" readonly placeholder="우편번호">
       		<button type="button" class="btn btn-dark" onclick="daum_addressApi()"><i class="fa fa-search" aria-hidden="true"></i>주소검색</button>	
       </td>
      </tr>
      <tr>
        <td>주소</td>
        <td>
        	<input type="text" class="d-block form-control" id="address2" name="address2" readonly placeholder="주소">
        	<input type="text" class="d-block form-control" id="address3" name="address3" readonly placeholder="상세주소">
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
	var phoneJ = /^01(0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
	
	var code = ""; //이메일전송 인증번호 저장을 위한 코드
	$('#userId').blur(function(){ //blur 이벤트는 포커스가 해제되었을때 발생
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
						$("#join_button").attr("disabled", false);
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
			console.log(phoneJ.test($(this).val()));
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
	//인증번호 이메일 전송
	$("#mailBtn").click(function(){
		var email = $("#email").val();
		var checkBox = $("#emailCheck");
		var boxWrap = $(".mail_check_input_box");
		$.ajax({
			type:"get",
			url:"${pageContext.request.contextPath}/member/mailCheck?email=" + email,
			success:function(data){
				//console.log("data : " + data);
				checkBox.attr("disabled", false);
				boxWrap.attr("id", "mail_check_input_box_true"); //id 값을 바꿈
				code = data;
			}
		});
	});
	//인증번호 비교
	$("#emailCheck").blur(function(){
		var inputCode = $("#emailCheck").val();				//입력코드
		var checkResult = $("#mail_check_input_box_warn");	//비교 결과
		
		if(inputCode == code){
			checkResult.html("인증번호가 일치합니다.");
			checkResult.attr("class", "correct");
		}else{
			checkResult.html("인증번호가 일치하지 않습니다.");
			checkResult.attr("class", "incorrect");
		}
	});
});

//다음 주소 연동
function daum_addressApi(){
	  new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    //주소변수 문자열과 참고항목 문자열 합치기
                    addr += extraAddr;
                } else {
                   addr += ' ';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
               	$("#address1").val(data.zonecode);
                $("#address2").val(addr);
               	//상세주소 readonly를 해제시킨 뒤 커서를 상세주소 필드로 이동한다
               	$("#address3").attr("readonly", false);
               	$("#address3").focus();
               
	        }
	    }).open();
}
	

</script>
    
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>