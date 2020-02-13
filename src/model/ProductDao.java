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
	
	public int UpHit(int pnum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = " update products set hit = hit + 1 where pnum = ?";
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
	
	public int InsertData(MultipartRequest mr) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql =" insert into products(pnum, pname, price, point, content, image, hit, stock, image2, category)";
		sql += " values(seqpnum.nextval, ?, ?, ?, ?, ?, 0, ?, ?, ?) ";
		int cnt = -1;
		try {
			conn = super.getConnection();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mr.getParameter("pname")); 
			pstmt.setInt(2, Integer.parseInt(mr.getParameter("price")));
			pstmt.setInt(3, Integer.parseInt(mr.getParameter("point")));
			pstmt.setString(4, mr.getParameter("content"));
			pstmt.setString(5, mr.getFilesystemName("image"));
			pstmt.setInt(6, Integer.parseInt(mr.getParameter("stock")));
			pstmt.setString(7, mr.getFilesystemName("image2"));
			pstmt.setInt(8, Integer.parseInt(mr.getParameter("category")));
			
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
		String sql = " update products set pname=?, price=?, point=?, content=?, image=?, hit=?, stock=?, image2=?, category=? ";
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
			pstmt.setString(8, bean.getImage2());
			pstmt.setInt(9, bean.getCategory());
			pstmt.setInt(10, bean.getPnum());
			

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
				product.setStock(rs.getInt("stock"));
				product.setCategory(rs.getInt("category"));
				product.setImage2(rs.getString("image2"));
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

	//상품 전체를 읽어오는 메소드
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
				product.setStock(rs.getInt("stock"));
				product.setCategory(rs.getInt("category"));
				product.setImage2(rs.getString("image2"));
				
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
	
	//상품 중 케이크만, hit가 높은 순으로 정렬해서 데이터 가져오는 메소드
	public List<Product> SelectAll_Hit() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " select * from products where category = 1 order by hit desc" ;
				
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
				product.setStock(rs.getInt("stock"));
				product.setCategory(rs.getInt("category"));
				product.setImage2(rs.getString("image2"));
				
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

	//페이징 처리도 해주면서 pnum이 큰(신메뉴 순)으로 정렬해주는 메소드
	public List<Product> SelectAll(int beginRow, int endRow) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " select pnum, pname, price, point, content, image, hit, stock, image2, category ";
		sql += " from ( select pnum, pname, price, point, content, image, hit, stock, image2, category rank() over(order by pnum desc) as ranking from products) ";
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
				product.setStock(rs.getInt("stock"));
				
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

