package estoque.persistence;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {

	private Connection conn = null;
	
	public Connection getConnection(){
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","system","root");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		if(conn != null){
			System.out.println("Conectado com Sucesso");
		}else {
			System.out.println("Deu Ruim");
		}
		return conn;
	}
	
	public void closeConnection(Connection c){
		try {
			c.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
}
