package och15_ajax;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import jakarta.security.auth.message.callback.PrivateKeyCallback.Request;

// Singleton + DBCP
public class MemberDao {
	// Singleton ---> Resource 절감
	private static MemberDao instance; // 인스턴스를 저장하는 변수 스태틱 변수로 선언 되었기때문에 클래스 내에서 사용 가능

	// Default
	private MemberDao() {
	}

	public static MemberDao getInstance() {
		if (instance == null) { // instance가 null이면 새 인스턴스 생성 아니면 있던거 사용
			instance = new MemberDao();
		}
		return instance;
	}

	// DBCP
	private Connection getConnection() throws SQLException {
		Connection conn = null; // return을 하기위해 전역변수 선언
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			System.out.println("e.getMessage()-->" + e.getMessage());
		}
		return conn;
	}

	public int confirm(String id) throws SQLException {
		int result = 1;
		// member1 if Exist 1
		// 없으면 0
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select id from member1 where id =?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next())
				result = 1;
			else
				result = 0;

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}

		return result;
	}

}
