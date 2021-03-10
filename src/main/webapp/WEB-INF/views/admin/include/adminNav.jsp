<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
  
  <a class="navbar-brand" href="/">Logo</a>
  <ul class="navbar-nav">
  	<li class="nav-item">
  		<a class="nav-link" href="/admin/goods/register">무기 등록</a>
  	</li>
  	<li class="nav-item">
  		<a class="nav-link" href="/admin/goods/list">무기 목록</a>
  	</li>
  	<li class="nav-item">
  		<a class="nav-link" href="#">무기 소감</a>
  	</li>
  	  	<li class="nav-item">
  		<a class="nav-link" href="#">유저 목록</a>
  	</li>
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