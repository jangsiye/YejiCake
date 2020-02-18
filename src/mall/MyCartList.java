package mall;

import java.util.HashMap;
import java.util.Map;

//장바구니 빈 겸 Dao
//카트 클래스 : 장바구니에 담거나, 빼기, 요금계산 등을 수행할 때 사용할 클래스
public class MyCartList {
	//상품번호, 담은갯수를 저장할 장바구니 객체 (map 객체)
	private Map<Integer, Integer> orderlists = null;
	private String remark;
	
	//생성자에서 장바구니 객체를 초기화해줌
	public MyCartList() {	//새 카트 준비
		orderlists = new HashMap<Integer, Integer>();
		this.remark = "";
	}
	
	//계산 후 장바구니 비워줌
	public void RemoveAllProductInfo() {
		orderlists.clear();	//clear() : 객체 비워주는 메소드
		this.remark = "";
	}
	
	//장바구니 보여줌 : remark는 gettter, setter로 따로 호출할 거임
	public Map<Integer, Integer> GetAllOrderLists() {
		return this.orderlists;
	}
	
	//상품 수량 변경 (장바구니 업데이트)
	public void EditOrder(int key, int stock, String remark) {
		this.AddOrder(key, stock, remark);
	}
	
		
	//레터링 수정
	public void EditRemark(String remark) {
		this.remark=remark;
	}
	
	//구매 목록에서 삭제
	public void DeleteOrder(int key) {
		orderlists.remove(key);	// remove(key) : map에서 뺄 때
		this.remark = "";
	}
	
	//상품 장바구니에 추가
	public void AddOrder(int key, int stock, String remark) {
		
		//기존에 있으면 수량을 누적시키고, 없으면 새로 추가한다
		//요청사항은 새로운 걸로 변경함
		if (orderlists.containsKey(key)) {
			orderlists.put(key, orderlists.get(key) + stock);
			this.remark=remark;
		} else {
			orderlists.put(key, stock);
			this.remark=remark;
		}
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
}
