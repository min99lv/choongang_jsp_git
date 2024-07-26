package service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import dao.Board;
import dao.BoardDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ListAciton implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("ListAction Service start");

		// service에서 dao를 호출하는 단계
		// DAO Logic Singleton -> new BoardDao가 아닌이유
		BoardDao bd = BoardDao.getInstance();

		int totCnt;
		try {
			// service에서 dao 호출
			// 38
			totCnt = bd.getTotalcnt();

			String pageNum = request.getParameter("pageNum"); 
			// null이 들어옴 index에서 파라메터가 넘어오지않았기때문에
			if (pageNum == null || pageNum.equals("")) {
				pageNum = "1";
			}
			 	// 계산하는 경우 파씽을 해줌 request로 넘기면 다시 String이 되기 때문에 
				int currentPage = Integer.parseInt(pageNum);
				// 페이지 사이즈 : 게시글 갯수 , 블록사이즈 : 페이지 번호
				int pageSize = 10, blockSize = 10;
				// 현재페이지 (1-1)
				int startRow = (currentPage - 1) * pageSize + 1; // 1 11
				int endRow = startRow + pageSize - 1; // 10,20
				
				int startNum = totCnt - startRow + 1;  // 38-1+1 = 38

				// Board 조회
				List<Board> list = bd.boardList(startRow, endRow);
				// 내가 보여줄 페이지의 카운트 	38 / 10 = 3.8
				int pageCnt = (int) Math.ceil((double) totCnt / pageSize); // 4
				//													1
				// 2 - 1 / 10 * 10 + 1 = 1
				int startPage = (int) (currentPage - 1) / blockSize * blockSize + 1; // 1
				
				
				int endPage = startPage + blockSize - 1; // 10
				// 공갈 page 방지 10 > 4
				if (endPage > pageCnt)
					endPage = pageCnt; // 4

				request.setAttribute("list", list);
				request.setAttribute("totCnt", totCnt);
				request.setAttribute("pageNum", pageNum);
				request.setAttribute("currentPage", currentPage);
				request.setAttribute("startNum", startNum);
				request.setAttribute("blockSize", blockSize);
				request.setAttribute("pageCnt", pageCnt);
				request.setAttribute("startPage", startPage);
				request.setAttribute("endPage", endPage);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// view 명칭
		/* return "listForm.jsp"; */
		return "list.jsp";

	}

}
