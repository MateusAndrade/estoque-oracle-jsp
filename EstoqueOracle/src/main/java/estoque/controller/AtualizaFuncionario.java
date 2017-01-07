package estoque.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import estoque.model.Funcionario;
import estoque.persistence.FuncionarioDAOImpl;
import estoque.persistence.IFuncionarioDAO;

@WebServlet("/AtualizaFuncionario")
public class AtualizaFuncionario extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IFuncionarioDAO funcDAO = new FuncionarioDAOImpl();

    public AtualizaFuncionario() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		try {
			Funcionario func = funcDAO.retornaFuncionario(Integer.parseInt(request.getParameter("codigo")));
			request.setAttribute("funcionario", func);
			request.getRequestDispatcher("cadastra_funcionario.jsp").forward(request, response);
		} catch (NumberFormatException e) {
			System.out.println("Erro de Numero"+e);
		} catch (SQLException e) {
			System.out.println("Erro SQL"+e);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Funcionario func = new Funcionario();
		PrintWriter out = response.getWriter();
		func.setCodigo(Integer.parseInt(request.getParameter("codigo")));
		func.setNome(request.getParameter("nome"));
		func.setCpf(request.getParameter("cpf"));
		func.setRg(request.getParameter("rg"));
		func.setTelefone(request.getParameter("telefone"));
		func.setEmail(request.getParameter("email"));
		func.setSenha(Integer.parseInt(request.getParameter("senha")));
		try {
			System.out.println("Update");
			funcDAO.alterarFuncionario(func);
			response.sendRedirect("RetornaFuncionarios");
		} catch (SQLException e) {
			System.out.println("Erro SQL: "+e);
		}
		
	}

}
