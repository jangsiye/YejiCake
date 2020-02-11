package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDao extends SuperDao {

	public ProductDao() {
		
	}
	
	public int InsertData(Product bean) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql =" insert into products(pnum, pname, price, point, content, image, hit)";
		sql += " values(seqboard.nextval, ?, ?, ?, ?, ?, ?) ";
		int cnt = -1;
		try {
			conn = super.getConnection();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bean.getName());
			pstmt.setInt(2, bean.getPrice());
			pstmt.setInt(3, bean.getPoint());
			pstmt.setString(4, bean.getContent());
			pstmt.setString(5, bean.getImage());
			pstmt.setInt(6, bean.getHit());

			cnt = pstmt.executeUpdate();
		
			conn.commit();
		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		} finally {
			try {
				if(pstmt != null) {pstmt.close();}
				if(conn != null) {conn.close();}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return cnt;
	}

	public int UpdateData(Product bean) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = " update boards set pname=?, price=?, point=?, content=?, image=?, hit=? ";
		sql += " where pnum = ? ";
		int cnt = -1;
		
		try {
			conn = super.getConnection();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bean.getName());
			pstmt.setInt(2, bean.getPrice());
			pstmt.setInt(3, bean.getPoint());
			pstmt.setString(4, bean.getContent());
			pstmt.setString(5, bean.getImage());
			pstmt.setInt(6, bean.getHit());
			pstmt.setInt(7, bean.getNum());


			cnt = pstmt.executeUpdate();
			
			conn.commit();
					
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (Exception e2) {
				e.printStackTrace();
			}
		} finally {
			try {
				if(pstmt != null) {pstmt.close();}
				if(conn != null) {conn.close();}
			} catch (Exception e2) {
				e2.printStackTrace();
			}	
		}
		return cnt;
	}

	public int DeleteData(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = " delete from products ";
		sql += " where pnum=?";
		int cnt = -1;
		
		try {
			conn = super.getConnection();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			cnt = pstmt.executeUpdate();
			
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} finally {
			try {
				if(pstmt != null) {pstmt.close();}
				if(conn != null) {conn.close();}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return cnt;
		
	}

	public int GetCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " select count(*) as cnt from products";
		int cnt = -1;
		
		try {
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cnt = rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) {rs.close();}
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return cnt;
	}

	public Product SelectByPk(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " select * from products ";
		sql += " where pnum=? ";
		Product product = null;
		
		try {
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				product = new Product();
				
				product.setName(rs.getString("pname"));
				product.setPrice(rs.getInt("price"));
				product.setPoint(rs.getInt("point"));				
				product.setContent(rs.getString("content"));
				product.setImage(rs.getString("image"));
				product.setHit(rs.getInt("hit"));
				product.setNum(rs.getInt("pnum"));

			}
			
		} catch (Exception e) {
			e.printStackTrace();
			} finally {
				try {
					if(rs != null) {rs.close();}
					if(pstmt != null) {pstmt.close();}
					if(conn != null) {conn.close();}
				} catch (Exception e2) {
					e2.printStackTrace();
				}
				
			}
		return product;
	}

	public List<Product> SelectAll() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " select * from products " ;
				
		List<Product> list = new ArrayList<Product>();
		
		try {
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Product product = new Product();
				
				product.setName(rs.getString("pname"));
				product.setPrice(rs.getInt("price"));
				product.setPoint(rs.getInt("point"));				
				product.setContent(rs.getString("content"));
				product.setImage(rs.getString("image"));
				product.setHit(rs.getInt("hit"));
				product.setNum(rs.getInt("pnum"));
				
				list.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
				if(conn != null) {conn.close();}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return list;
	}

	public List<Product> SelectAll(int beginRow, int endRow) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " select pnum, pname, price, point, content, image, hit";
		sql += " from ( select pnum, pname, price, point, content, image, hit rank() over(order by hit desc) as ranking from products) ";
		sql += " where ranking between ? and ? ";
		
		List<Product> list = new ArrayList<Product>();
		
		try {
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, beginRow);
			pstmt.setInt(2, endRow);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Product product = new Product();
				
				product.setName(rs.getString("pname"));
				product.setPrice(rs.getInt("price"));
				product.setPoint(rs.getInt("point"));				
				product.setContent(rs.getString("content"));
				product.setImage(rs.getString("image"));
				product.setHit(rs.getInt("hit"));
				product.setNum(rs.getInt("pnum"));
				
				list.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
				if(conn != null) {conn.close();}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return list;
	}
}

