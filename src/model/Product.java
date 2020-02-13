package model;

public class Product {
	private int pnum;
	private String pname;
	private int price;
	private int point;
	private String content;
	private String image;
	private int hit;
	private int stock;
	private int category;
	private String image2;
	
	public Product() {
		// TODO Auto-generated constructor stub
	}

	public Product(int pnum, String pname, int price, int point, String content, String image, int hit, int stock,
			int category, String image2) {
		super();
		this.pnum = pnum;
		this.pname = pname;
		this.price = price;
		this.point = point;
		this.content = content;
		this.image = image;
		this.hit = hit;
		this.stock = stock;
		this.category = category;
		this.image2 = image2;
	}

	@Override
	public String toString() {
		return "Product [pnum=" + pnum + ", pname=" + pname + ", price=" + price + ", point=" + point + ", content="
				+ content + ", image=" + image + ", hit=" + hit + ", stock=" + stock + ", category=" + category
				+ ", image2=" + image2 + "]";
	}

	public int getCategory() {
		return category;
	}


	public void setCategory(int category) {
		this.category = category;
	}


	public String getImage2() {
		return image2;
	}


	public void setImage2(String image2) {
		this.image2 = image2;
	}


	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getPnum() {
		return pnum;
	}

	public void setPnum(int pnum) {
		this.pnum = pnum;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
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
	
}
