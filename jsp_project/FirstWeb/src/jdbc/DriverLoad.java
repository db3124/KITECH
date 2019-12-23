package jdbc;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

public class DriverLoad extends HttpServlet {

	@Override
	public void init() throws ServletException {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("드라이버 로드 완료");
		} catch(ClassNotFoundException e) {
			System.out.println("드라이버 클래스를 로드하지 못했습니다.");
		}
		
	}
	
}// end of class