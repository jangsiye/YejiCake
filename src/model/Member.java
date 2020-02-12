package model;

public class Member {
	private String name;
	private String mid;
	private String password;
	private String phone;
	private String address;
	private int mpoint;
	
	public Member() {
	}

	public Member(String name, String mid, String password, String gender, String phone, String address, int mpoint) {
		super();
		this.name = name;
		this.mid = mid;
		this.password = password;
		this.phone = phone;
		this.address = address;
		this.mpoint = mpoint;
	}

	@Override
	public String toString() {
		return "Member [name=" + name + ", mid=" + mid + ", password=" + password + ", phone=" + phone + ", address="
				+ address + ", mpoint=" + mpoint + "]";
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getMpoint() {
		return mpoint;
	}

	public void setMpoint(int mpoint) {
		this.mpoint = mpoint;
	}

	
}
