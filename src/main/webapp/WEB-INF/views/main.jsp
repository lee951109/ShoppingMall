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
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
h3 {color: #343a40;}
img {width: 800px; height: 500px;}

section#content ul li {display:inline-block; margin:10px; }
section#content div.goodsThumb img { width:200px; height:200px; }
section#content div.goodsName { padding:10px 0; text-align:center; }
section#content div.goodsName a { color:#000; }
</style>
</head>

<body>


<nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top">
	<%@ include file="include/nav.jsp" %>
</nav>

<section id="container">
	<div id="container_box">
		<section id="content">
			<h5 style="text-align:center;">출시 예정 상품.</h5>
				<div id="demo" class="carousel slide" data-ride="carousel">
					<ul class="carousel-indicators">
						<li data-target="#demo" data-slide-to="0" class="active"></li>
						<li data-target="#demo" data-slide-to="1"></li>
						<li data-target="#demo" data-slide-to="2"></li>
					</ul>
					
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="/resources/images/리얼 총.jpg" alt="M4A1커스텀">
							<div class="carousel-caption">
								<h3>M4A1 커스텀</h3>
							</div>
						</div>
						<div class="carousel-item">
							<img src="/resources/images/SPAS-12.jpg" alt="반자동 샷건(SPAS-12)">
							<div class="carousel-caption">
								<h3>SPAS-12</h3>
							</div>
						</div>
						<div class="carousel-item">
							<img src="/resources/images/D-eagle.jpg" alt="D.eagle권총">
							<div class="carousel-caption">
								<h3>D.eagle</h3>
							</div>
						</div>
					</div>
					<a class="carousel-control-prev" href="#demo" data-slide="prev">
    					<span class="carousel-control-prev-icon"></span>
  					</a>
  					<a class="carousel-control-next" href="#demo" data-slide="next">
    					<span class="carousel-control-next-icon"></span>
  					</a>
				</div>
				
				<ul>
				<c:forEach items="${main}" var="main">
					<li>
						<div class="goodsThumb">
							<img src="${main.gdsThumbImg}">
						</div>
						<div class="goodsName">
							<a href="/detail?n=${main.gdsNum}">${main.gdsName}</a>
						</div>
					</li>
				</c:forEach>
			</ul>
			<div>
			<form id="listPageForm">
				<input type="hidden" name="page" value="${pageMaker.cri.page}">
				<input type="hidden" name="perPageNum" value="${pageMaker.cri.perPageNum}">
			</form>
			<ul class="pagination justify-content-center">
				<c:if test="${pageMaker.prev}">
					<%--<li class="page-item"><a class="page-link" href="list${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>--%>
					<li class="page-item"><a class="page-link" href="${pageMaker.startPage - 1}">이전</a></li>
				</c:if>	
				
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					<li class="page-item"<c:out value="${pageMaker.cri.page == idx ? 'calss=active' : ''}" />>
					<%--<a class="page-link" href="list${pageMaker.makeQuery(idx)}">${idx}</a>--%>
					<a class="page-link" href="${idx}">${idx}</a>
					</li>
				</c:forEach>
				
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<%--<li class="page-item"><a class="page-link" href="list${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li> --%>
					<li class="page-item"><a class="page-link" href="${pageMaker.endPage + 1}">다음</a></li>
				</c:if>
			</ul>
			
			<script>
			//페이지 번호를 클릭할때 이벤트를 처리
				$(".pagination li a").on("click", function(){
					event.preventDefault(); // 페이지 이동을 막음
					
					var targetPage = $(this).attr("href");
					var listPageForm = $("#listPageForm");
					listPageForm.find("[name='page']").val(targetPage);
					listPageForm.attr("action", "/").attr("method", "get");
					listPageForm.submit();
				})
				
			</script>
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