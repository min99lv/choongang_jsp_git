package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import jakarta.security.auth.message.callback.PrivateKeyCallback.Request;

// singleton & dbcp
public class BoardDao {
	private static BoardDao instance;

	// 생성자
	private BoardDao() {

	}

	// Singleton
	public static BoardDao getInstance() {
		if (instance == null) {
			instance = new BoardDao();
		}
		return instance;
	}

	private Connection getConnection() {
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

	public int getTotalcnt() throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int totCnt = 0;
		String sql = "select count(*) from board";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				// 쿼리문의 첫번째 필드를 integer형으로 받겠다
				totCnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}

			if (conn != null) {
				conn.close();
			}
		}

		return totCnt;
	}

	public List<Board> boardList(int startRow, int endRow) throws SQLException {
		ArrayList<Board> list = new ArrayList<Board>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM" + "(SELECT rownum rn, a.*FROM"
				+ " (SELECT *FROM board ORDER BY ref desc,re_step) a)" + "WHERE rn BETWEEN ? AND ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			System.out.println(rs);
			while (rs.next()) {
				Board board = new Board();

				board.setNum(rs.getInt("num"));
				board.setWriter(rs.getString("writer"));
				board.setSubject(rs.getString("subject"));
				board.setEmail(rs.getString("email"));
				board.setReadcount(rs.getInt("readcount"));
				board.setIp(rs.getString("ip"));
				board.setRef(rs.getInt("ref"));
				board.setRe_level(rs.getInt("re_level"));
				board.setRe_step(rs.getInt("re_step"));
				board.setReg_date(rs.getDate("reg_date"));
				list.add(board);
			}
			;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}

			if (conn != null) {
				conn.close();
			}
		}

		return list;
	}

	public Board select(int num) throws SQLException {
		Board board = new Board();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from board where num=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				board.setNum(rs.getInt(1));
				board.setWriter(rs.getString(2));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString(4));
				board.setEmail(rs.getString(5));
				board.setReadcount(rs.getInt(6));
				board.setPasswd(rs.getString(7));
				board.setRef(rs.getInt(8));
				board.setRe_step(rs.getInt(9));
				board.setRe_level(rs.getInt(10));
				board.setIp(rs.getString(11));
				board.setReg_date(rs.getDate(12));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}

			if (conn != null) {
				conn.close();
			}
		}

		return board;
	}

	public void readCount(int num) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update board set readcount=readcount+1  where num=?";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (pstmt != null) {
			pstmt.close();
		}

		if (conn != null) {
		}
	}

	public int update(Board board) throws SQLException {
		int result = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update board set subject=?,writer=?, email=?, passwd=?,content=?" + "where num =?";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, board.getSubject());
			pstmt.setString(2, board.getWriter());
			pstmt.setString(3, board.getEmail());
			pstmt.setString(4, board.getPasswd());
			pstmt.setString(5, board.getContent());
			pstmt.setInt(6, board.getNum());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}

			if (conn != null) {
				conn.close();
			}
		}

		return result;
	}

	public int insert(Board board) throws SQLException {
		int num = board.getNum(); // num값을 가져온다
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// 신규글 pk 로직
		String sql1 = "select nvl(max(num),0) from board";
		// 신규글 공용 로직
		String sql3 = "insert into board values(?,?,?,?,?,?,?,?,?,?,?,sysdate)";
		// 신규글 + 댓글 공용 로직 = 홍해의 기적
		String sql2 = "update board set re_step = re_step+1 where ref=? and re_step > ?";

		try {
			// 시점 : sql1
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			rs.next();
			// key인 num이 1씩 증가, mysql auto_increment 또는 oracle sequence
			// sequence를 사용 : values(시퀀스명(board_seq).nextval,?,?..);
			int number = rs.getInt(1) + 1;
			rs.close();
			pstmt.close();

			// 시점 : sql2 --> 댓글
			// 신규글의 경우 num = 0 이므로 밑에 로직을 타지 않음
			if (num != 0) {
				System.out.println("BoardDao insert 댓글 sql2->" + sql2);
				System.out.println("BoardDao insert 댓글 board.getRef()->" + board.getRef());
				System.out.println("BoardDao insert 댓글 board.getRe_step->" + board.getRe_step());
				pstmt = conn.prepareStatement(sql2);
				pstmt.setInt(1, board.getRef());
				pstmt.setInt(2, board.getRe_step());
				pstmt.executeUpdate();
				pstmt.close();

				// 댓글 관련 정보
				board.setRe_step(board.getRe_step() + 1);
				board.setRe_level(board.getRe_level() + 1);
			}
			System.out.println("BoardDao insert num" + num);
			System.out.println("BoardDao insert number" + number);

			// 시점 : sql3
			if (num == 0) {
				board.setRef(number);// number
			}
			pstmt = conn.prepareStatement(sql3);
			pstmt.setInt(1, number);
			pstmt.setString(2, board.getWriter());
			pstmt.setString(3, board.getSubject());
			pstmt.setString(4, board.getContent());
			pstmt.setString(5, board.getEmail());
			pstmt.setInt(6, board.getReadcount());
			pstmt.setString(7, board.getPasswd());
			// 신규글인 경우 re_level, re_step = 0
			pstmt.setInt(8, board.getRef());
			pstmt.setInt(9, board.getRe_step());
			pstmt.setInt(10, board.getRe_level());
			pstmt.setString(11, board.getIp());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}

			if (conn != null) {
				conn.close();
			}
		}

		return result;
	}

}
