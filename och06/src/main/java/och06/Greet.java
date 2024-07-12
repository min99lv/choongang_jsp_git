package och06;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.GregorianCalendar;

/**
 * Servlet implementation class Greet
 */
public class Greet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PrintWriter log; // 멤버변수 개념
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Greet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * 생성시 :생명주기적 관점
	 */
	public void init(ServletConfig config) throws ServletException {
		try {
			System.out.println("세상에 나를 선 보인 날......");
			// 시스템에서 강제하는 오류가 난다. (파일)이 없을까봐 시스템이 잡아준거는 무조건 에러처리
			// PrintWriter 화면에 보여주는 용도와 FileWriter와 같이 사용하면 파일을 저장하기위한 용도로 쓰임
			log = new PrintWriter(new FileWriter("c:/log/log.txt",true));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println("init오류....");
		} 
	}

	/**
	 * 하늘나라
	 */
	public void destroy() {
		System.out.println("세상에 유언을 남긴 날......");
		if(log != null) log.close(); // 로그가 닫히지 않았으면 닫아줌.
	}

	/**
	 * 사회활동
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String msg = name + "님 반가워 \r\n";
		System.out.println(name+"님의 사회활동.............");
		GregorianCalendar gc = new GregorianCalendar();
		String date = String.format("%TF %TT\r\n",gc,gc);
		log.print(date + msg);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html><body><h2>인사</h2>"+msg);
		out.println("</body></html>");
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
