package jdbc;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

@SuppressWarnings("serial")
public class MySQLDriverLoader extends HttpServlet {
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			e.printStackTrace(); //예외가 났을 때 콘솔에 표시
			throw new ServletException(e); //예외가 났을 때 화면에 출력
		}
	}
}
