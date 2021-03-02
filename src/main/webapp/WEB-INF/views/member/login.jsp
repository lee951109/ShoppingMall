<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheey" href="../../resources/css/bootstrap.css">
</head>
 <body class="text-center">
    <form role="form" method="post" autocomplete="off">
<!--  <img class="mb-4" src="https://getbootstrap.com/docs/4.0/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">  -->  
      <h1 class="h3 mb-3 font-weight-normal">로그인</h1>
      <label for="userId" class="sr-only">아이디:</label>
      <div class=" col-lg-4" style="margin-left:auto; margin-right:auto;">
      <input type="text" id="userId" name="userId" class="form-control offset-md-" placeholder="아이디를 입력해주세요." style="margin" required autofocus>
      </div>
      <label for="userPass" class="sr-only">비밀번호:</label>
      <div class=" col-lg-4" style="margin-left:auto; margin-right:auto;">
      <input type="password" id="userPass" name="userPass" class="form-control" placeholder="비밀번호를 입력해주세요." required>
      </div>
      <div class="checkbox mb-3">
        
      </div>
      <div class=" col-lg-4"  style="margin-left:auto; margin-right:auto;">
      <button class="btn btn-lg btn-dark btn-block" type="submit">로그인</button>
      </div>
      
      <c:if test="${msg == false}">
      	<p style="color:#f00;">로그인에 실패했습니다.</p>
      </c:if>
      
      <p class="mt-5 mb-3 text-muted">&copy; 2021~</p>
    </form>
</body>
</html>