package dao;

import java.util.ArrayList;

import dto.Product;

public class ProductRepository {
	
		private ArrayList<Product> listOfProducts = new ArrayList<Product>();
		private static ProductRepository instance = new ProductRepository();
		
//		싱글톤 패턴 사용
/*		
 * 싱글톤 : 프로그램 상에서단 하나의 객체만 생성하여 모두 공유하여 사용하는 방식, 
 	클래스 내부에서 private 접근 제어자를 사용하여 외부에서는 해당 클래스의 객체를 생성할 수 없도록 하고, 
 	내부에서 해당 클래스의 객체를 생성하고 static으로 정적 멤버로 선언한 후 
 	getter를 통해서 내부에서 선언된 객체만 공유하여 사용하는 방법 
*/
		public static ProductRepository getInstance() {
			return instance;
		}
		
		public ProductRepository() {
			Product phone = new Product("P1234", "iPhone 6s", 800000);
			phone.setDescription("4.7-inch, 1334x750 Renina HD display, "
					+ "8-megapixel iSight Camera");
			phone.setCategory("Smart Phone");;
			phone.setManufacturer("Apple");
			phone.setUnitsInStock(1000);
			phone.setCondition("New");;
			
			Product notebook = new Product("P1235", "LG PC 그램", 1500000);
			notebook.setDescription("13.3-inch, IPS LED dsisplay, 5rd Generation Intel Cor processors");
			notebook.setCategory("Notebook");
			notebook.setManufacturer("LG");
			notebook.setUnitsInStock(1000);
			notebook.setCondition("Refurbished");
			
			Product tablet = new Product("pP1236", "Galaxy Tab S", 900000);
			tablet.setDescription("212.8*125.6*6.6mm, Super AMOLED display, Octa-Core porcessor");
			tablet.setCategory("Tablet");
			tablet.setManufacturer("Samsung");
			tablet.setUnitsInStock(1000);
			tablet.setCondition("Old");
			
			listOfProducts.add(phone);
			listOfProducts.add(notebook);
			listOfProducts.add(tablet);
		}
//		DB에 저장된 모든 데이터를 가져오기
		public ArrayList<Product> getAllProducts(){
			return listOfProducts;
		}
		
//		DB에 저장된 데이터 중 ,productId가 같은 데이터를 가져오기 
//		반환 타입을 Product 클래스 타입으로 설정 
		public Product getProductById( String productId) {
			Product productById = null; //Product 클래스 타입의 변수를 미리 선언, 빈 변수
			
//			DB의 크기 만큼 for문을 사용하여 DB전체의 데이터 중 상품아이디와 동일한 정보를 찾음 
			for(int i = 0; i < listOfProducts.size(); i++) {
//				listOfProduct에 저장된 상품정보를 하나씩 꺼내어 Product클래스 타입의 변수 product에 대입함 
				Product product = listOfProducts.get(i);
				
//				비교 3번
//				product 객체가 null이 아니고,
//				product 객체가 가지고 있는 상품id가 null이 아니며,
//				product 객체가 가지고 있는 상품id와 매개변수로 받아온 상품id가 모두 동일한지 비교
				if (product != null && product.getProductId() != null && product.getProductId().equals(productId)) {
//					product 객체를 for문 외부에 있는 Product 클래스 타입의 변수 productById 객체제 대입함 
					productById = product;
					break; //for문 중지 
				}
			}
			return productById;
		}
		
//		상품 목록에 데이터를 추가 
		public void addProduct(Product product) {
			listOfProducts.add(product);
		}
		

}
