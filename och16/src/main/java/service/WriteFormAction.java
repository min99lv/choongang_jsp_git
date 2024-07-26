package service;

import java.io.IOException;

import dao.Board;
import dao.BoardDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class WriteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("WriteFormAction Start...");

		try {
			// 신규글
			// 댓글과 합칠 것이기 때문에 미리 변수로 만들어 놓는다
			int num = 0, ref = 0, re_level = 0, re_step = 0;
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null)
				pageNum = "1";

			// 댓글일 경우
			// 받아온 num값이 0이 아닌 경우 if문 실행
			if (request.getParameter("num") != null) {
				num = Integer.parseInt(request.getParameter("num"));
				BoardDao bd = BoardDao.getInstance();
				// select메소드를 실행해서 board를 받아옴 조건은 num num
				Board board = bd.select(num);
				// select문에서 받아온 값을 세팅해줌
				ref = board.getRef();
				re_level = board.getRe_level();
				re_step = board.getRe_step();
			}
			request.setAttribute("num", num);
			request.setAttribute("ref", ref);
			request.setAttribute("re_level", re_level);
			request.setAttribute("re_step", re_step);
			request.setAttribute("pageNum", pageNum);

		} catch (Exception e) {
			System.out.println("WriteFormAction e.getMessage" + e.getMessage());
		}
		return "writeForm.jsp";
	}

}
