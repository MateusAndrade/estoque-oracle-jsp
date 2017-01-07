package estoque.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import estoque.persistence.IFuncionarioDAO;
import estoque.persistence.IProdutoDAO;
import estoque.persistence.IRequisicaoDAO;
import estoque.persistence.ProdutoDAOImp;
import estoque.persistence.RequisicaoDAOImpl;

@WebServlet("/home")
public class RetornaIndex extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private IRequisicaoDAO reqDAO = new RequisicaoDAOImpl();
    private IProdutoDAO prodDAO =  new ProdutoDAOImp();

    public RetornaIndex() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setAttribute("produtos",prodDAO.listaEstoqueBaixo());
			request.setAttribute("requisicoes",reqDAO.listaSaidaCaixa());
			request.getRequestDispatcher("index.jsp").forward(request, response);	
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
