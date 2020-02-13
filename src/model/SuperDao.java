package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SuperDao {
	//※ protected : 동일 패키지에 속하는 클래스와 하위 클래스 관계의 클래스에 의해 접근이 가능하다.
	protected String driver = "oracle.jdbc.driver.OracleDriver" ;
	protected String url = "jdbc:oracle:thin:@localhost:1521:xe" ;
	protected String id = "yejicake" ;
	protected String password = "oracle" ;	
	
	public SuperDao() {
		try {
			Class.forName(driver) ;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	protected Connection getConnection() {
		//접속 객체를 구해주는 메소드
		//Dao 내부의 각 메소드들이 나를 호출할 것임.
		Connection conn = null ;
		try {
			conn = DriverManager.getConnection(url, id, password);
		} catch (SQLException e) {			
			e.printStackTrace();
		}
		System.out.println( "접속 여부 : " + ( conn != null));
		return conn ;
	}
	
}
