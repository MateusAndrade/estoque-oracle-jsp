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

@WebServlet("/ControllerFuncionario")
public class ServletFuncionario extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IFuncionarioDAO funcDAO = new FuncionarioDAOImpl();
	private Funcionario func = new Funcionario();

    public ServletFuncionario() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Get");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		func.setNome(request.getParameter("nome"));
		func.setCpf(request.getParameter("cpf"));
		func.setRg(request.getParameter("rg"));
		func.setTelefone(request.getParameter("telefone"));
		func.setEmail(request.getParameter("email"));
		func.setSenha(Integer.parseInt(request.getParameter("senha")));
		try {
			System.out.println("Inserindo Funcionário");
			funcDAO.adicionarFuncionario(func);
			out.print("<script>alert('Funcionário Cadastrado com Sucesso.');"
					+ "location.assign('RetornaFuncionarios')</script>");
		} catch (SQLException e) {
			System.out.println("Ocorreu um Erro SQL:"+e);
			e.printStackTrace();
		}
		
	}
	
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Deletando Funcionário");
		try {
			func.setCodigo(Integer.parseInt(request.getParameter("codigo")));
			funcDAO.excluirFuncionario(func);
		} catch (SQLException e) {
			System.out.println("Ocorreu um Erro SQL:"+e);
		}
	}

}
