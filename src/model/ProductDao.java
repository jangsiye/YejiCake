package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.oreilly.servlet.MultipartRequest;

public class ProductDao extends SuperDao {

	public ProductDao() {
		
	}
	
	public int InsertData(MultipartRequest mr) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql =" insert into products(pnum, pname, price, point, content, image, hit, stock)";
		sql += " values(seqboard.nextval, ?, ?, ?, ?, ?, 0, ?) ";
		int cnt = -1;
		try {
			conn = super.getConnection();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mr.getParameter("pname")); 
			pstmt.setString(2, mr.getParameter("price"));
			pstmt.setString(3, mr.getParameter("point"));
			pstmt.setString(4, mr.getParameter("content"));
			pstmt.setString(5, mr.getFilesystemName("image"));
			pstmt.setString(6, mr.getParameter("stock"));
			
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
		String sql = " update boards set pname=?, price=?, point=?, content=?, image=?, hit=?, stock=? ";
		sql += " where pnum = ? ";
		int cnt = -1;
		
		try {
			conn = super.getConnection();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bean.getPname());
			pstmt.setInt(2, bean.getPrice());
			pstmt.setInt(3, bean.getPoint());
			pstmt.setString(4, bean.getContent());
			pstmt.setString(5, bean.getImage());
			pstmt.setInt(6, bean.getHit());
			pstmt.setInt(7, bean.getStock());
			pstmt.setInt(8, bean.getPnum());
			

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

	public int DeleteData(int pnum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = " delete from products ";
		sql += " where pnum=?";
		int cnt = -1;
		
		try {
			conn = super.getConnection();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, pnum);
			
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

	public Product SelectByPk(int pnum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " select * from products ";
		sql += " where pnum=? ";
		Product product = null;
		
		try {
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, pnum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				product = new Product();
				
				product.setPname(rs.getString("pname"));
				product.setPrice(rs.getInt("price"));
				product.setPoint(rs.getInt("point"));				
				product.setContent(rs.getString("content"));
				product.setImage(rs.getString("image"));
				product.setHit(rs.getInt("hit"));
				product.setPnum(rs.getInt("pnum"));
				product.setPnum(rs.getInt("stock"));

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
				
				product.setPname(rs.getString("pname"));
				product.setPrice(rs.getInt("price"));
				product.setPoint(rs.getInt("point"));				
				product.setContent(rs.getString("content"));
				product.setImage(rs.getString("image"));
				product.setHit(rs.getInt("hit"));
				product.setPnum(rs.getInt("pnum"));
				product.setPnum(rs.getInt("stock"));
				
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
		String sql = " select pnum, pname, price, point, content, image, hit, stock";
		sql += " from ( select pnum, pname, price, point, content, image, hit, stock rank() over(order by hit desc) as ranking from products) ";
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
				
				product.setPname(rs.getString("pname"));
				product.setPrice(rs.getInt("price"));
				product.setPoint(rs.getInt("point"));				
				product.setContent(rs.getString("content"));
				product.setImage(rs.getString("image"));
				product.setHit(rs.getInt("hit"));
				product.setPnum(rs.getInt("pnum"));
				product.setPnum(rs.getInt("stock"));
				
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

