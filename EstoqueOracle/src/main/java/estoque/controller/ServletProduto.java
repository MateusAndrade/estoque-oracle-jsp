package estoque.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.taglibs.standard.lang.jstl.IntegerLiteral;
import estoque.model.Produto;
import estoque.persistence.DBUtil;
import estoque.persistence.IProdutoDAO;
import estoque.persistence.ProdutoDAOImp;

@WebServlet("/ControllerProduto")
public class ServletProduto extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private IProdutoDAO produtoDAO =  new ProdutoDAOImp();
	private Produto prod = new Produto();
	
    public ServletProduto() {
        super();
    }
	  	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		try{ 
			request.setAttribute("produtos",produtoDAO.listarProdutos());
	        request.getRequestDispatcher("principal_produto.jsp").forward(request, response);	
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		prod.setNome(request.getParameter("nome"));
		prod.setPreco(Double.parseDouble(request.getParameter("preco")));
		prod.setQuantidade(Integer.parseInt(request.getParameter("quantidade")));
		try {
			produtoDAO.adicionarProduto(prod);
			response.sendRedirect("ControllerProduto");
			System.out.println("Insert");
		} catch (SQLException e) {
			e.printStackTrace();;
		}					
	}

	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			prod.setCodigo(Integer.parseInt(request.getParameter("codigo")));
			produtoDAO.excluirProduto(prod);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
