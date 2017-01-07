package estoque.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import estoque.persistence.FuncionarioDAOImpl;
import estoque.persistence.IFuncionarioDAO;

@WebServlet("/RetornaFuncionarios")
public class RetornaFuncionarios extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IFuncionarioDAO funcDAO = new FuncionarioDAOImpl();
	
	public RetornaFuncionarios() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
    		request.setAttribute("funcionarios", funcDAO.retornaFuncionarios());
    		request.getRequestDispatcher("principal_funcionario.jsp").forward(request, response);	
		} catch (SQLException e) {
			System.out.println("Erro: "+e);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
