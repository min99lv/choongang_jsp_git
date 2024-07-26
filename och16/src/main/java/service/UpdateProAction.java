package service;

import java.io.IOException;
import java.sql.SQLException;

import dao.Board;
import dao.BoardDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UpdateProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. num , pageNum, writer , email , subject , passwd , content Get
		String pageNum = request.getParameter("pageNum");
		String writer = request.getParameter("writer");
		int num = Integer.parseInt(request.getParameter("num"));
		// 2. Board board 생성하고 Value Setting
		Board board = new Board();
		board.setNum(num);
		board.setWriter(writer);
		board.setEmail(request.getParameter("email"));
		board.setSubject(request.getParameter("subject"));
		board.setPasswd(request.getParameter("passwd"));
		board.setContent(request.getParameter("content"));
		board.setIp(request.getRemoteAddr());

		// 3. BoardDao bd Instance
		BoardDao bd = BoardDao.getInstance();

		int result;
		try {
			// int result = bd.update(board);
			result = bd.update(board);
			// 4. request 객체에 result, num , pageNum
			request.setAttribute("result", result);
			request.setAttribute("num", board.getNum());
			request.setAttribute("pageNum", pageNum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 5.updatePro.jsp Return
		return "updatePro.jsp";
	}

}
