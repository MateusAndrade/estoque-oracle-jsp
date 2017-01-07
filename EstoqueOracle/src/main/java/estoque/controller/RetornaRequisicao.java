package estoque.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import estoque.persistence.IRequisicaoDAO;
import estoque.persistence.RequisicaoDAOImpl;

@WebServlet("/RetornaRequisicao")
public class RetornaRequisicao extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IRequisicaoDAO recDAO = new RequisicaoDAOImpl();
	
	public RetornaRequisicao() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
    		request.setAttribute("requisicoes",recDAO.listaRequisicao());
    		request.getRequestDispatcher("principal_requisicao.jsp").forward(request, response);				
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
