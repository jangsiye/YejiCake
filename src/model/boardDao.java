package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BoardDao extends SuperDao {
	public int ReplyData(Board bean) {
		Connection conn = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		
		String sql1 = " update sample set orderno = orderno + 1 "; 
		sql1 += " where groupno = ? and orderno > ? ";
		
		String sql2 = " insert into boards(no, subject, writer, password, content, regdate, groupno, orderno, depth) ";
		sql2 += " values(seqboard.nextval, ?, ?, ?, ?, sysdate, ?, ?, ?) ";
		int cnt = -1;
		try {
			conn = super.getConnection();
			conn.setAutoCommit(false);
			
			pstmt1 = conn.prepareStatement(sql1);
			pstmt1.setInt(1, bean.getGroupno());
			pstmt1.setInt(2, bean.getOrderno());
			
			cnt = pstmt1.executeUpdate();
			
			pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setString(1, bean.getSubject());
			pstmt2.setString(2, bean.getWriter());
			pstmt2.setString(3, bean.getPassword());
			pstmt2.setString(4, bean.getContent());
			
			pstmt2.setInt(5, bean.getGroupno());
			pstmt2.setInt(6, bean.getOrderno()+1);
			pstmt2.setInt(7, bean.getDepth()+1);

			
			cnt = pstmt2.executeUpdate();
		
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
				if(pstmt1 != null) {pstmt1.close();}
				if(pstmt2 != null) {pstmt2.close();}
				if(conn != null) {conn.close();}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return cnt;
	}

	public BoardDao() {
		
	}
	
	public int InsertData(Board bean) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql =" insert into boards(no, subject, writer, password, content, regdate, groupno, orderno, depth)";
		sql += " values(seqboard.nextval, ?, ?, ?, ?, sysdate, seqboard.currval, 0, 0, 0) ";
		int cnt = -1;
		try {
			conn = super.getConnection();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bean.getSubject());
			pstmt.setString(2, bean.getWriter());
			pstmt.setString(3, bean.getPassword());
			pstmt.setString(4, bean.getContent());
			
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

	public int UpdateData(Board bean) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = " update boards set subject=?, writer=?, password=?, content=?, regdate=?, groupno=?, orderno=?, depth=? ";
		sql += " where no=? ";
		int cnt = -1;
		
		try {
			conn = super.getConnection();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bean.getSubject());
			pstmt.setString(2, bean.getWriter());
			pstmt.setString(3, bean.getPassword());
			pstmt.setString(4, bean.getContent());
			pstmt.setString(5, bean.getRegdate());
			
			pstmt.setInt(6, bean.getGroupno());
			pstmt.setInt(7, bean.getOrderno());
			pstmt.setInt(8, bean.getDepth());
			
			pstmt.setInt(9, bean.getNo());

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

	public int DeleteData(int no) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = " delete from boards ";
		sql += " where no=?";
		int cnt = -1;
		
		try {
			conn = super.getConnection();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, no);
			
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
		String sql = " select count(*) as cnt from boards";
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

	public Board SelectByPk(int no) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " select * from boards ";
		sql += " where no=? ";
		Board board = null;
		
		try {
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board = new Board();
				
				board.setNo(rs.getInt("no"));
				board.setSubject(rs.getString("subject"));
				board.setWriter(rs.getString("writer"));
				board.setPassword(rs.getString("password"));
				board.setContent(rs.getString("content"));
				board.setRegdate(rs.getString("regdate"));
				
				board.setGroupno(rs.getInt("groupno"));
				board.setOrderno(rs.getInt("orderno"));
				board.setDepth(rs.getInt("depth"));
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
		return board;
	}

	public List<Board> SelectAll() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " select * from boards " ;
				
		List<Board> list = new ArrayList<Board>();
		
		try {
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Board board = new Board();
				
				board.setNo(rs.getInt("no"));
				board.setSubject(rs.getString("subject"));
				board.setWriter(rs.getString("writer"));
				board.setPassword(rs.getString("password"));
				board.setContent(rs.getString("content"));
				board.setRegdate(rs.getString("regdate"));
				
				board.setGroupno(rs.getInt("groupno"));
				board.setOrderno(rs.getInt("orderno"));
				board.setDepth(rs.getInt("depth"));
			
				list.add(board);
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

	public List<Board> SelectAll(int beginRow, int endRow) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " select no, subject, writer, password, content, regdate, groupno, orderno, depth";
		sql += " from ( select no, subject, writer, password, content, regdate, groupno, orderno, depth, rank() over(order by groupno desc, orderno asc, depth asc) as ranking ";
		sql += " from boards) ";
		sql += " where ranking between ? and ? ";
		
		List<Board> list = new ArrayList<Board>();
		
		try {
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, beginRow);
			pstmt.setInt(2, endRow);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Board board = new Board();
				
				board.setNo(rs.getInt("no"));
				board.setSubject(rs.getString("subject"));
				board.setWriter(rs.getString("writer"));
				board.setPassword(rs.getString("password"));
				board.setContent(rs.getString("content"));
				board.setRegdate(rs.getString("regdate"));
			
				board.setGroupno(rs.getInt("groupno"));
				board.setOrderno(rs.getInt("orderno"));
				board.setDepth(rs.getInt("depth"));
				
				list.add(board);
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

































