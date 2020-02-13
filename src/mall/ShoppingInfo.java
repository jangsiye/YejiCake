package mall;

//쇼핑 빈 클래스
//고객이 주문한 상품 1개에 정보를 저장하고 있는 클래스
public class ShoppingInfo {
	private int pnum;	//상품번호
	private String pname;	//상품명
	private int qty;	//주문 수량
	private int price;	//상품 가격
	private String image;	//상품 이미지
	private int point;	//포인트
	private String remark;	//비고(요청사항)
	
	//생성자
	public ShoppingInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ShoppingInfo(int pnum, String pname, int qty, int price, String image, int point, String remark) {
		super();
		this.pnum = pnum;
		this.pname = pname;
		this.qty = qty;
		this.price = price;
		this.image = image;
		this.point = point;
		this.remark = remark;
	}
	
	//toString 오버라이딩
	@Override
	public String toString() {
		return "ShoppingInfo [pnum=" + pnum + ", pname=" + pname + ", qty=" + qty + ", price=" + price + ", image="
				+ image + ", point=" + point + ", remark=" + remark + "]";
	}

	//getter setter
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
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
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
}
