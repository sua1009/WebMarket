<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>
<!-- 
dao : Data Access Object 의 줄임말로써 데이터를 조작하기 위한 기능을 전담하기 위해서 만들어진 오브젝트
dto : Data Transfer Object 의 줄임말로써 계층간의 데이터를 교환하기 위한 오브젝트 / DB와 자바의 
	  데이터타입은 실제로는 같지 않음, 자바에서 DB의 데이터를 사용하기 위해서 데이터 변환을 하기 위한 클래스 객체
-->


<% request.setCharacterEncoding("utf-8"); %>

<%
/* request 내장객체를 사용하여 넘겨받은 데이터를 하나씩 꺼냄 */
	String productId = request.getParameter("productId");
	String name = request.getParameter("name");
	String unitPrice = request.getParameter("unitPrice");
	String description = request.getParameter("description");
	String manufacturer = request.getParameter("manufacturer");
	String category = request.getParameter("category");
	String unitsInStock = request.getParameter("unitsInStock");
	String condition = request.getParameter("condition");

	/* 넘겨받은 unitPrice가 문자열로 되어 있으며, Product.java의 unitPrice는 정수형 타입이므로
		데이터 타입을 변경해야 함 */
	Integer price;
	
	if (unitPrice.isEmpty() || unitPrice.equals(""))
		price = 0;
	else
		price = Integer.valueOf(unitPrice);
		
	long stock;
	
	if (unitsInStock.isEmpty())
		stock = 0;
	else
		stock = Long.valueOf(unitsInStock);
	/* ProductRepository 클래스 타입의 변수 dao에 싱글톤 방식으로 ProductRepository 클래스
		내부에서 생성된 객체를 대입 */	
	ProductRepository dao = ProductRepository.getInstance();
	
	/* Product 클래스 타입의 객체 생성 */
	Product newProduct = new Product();
	newProduct.setProductId(productId);
	newProduct.setPname(name);
	newProduct.setUnitPrice(price);
	newProduct.setDescription(description);
	newProduct.setManufacturer(manufacturer);
	newProduct.setCategory(category);
	newProduct.setUnitsInStock(stock);
	newProduct.setCondition(condition);

	dao.addProduct(newProduct);
	
	// 데이터 처리 부분은 현재 파일인 processAddProduct.jsp 파일에서 진행하고 
	// 데이터가 추가된 화면은 products.jsp에서 보여주기 위해서 redirect함 
	response.sendRedirect("products.jsp");
	
 %>	
	