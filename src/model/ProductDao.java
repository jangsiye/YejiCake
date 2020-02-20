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
	
	//검색할 때 널 체크하는 메소드
	public String checkNull(String i ) {
		if(i==null) {
			return "";
		} else {
			return i;
		}
	}
	
	//검색기능 : 검색 안 하면 전체 출력해줘야함
	public List<Product> SelectAll(String col, String word) {
		
		Connection conn = null ;
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		String sql = "";
		
        List<Product> list = new ArrayList<Product>();
		
        try {
        	conn = super.getConnection() ;
        	
            if (col.equals("all")) {
                sql +=" select * ";
                sql +=" from products ";
                sql +=" where pname LIKE ? OR content LIKE ?";
                sql +=" order by pnum DESC";
                
                pstmt = conn.prepareStatement(sql) ;
                pstmt.setString(1, "%" + word + "%");
                pstmt.setString(2, "%" + word + "%");

 
            } else if (col.equals("s_pname")) {
                sql +=" select * ";
                sql +=" from products";
                sql +=" where pname LIKE ?";
                sql +=" order by pnum DESC";
                
                pstmt = conn.prepareStatement(sql) ;
                pstmt.setString(1, "%" + word + "%");
                
            } else if (col.equals("scontent")) {
                sql +=" select * ";
                sql +=" from products ";
                sql +=" where content LIKE ?";
                sql +=" order by pnum DESC";
                pstmt = conn.prepareStatement(sql) ;
                pstmt.setString(1, "%" + word + "%");
 
            } else if (col.equals("stag")) {
                sql +=" select * ";
                sql +=" from products ";
                sql +=" where tag1 LIKE ? OR tag2 LIKE ? OR tag3 LIKE ?";
                sql +=" order by pnum DESC";
                pstmt = conn.prepareStatement(sql) ;
                pstmt.setString(1, "%" + word + "%");
                pstmt.setString(2, "%" + word + "%");
                pstmt.setString(3, "%" + word + "%");
                
            } else {	//col이 ""로 들어오면 전체를 출력해주기
                sql +=" select * ";
                sql +=" from products ";
                sql +=" order by pnum DESC";
                pstmt = conn.prepareStatement(sql) ;
            }
            
            rs = pstmt.executeQuery(); 

            while (rs.next()) {
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
				product.setTag1(rs.getString("tag1"));
				product.setTag2(rs.getString("tag2"));
				product.setTag3(rs.getString("tag3"));
				
                list.add(product);

            }
 
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	try {
				if( rs != null ){rs.close();}
				if( pstmt != null ){pstmt.close();}
				if( conn != null ){conn.close();}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
        }
 
        return list;
	}
	
	//조회수 증가시켜주는 메소드
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
		String sql =" insert into products(pnum, pname, price, point, content, image, hit, stock, image2, category, tag1, tag2, tag3)";
		sql += " values(seqpnum.nextval, ?, ?, ?, ?, ?, 0, ?, ?, ?, ?, ?, ?) ";
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
			pstmt.setString(9, mr.getParameter("tag1"));
			pstmt.setString(10, mr.getParameter("tag2"));
			pstmt.setString(11, mr.getParameter("tag3"));

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
		String sql = " update products set pname=?, price=?, point=?, content=?, hit=?, stock=?, tag1=?, tag2=?, tag3=? ";
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
			pstmt.setInt(5, bean.getHit());
			pstmt.setInt(6, bean.getStock());
			pstmt.setString(7, bean.getTag1());
			pstmt.setString(8, bean.getTag2());
			pstmt.setString(9, bean.getTag3());
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
				product.setTag1(rs.getString("tag1"));
				product.setTag2(rs.getString("tag2"));
				product.setTag3(rs.getString("tag3"));
				
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
		String sql = " select * from products order by category " ;
				
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
				product.setTag1(rs.getString("tag1"));
				product.setTag2(rs.getString("tag2"));
				product.setTag3(rs.getString("tag3"));
				
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
				product.setTag1(rs.getString("tag1"));
				product.setTag2(rs.getString("tag2"));
				product.setTag3(rs.getString("tag3"));
				
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
		String sql = " select pnum, pname, price, point, content, image, hit, stock, image2, category, tag1, tag2, tag3 ";
		sql += " from ( select pnum, pname, price, point, content, image, hit, stock, image2, category, tag1, tag2, tag3 rank() over(order by pnum desc) as ranking from products) ";
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
				product.setTag1(rs.getString("tag1"));
				product.setTag2(rs.getString("tag2"));
				product.setTag3(rs.getString("tag3"));
				
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

