<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- JSP 파일에 자바 클래스를 사용할 수 있도록 선언 -->
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "dto.Product" %>
<%@ page import = "dao.ProductRepository" %>
<!-- 자바빈즈를 사용 -->
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>상품 목록</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
		<div class = "jumbotron">
			<div class= "container">
				<h1 class="display-3">상품 목록</h1>
			</div>
		</div>
		<!-- ArrayList : 데이터를 저장하기 위한 자료 구조 중 한가지, 배열과 비슷함, 
		Java 배열(Array)은 크기가 설정되면 변경할 수 없지만 ArrayList는 크기를 동적으로 변경할 수 었음 -->
	
	<%
		ProductRepository dao = ProductRepository.getInstance();
		ArrayList<Product> listOfProducts = dao.getAllProducts();
	%>
	<div class="container">
		<div class="row" align = "center">
			<%
				for(int i = 0; i < listOfProducts.size(); i ++){
					Product product = listOfProducts.get(i);
					/* listOfProduct의 i번째 데이터를 가져와서 Product 타입의 변수 product에 저장 */
			%>
			<div class = "col-md-4" >
				<h3><%=product.getPname() %></h3>
				<p><%=product.getDescription() %>
				<p><%=product.getUnitPrice() %>원
				<p><a href="./product.jsp?id=<%=product.getProductId() %>"
				class="btn btn-secondary" role="button">상세정보 &raquo;></a>
			</div>
			<%
			}
			%>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
	
	
</body>
</html>