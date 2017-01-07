package estoque.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import estoque.model.Produto;
import estoque.persistence.IProdutoDAO;
import estoque.persistence.ProdutoDAOImp;

@WebServlet("/AtualizaProduto")
public class AtualizaProduto extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IProdutoDAO prodDAO = new ProdutoDAOImp();
	
    public AtualizaProduto() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Produto prod = prodDAO.retornaProduto(Integer.parseInt(request.getParameter("codigo")));
			request.setAttribute("produto", prod);
			request.getRequestDispatcher("cadastra_produto.jsp").forward(request, response);
		} catch (NumberFormatException | SQLException e) {
			System.out.println("Erro: "+ e);
			e.printStackTrace();
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Produto prod = new Produto();
		prod.setCodigo(Integer.parseInt(request.getParameter("codigo")));
		prod.setNome(request.getParameter("nome"));
		prod.setPreco(Double.parseDouble(request.getParameter("preco")));
		prod.setQuantidade(Integer.parseInt(request.getParameter("quantidade")));		
		try {
			prodDAO.alterarProduto(prod);
			response.sendRedirect("RetornaProdutos");
			System.out.println("Update");
		} catch (SQLException e) {
			System.out.println("Erro SQL: "+e);
			e.printStackTrace();
		}
	}

}
