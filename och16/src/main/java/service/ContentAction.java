package service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import dao.Board;
import dao.BoardDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ContentAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("ContentAction Service start1");

		// 1.num, pageNum Get
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		System.out.println("ContentAction Service start2");

		try {
			// DAO Logic
			// 2. BoardDao bd Instance
			BoardDao bd = BoardDao.getInstance();

			bd.readCount(num);
			// 3. Board board = bd.select(num)
			System.out.println("ContentAction Service start3");

			Board board = bd.select(num);
			System.out.println("ContentAction Service start4");

			// 4. request 객체에 num , pageNum , board
			request.setAttribute("num", num);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("board", board);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("ContentAction Service End..");

		// View
		return "content.jsp";
	}

}
