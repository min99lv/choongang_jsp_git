package och11;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import jakarta.security.auth.message.callback.PrivateKeyCallback.Request;

public class MemberDao {
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

	public int insert(MemberDto member) throws SQLException {
		Connection conn = null;
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "insert into scott.member1 (id, password, name, reg_date) values (?, ?, ?, sysdate)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return result;

	}

	// RESULT 1 id, password 같을때
	// 0 ID는 같고 password x
	// -1 ID는
	public int check(String id, String password) throws SQLException {
		Connection conn = null;
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select password from member1 where id=?" ;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
		//	파라미터 설정: pstmt.setString(1, id);을 
		//	사용하여 첫 번째 매개변수(첫 번째 물음표 ?)를 id 변수의 값으로 설정합니다.
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
		//	데이터 추출:  String dbPassword = rs.getString(1);
		//               을 사용하여 첫 번째 컬럼(password)의 데이터를 가져옵니다.
		//             	 여기서 1은 컬럼 인덱스를 의미합니다.
				//String dbPassword = rs.getString(password);
				String dbPassword = rs.getString(1);
				if (dbPassword.equals(password))
					result = 1;
				else
					result = 0;
			} else
				result = -1;
		} catch (SQLException e) {
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
