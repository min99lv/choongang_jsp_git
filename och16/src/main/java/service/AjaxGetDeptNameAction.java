package service;

import java.io.IOException;

import dao.Board;
import dao.BoardDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AjaxGetDeptNameAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("AjaxGetdeptNameAction Start");
		try {
			// 본인 필요 DB text 가져 옴(DAO연결)
			int num = Integer.parseInt(request.getParameter("num"));
			BoardDao bd = BoardDao.getInstance();
			Board board = bd.select(num);
			request.setAttribute("writer", board.getWriter());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		// ajax 경우 --> 더미 return (의미없는 데이터)
		return "ajax";
	}

}
