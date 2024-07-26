package service;

import java.io.IOException;
import java.sql.SQLException;

import dao.Board;
import dao.BoardDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class WriteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. num , pageNum, writer , email , subject , passwd , content Get
		String pageNum = request.getParameter("pageNum");
		Board board = new Board();

		// 2. Board board 생성하고 Value Setting
		board.setNum(Integer.parseInt(request.getParameter("num")));
		board.setSubject(request.getParameter("subject"));
		board.setWriter(request.getParameter("writer"));
		board.setEmail(request.getParameter("email"));
		board.setPasswd(request.getParameter("passwd"));
		
		board.setRef(Integer.parseInt(request.getParameter("ref")));
		board.setRe_step(Integer.parseInt(request.getParameter("re_step")));
		board.setRe_level(Integer.parseInt(request.getParameter("re_level")));
		board.setContent(request.getParameter("content"));
		board.setIp(request.getRemoteAddr());
		// 3. BoardDao bd Instance
		BoardDao bd = BoardDao.getInstance();
		int result;
		try {
			result = bd.insert(board);
			// 4. request 객체에 result, num , pageNum

			request.setAttribute("result", result);
			request.setAttribute("num", board.getNum());
			request.setAttribute("pageNum", pageNum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "writePro.jsp";
	}

}
