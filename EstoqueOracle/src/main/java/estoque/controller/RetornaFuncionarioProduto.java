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
import estoque.persistence.IProdutoDAO;
import estoque.persistence.ProdutoDAOImp;

@WebServlet("/cadastraRequisicao")
public class RetornaFuncionarioProduto extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IFuncionarioDAO funcDAO = new FuncionarioDAOImpl();
	private IProdutoDAO prodDAO = new ProdutoDAOImp();
	
    public RetornaFuncionarioProduto() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setAttribute("funcionarios", funcDAO.retornaFuncionarios());
			request.setAttribute("produtos",prodDAO.listarProdutos());
    		request.getRequestDispatcher("cadastra_requisicao.jsp").forward(request, response);	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
