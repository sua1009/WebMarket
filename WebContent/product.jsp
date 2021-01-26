<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 정보</h1>
		</div>
	</div>
	<%
		/* products.jsp에서 get방식으로 request 내장 객체에 데이터를 저장하여 전송 */
		String id= request.getParameter("id");
		/* 매개 변수로 입력한 상품 id와 동일한 정보가 있을 경우 반환 */
		/* ProductRepository 클래스 타입의 변수 dao에 ProductRepository클래스  */
		ProductRepository dao = ProductRepository.getInstance();
		Product product = dao.getProductById(id);
	%>
	<div class="container">
		<div class="row">
			<div class ="col-md-6">
				<h3><%=product.getPname()%></h3>
				<p><%=product.getDescription() %>
				<p><b>상품 코드</b><span class="badge badge-danger"><%=product.getProductId() %></span>
				<p><b>제조사</b> : <%=product.getManufacturer() %>
				<p><b>분류</b> : <%=product.getCategory() %>
				<p><b>재고 수</b> : <%=product.getUnitsInStock() %>
				<h4><%=product.getUnitPrice() %>원</h4>
				<p><a href="#" class="btn btn-info">상품 주문 &raquo;</a>		
				<a href="./products.jsp" class="btn btn-secondary"> 상품 목록 &raquo;</a>
			</div>
		</div>
		<hr>
	</div>	
	<jsp:include page="footer.jsp" />
	
</body>
</html>