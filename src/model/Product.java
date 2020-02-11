package model;

public class Product {
	private int num;
	private String name;
	private int price;
	private int point;
	private String content;
	private String image;
	private int hit;
	
	private int groupno;
	private int orderno;
	private int depth;
	
	public Product() {
		// TODO Auto-generated constructor stub
	}

	public Product(int num, String name, int price, int point, String content, String image, int hit) {
		super();
		this.num = num;
		this.name = name;
		this.price = price;
		this.point = point;
		this.content = content;
		this.image = image;
		this.hit = hit;
	}

	@Override
	public String toString() {
		return "Product [num=" + num + ", name=" + name + ", price=" + price + ", point=" + point + ", content="
				+ content + ", image=" + image + ", hit=" + hit + "]";
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getGroupno() {
		return groupno;
	}

	public void setGroupno(int groupno) {
		this.groupno = groupno;
	}

	public int getOrderno() {
		return orderno;
	}

	public void setOrderno(int orderno) {
		this.orderno = orderno;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}


	
}
