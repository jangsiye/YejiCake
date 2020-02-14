//정렬할 때 널 체크하는 메소드
	public String checkNull(String i ) {
		if(i==null) {
			return "";
		} else {
			return i;
		}
	}
	
	//정렬 선택 기능
	public List<Member> SelectAll(int beginRow, int endRow, String ord) {

		Connection conn = null ;
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		String sql = "";
		
		List<Member> lists = new ArrayList<Member>();
		
        try {
        	conn = super.getConnection() ;
        	
            if (ord.equals("o_id")) {
            	sql += " select mid, name, password, phone, address, mpoint " ; 
        		sql += " from ( select mid, name, password, phone, address, mpoint, rank() over(order by mid) as ranking from members ) " ; 
        		sql += " where ranking between ? and ? " ; 
        		
        		pstmt = conn.prepareStatement(sql) ;
        		pstmt.setInt(1, beginRow);
    			pstmt.setInt(2, endRow);
 
            } else if (ord.equals("o_name")) {
            	sql += " select mid, name, password, phone, address, mpoint " ; 
        		sql += " from ( select mid, name, password, phone, address, mpoint, rank() over(order by name) as ranking from members ) " ; 
        		sql += " where ranking between ? and ? " ; 
        		
        		pstmt = conn.prepareStatement(sql) ;
        		pstmt.setInt(1, beginRow);
    			pstmt.setInt(2, endRow);
 
            } else if (ord.equals("o_point")) {
            	sql += " select mid, name, password, phone, address, mpoint " ; 
        		sql += " from ( select mid, name, password, phone, address, mpoint, rank() over(order by mpoint desc) as ranking from members ) " ; 
        		sql += " where ranking between ? and ? " ; 
        		
        		pstmt = conn.prepareStatement(sql) ;
        		pstmt.setInt(1, beginRow);
    			pstmt.setInt(2, endRow);
 
            } else {	//ord가 ""가 들어오면 mid 순으로 출력해주기
            	sql += " select mid, name, password, phone, address, mpoint " ; 
        		sql += " from ( select mid, name, password, phone, address, mpoint, rank() over(order by mid desc) as ranking from members ) " ; 
        		sql += " where ranking between ? and ? " ; 
        		
        		pstmt = conn.prepareStatement(sql) ;
        		pstmt.setInt(1, beginRow);
    			pstmt.setInt(2, endRow);
            }

            rs = pstmt.executeQuery(); 
			
			while(rs.next()) {
				Member member = new Member();
				member.setMpoint( rs.getInt("mpoint") ); 
				member.setMid( rs.getString("mid") );
				member.setName( rs.getString("name") );
				member.setPassword( rs.getString("password") );
				member.setPhone( rs.getString("phone") ); 
				member.setAddress( rs.getString("address") ); 
				
				lists.add(member) ;
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
		return lists;
	}
