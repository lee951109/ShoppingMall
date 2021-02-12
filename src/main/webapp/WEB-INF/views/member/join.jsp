<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheey" href="../../resources/css/bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
 <body class="text-center">
 <h1>회원가입</h1>
 <div class="container">
 <form method="post">
 <table class="table table-hover">
    <tbody>
      <tr>
        <td>아이디</td>
        <td><input type="text" class="d-inline form-control" id="userId" name="userId" required="required" placeholder="6글자 이상 입력해주세요."></td>
      </tr>
      <tr>
        <td>비밀번호</td>
        <td><input type="password" class="d-inline form-control" id="userPass" name="userPass" required="required" placeholder="PassWord."></td>
      </tr>
<!--   <tr>
        <td>비밀번호 확인</td>
        <td><input type="password" class="d-inline form-control" id="userPass" name="userPass" required="required" placeholder="PassWord."></td>
      </tr>
-->   
       <tr>
        <td>이름</td>
        <td><input type="text" class="d-inline form-control" id="userName" name="userName" required="required" placeholder="ex)이지현"></td>
      </tr>
       <tr>
        <td>이메일</td>
        <td>
        	<input type="email" class="d-inline form-control" id="email" name="email" required="required" placeholder="ex)jihyunJJang@naver.com">
        <!--<button type="button" class="btn btn-dark">인증번호 발송</button>
        	<input type="text" class="d-inline col-sm-3" id="emailCheck" name="emailCheck" placeholder="인증번호를 입력해주세요.">
         -->
        </td>
        <tr>
        <td>핸드폰 번호</td>
        <td><input type="text" class="d-inline form-control" id="phone" name="phone" required="required" placeholder="ex)010-0000-0000"></td>
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
 	      <button type="submit" class="btn btn-dark">가입하기</button>
 </form>
 </div>    
    
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>