package control;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.CommandProcess;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

/**
 * Servlet implementation class Controller
 */
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// 멤버변수 이므로 컨트롤러 내에서는 사용
	private Map<String, Object> commandMap = new HashMap<String, Object>();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Controller() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// web.xml에서 propertyConfig에 해당하는 init-param 의 값을 읽어옴
		/*
		 * config: <init-param> <param-name>config</param-name>
		 * <param-value>/WEB-INF/command.properties</param-value> </init-param>
		 */
		String props = config.getInitParameter("config");
		// /WEB-INF/command.properties
		System.out.println("1. init String props=>" + props); // /WEB-INF/command.properties

		// Properties는 (String, String)형태로 저장하는 보다 단순화된 컬렉션 클래스이다. 주로 애플리케이션의 환경설정과 관련된
		// 속성을 저장하는데 사용되며 데이터를 파일로부터 읽고 쓰는 편리한 기능을 제공
		Properties pr = new Properties();
		// 파일 내용 출력 객체
		FileInputStream f = null;

		try {
			String configFilepath = config.getServletContext().getRealPath(props);
			System.out.println("2. init String configFilePath=>" + configFilepath);
			// C:\jsp\jspSrc17\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\och16\WEB-INF\command.properties

			// FileInputStream은 파일을 바이트 스트림으로 읽을 수 있게 해주는 클래스 -> 파일의 내용을 읽어옴
			f = new FileInputStream(configFilepath);
			// Memory Up -> 파일을 프로퍼티 형식으로 올린다.
			pr.load(f);
		} catch (FileNotFoundException e) {
			// TODO: handle exception
			e.printStackTrace();
		} catch (IOException e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if (f != null)
				try {
					f.close();
				} catch (IOException ex) {
					System.out.println("IOException ex.getMessage-->" + ex.getMessage());
				}
		}
		// 컬렉션에 저장되어 있는 요소들을 순회하는 인터페이스
		Iterator keyIter = pr.keySet().iterator();

		while (keyIter.hasNext()) {
			// 다음 키가 있으면 저장
			String command = (String) keyIter.next();
			// value 저장
			String className = pr.getProperty(command);
			System.out.println("3. init String command-->" + command);
			System.out.println("4. init String className-->" + className);

			try {
				// 밑에 로직을 사용하지 않는 이유는 코드들 계속 생성해주어야하기때문에 비효율성
				// CommandProcess la = new ListAction();

				// 소멸 class 원래 이렇게 사용함 -> 근데 사라짐 그래서 <?>이문장으로 사용함
				// Class commandClass = Class.forName(className);
				// object commandInstance = commandClass.newInstance();
				// new Class ---> 제네릭의 요점은 클래스 유형을 모른다
				Class<?> commClass = Class.forName(className);
				// 해당 문자열을 클래스로
				// 문자열로 지정된 클래스 이름을 Class 객체로 변환

				// commClass.getDeclarConstructor -> 클래스의 기본 생성자를 반환
				// newInstance -> 기본 생성자를 호출하여 클래스의 새 인스턴스를 생성 -> 반환된 인스턴스는 인터페이스를 구현한 클래스 즉
				// ListAction
				CommandProcess commandInstance = (CommandProcess) commClass.getDeclaredConstructor().newInstance();
				// String object
				// /list.do service.ListAction
				// content.do service.ContentAction
				commandMap.put(command, commandInstance);

			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		requestServletPro(request, response); // get방식으로 보내면 requestServletPro를 탄다
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		requestServletPro(request, response);// Post방식으로 보내면 requestServletPro를 탄다
	}

	protected void requestServletPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String view = null;
		CommandProcess com = null;
		String command = request.getRequestURI();
		System.out.println("1.requestServletPro command=>" + command); // / och16/list.do
		// /och16 -> path : path를 자른다
		command = command.substring(request.getContextPath().length()); // /list.do
		System.out.println("2.requestServletPro command substring =>" + command);

		try {
			// com : service.ListAction Instance
			com = (CommandProcess) commandMap.get(command);
			System.out.println("3.requestServletPro command =>" + command); // ch16/com
			System.out.println("4.requestServletPro com =>" + com); // ch16/com

			// com --> service.ListAciton@692b1c0a -> 해시코드 (=객체의 인스턴스 의미)
			// ListAction.java requestPro메서드 호출 return값 .jsp이므로 뷰가 호출됨
			// controller -> service
			view = com.requestPro(request, response);
			System.out.println("5.requestServletPro view =>" + view); // ch1/com
			// 서비스가 끝나면 출력된다.
		} catch (Exception e) {
			throw new ServletException(e);
		}
		// controller -> view로 이동하는 경로
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);

	}

}
