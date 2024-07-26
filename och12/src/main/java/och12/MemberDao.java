package och12;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.mysql.cj.Session;

// singleton + DBCP
public class MemberDao {
	private static MemberDao instance;

	private MemberDao() {

	}

	// Singleton
	public static MemberDao getInstance() {
		if (instance == null) {
			instance = new MemberDao();
		}
		return instance;
	}

	// DBCP
	private Connection getConnection() throws SQLException {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}

	public int check(String id, String passwd) throws SQLException {
		int result = 1;
		Connection conn = null;
		String sql = "select passwd from member2 where id=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println(id);
		System.out.println(passwd);

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id); // "id" 안된다 !
			rs = pstmt.executeQuery();
			System.out.println(result);

			if (rs.next()) {
				String dbpassword = rs.getString(1);
				if (dbpassword.equals(passwd)) {
					result = 1;
				} else {
					result = 0;
				}
			} else
				result = -1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			System.out.println(result);
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}

		return result;

	}

	public int insert(Member member) throws SQLException {
		int result = 0;
		Connection conn = null;
		// 컬럼명을 명시하지않으면 스키마의 순서대로 작성
		String sql = "insert into member2 values (?,?,?,?,?,sysdate)";
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPasswd());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getAddress());
			pstmt.setString(5, member.getTel());
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

	public int confirm(String id) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "select id from member2 where id=?";
		ResultSet rs = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			System.out.println(id);
			if (rs.next()) {
				result = 1;
			} else
				result = 0;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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

	public List<Member> list() throws SQLException {
		List<Member> list = new ArrayList<Member>();
		Connection conn = null;
		String sql = "select * from member2";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				do {
					Member member = new Member();
					member.setId(rs.getString(1));
					member.setPasswd(rs.getString(2));
					member.setName(rs.getString(3));
					member.setAddress(rs.getString(4));
					member.setTel(rs.getString(5));
					member.setReg_date(rs.getDate(6));
					list.add(member);
				} while (rs.next());

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}

		return list;
	}

	public Member select(String id) throws SQLException {
		Member member = new Member();
		Connection conn = null;
		String sql = "select * from member2 where id=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				member.setId(rs.getString(1));
				member.setPasswd(rs.getString(2));
				member.setName(rs.getString(3));
				member.setAddress(rs.getString(4));
				member.setTel(rs.getString(5));
				member.setReg_date(rs.getDate(6));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return member;
	}

	public int update(Member member) throws SQLException {
		int result = 0;
		Connection conn = null;
		String sql = "update member2 set passwd=?,name=?,address=?, tel=? where id=?";
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, member.getPasswd());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getAddress());
			pstmt.setString(4, member.getTel());
			pstmt.setString(5, member.getId());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}

		return result;
	}

	public int delete(String id, String passwd) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from member2 where id=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			if (check(id, passwd) == 1) {
				pstmt.setString(1, id);
				result = pstmt.executeUpdate();
				result = 1;
			} else if (check(id, passwd) == 0) {
				result = 0;
			} else {
				result = -1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (pstmt == null)
				pstmt.close();
			if (conn == null)
				conn.close();
		}
		return result;
	}
	
	/*
	 * 강사님 코드 
	 * int result = 0; 
	 * Connection conn = null; 
	 * result = check(id,passwd);
	 * if(result != 1) return result; 
	 * String sql = "delete from member2 where id=?";
	 * PreparedStatemente pstmt = null;
	 *  try { conn = getConnection(); 
	 *  pstmt = conn.prepareStatement(sql); 
	 *  pstmt.setString(1,id); 
	 *  result = pstmt.executeUpdate(); }
	 */
	

}
