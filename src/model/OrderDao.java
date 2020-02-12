package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import mall.MyCartList;
import mall.ShoppingInfo;

//실상 OrderDao임
public class OrderDao extends SuperDao {
	
	//상세보기 1
	public Order SelectDataByPk(int oid) {
		Connection conn = null ;
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		String sql = " select * from orders " ; 
		sql += " where oid = ? " ; 
		Order order = null ;
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setInt(1, oid);
			rs = pstmt.executeQuery() ;
			
			if (rs.next()) {
				order = new Order();
				
				order.setMid(rs.getString("mid"));
				order.setOid(rs.getInt("oid"));
				order.setOrderdate((String.valueOf(rs.getString("orderdate"))));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null){rs.close();}
				if(pstmt != null){pstmt.close();}
				if(conn != null){conn.close();}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return order;
	}
	
	//상세보기 2
	public List<ShoppingInfo> ShowDetail(int oid) {
		Connection conn = null ;
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		String sql = "select p.pnum pnum, p.pname pname, od.qty, p.price, p.point, p.image " ; 
		sql += " from ( orders o inner join orderdetails od  ";
		sql += " on o.oid=od.oid ) inner join products p ";
		sql += " on od.pnum = p.pnum and o.oid = ? "; 

		List<ShoppingInfo> lists = new ArrayList<ShoppingInfo>();
		
		try {
			conn = super.getConnection() ;
			
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setInt(1, oid);
			rs = pstmt.executeQuery() ;
			
			while (rs.next()) {
				ShoppingInfo shopinfo = new ShoppingInfo();

				shopinfo.setPname(rs.getString("image"));
				shopinfo.setPname(rs.getString("pname"));
				shopinfo.setPnum(rs.getInt("pnum"));			
				shopinfo.setPoint(rs.getInt("point"));
				shopinfo.setPrice(rs.getInt("price"));
				shopinfo.setQty(rs.getInt("qty"));
				
				lists.add(shopinfo);
			}
			
			conn.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null){rs.close();}
				if(pstmt != null){pstmt.close();}
				if(conn != null){conn.close();}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return lists;
	}
	
	//최근 날짜 순으로 주문내역 출력
	//아이디를 매칭해 주문내역을 찾아주는 메소드
	public List<Order> orderMall(String mid) {
		Connection conn = null ;
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		String sql = " select * from orders " ; 
		sql += " where mid = ? order by oid desc" ; 
		
		List<Order> lists = new ArrayList<Order>();
		
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery() ;
			
			while (rs.next()) {
				Order order = new Order();
				
				order.setOid(rs.getInt("oid"));
				order.setMid(rs.getString("mid"));
				order.setOrderdate(String.valueOf(rs.getString("orderdate")));
				
				lists.add(order);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null){rs.close();}
				if(pstmt != null){pstmt.close();}
				if(conn != null){conn.close();}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return lists;
	}
	
	
	public int calculate(Member loginfo, MyCartList mycart, int totalPoint) {
		Connection conn = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		PreparedStatement pstmt4 = null;
		PreparedStatement pstmt5 = null;
		
		ResultSet rs2 = null;	//주문 시퀀스 번호 구하기
		
		int cnt = -1; 	//실패
		
		try {
			conn = super.getConnection();
			conn.setAutoCommit(false);
			//여기에 할 일 명시
			//step1. 주문 테이블에 데이터 추가
			String sql1 = " insert into orders(oid, mid, orderdate) ";
			sql1 += " values(seqoid.nextval, ?, sysdate) ";
			
			pstmt1 = conn.prepareStatement(sql1);
			pstmt1.setString(1, loginfo.getMid());
			cnt = pstmt1.executeUpdate();
			
			
			//step2. 방금 들어간 주문의 시퀀스 번호 구하기
			String sql2 = " select max(oid) as oid from orders ";
			
			pstmt2 = conn.prepareStatement(sql2);
			rs2 = pstmt2.executeQuery();
			
			int maxoid = 0;	//송장 번호
			
			if(rs2.next()) {
				maxoid = rs2.getInt("oid");
			}
			System.out.println("maxoid : "+maxoid);
			
			//장바구니 정보를 map(num, qty)에 담고, 다시 set(num)에 담는다
			Map<Integer, Integer> maplists = mycart.GetAllOrderLists();
			Set<Integer> keylist = maplists.keySet();
			
			String sql3 = " update products set stock = stock - ? ";
			sql3 += " where pnum = ? ";
			pstmt3 = conn.prepareStatement(sql3);
			
			String sql4 = " insert into orderdetails(oid, pnum, qty) ";
			sql4 += " values(?, ?, ?) ";
			pstmt4 = conn.prepareStatement(sql4);
			
			//반복문
			for(Integer pnum : keylist ) {
				//step3. 상품의 재고 수량 감소
				
				//pnum이랑 한 쌍인 qty를 불러온다
				Integer qty = maplists.get(pnum);
				
				pstmt3.setInt(1, qty);
				pstmt3.setInt(2, pnum);
				cnt = pstmt3.executeUpdate();
				
				//step4. 주문 상세 테이블에
				pstmt4.setInt(1, maxoid);	//주문번호가 oid...!
				pstmt4.setInt(2, qty);
				pstmt4.setInt(3, pnum);
				cnt = pstmt4.executeUpdate();
				
				System.out.println(qty);
			}
			
			//step5. 회원 마일리지 적립 
			String sql5 = " update members set mpoint = mpoint + ? ";
			sql5 += " where id = ? ";
			pstmt5 = conn.prepareStatement(sql5);
			
			pstmt5.setInt(1, totalPoint);
			pstmt5.setString(2, loginfo.getId());
			
			cnt = pstmt5.executeUpdate();

			conn.commit();
		} catch (Exception e) {
			e.printStackTrace();	//꼭!! 안 쓰면 에러메시지 안 뜸!
			try {
				cnt = -1;
				conn.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();	//
			}
		} finally {
			try {
				if(rs2 != null) {rs2.close();}
				if(pstmt1 != null) {pstmt1.close();}
				if(pstmt2 != null) {pstmt2.close();}
				if(pstmt3 != null) {pstmt3.close();}
				if(pstmt4 != null) {pstmt4.close();}
				if(pstmt5 != null) {pstmt5.close();}
				if(conn != null) {conn.close();}
			} catch (Exception e2) {
				e2.printStackTrace();	//
			}
		}
		return cnt;
	}
	
}
