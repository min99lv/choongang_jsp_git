package och02;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class Add3
 */
public class Add3 extends HttpServlet {
	private static final long serialVersionUID = 1L; // 버전번호 건들이지말것
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add3() { // 생성자
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */																				// request 객체
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
		 System.out.println("doGet start..."); // 서버상에 뿌려줌
		 // num의 누적분을 return 목표
		 // 서버로 넘어올때는 넘버든 텍스트든 문자로 넘어오기때문에 int로 사용하려면 파씽해줘야함
		 int num = Integer.parseInt(request.getParameter("num")); 
		 String han = request.getParameter("han");
		 int sum = 0;
		 for (int i = 1; i <= num; i++) {
			 sum += i;
		 }
		 // browser에 display하기 위한 방법 
		 response.setContentType("text/html;charset=utf-8"); // 한글 세팅
		 // PrintWriter browser화면에 상세내용을 보여줌
		 PrintWriter out = response.getWriter();
		 out.println("<html><body>");;		 
		 //out.println("<h1>1부터 "+num+"까지 합계 </h1>");;
		 out.printf("<h1>1부터 %d까지 합계 </h1>",num);; 
		 out.printf("<h1>han test : </h1>",han);
		 out.println(sum);
		 out.println("</body></html>");
		 out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("doPost start...");
	}

}
