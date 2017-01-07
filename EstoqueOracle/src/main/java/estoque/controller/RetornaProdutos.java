package estoque.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import estoque.persistence.IProdutoDAO;
import estoque.persistence.ProdutoDAOImp;

@WebServlet("/RetornaProdutos")
public class RetornaProdutos extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IProdutoDAO prodDAO = new ProdutoDAOImp();
       
    public RetornaProdutos() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	try {
    		request.setAttribute("produtos", prodDAO.listarProdutos()); 		
    		request.getRequestDispatcher("principal_produto.jsp").forward(request, response);	
		} catch (SQLException e) {
			System.out.println("Erro: "+e);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
