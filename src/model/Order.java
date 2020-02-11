package model;

public class Order {
	private String mid;
	private int oid;
	private String orderdate;
	
	public Order() {
		// TODO Auto-generated constructor stub
	}
	
	public Order(String mid, int oid, String orderdate) {
		super();
		this.mid = mid;
		this.oid = oid;
		this.orderdate = orderdate;
	}
	
	@Override
	public String toString() {
		return "Order [mid=" + mid + ", oid=" + oid + ", orderdate=" + orderdate + "]";
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	
	
}
