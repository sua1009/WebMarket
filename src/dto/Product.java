package dto;

import java.io.Serializable;

//	자바빈즈 생성 규칙 
//  1. Serializable 인터 페이스 상속 구현
//  2. 멤버 변수의 접근 제한자를 private로 사용
//  3. 멤버 변수에 모두 getter/setter 적용
//  4. 기본 생성자가 반드시 존재 

// 데이터베이스에서 테이터를 저장하거나 혹은 가져올 때 사용하는 데이터 타입을 클래스를 통해서 규격화함
public class Product implements Serializable{
	
	private static final long serialVersionUID = -4274700572038677000L;
	
	private String productId; //아이디
	private String pname;	//상품명
	private Integer unitPrice;	//가격
	private String description;	//설명	
	private String manufacturer;	//제조사
	private String category;	//분류
	private long unitsInStock;	//재고수
	private String condition;	//신상품 or 중고품 or 재생품 
	private String filename;
	
//	기본 생성자
	public Product() {
		super();
	}
	
//	productId, pname, unitPrice를 매개변수로 가지는 생성자)
	public Product(String productId, String pname, Integer unitPrice) {
		this.productId = productId;
		this.pname = pname;
		this.unitPrice = unitPrice;
	}
	
	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public Integer getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public long getUnitsInStock() {
		return unitsInStock;
	}

	public void setUnitsInStock(long unitsInStock) {
		this.unitsInStock = unitsInStock;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}


	
	
}
