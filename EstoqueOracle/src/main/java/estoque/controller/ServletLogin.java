package estoque.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import estoque.model.Funcionario;
import estoque.persistence.FuncionarioDAOImpl;
import estoque.persistence.IFuncionarioDAO;

@WebServlet("/ServletLogin")
public class ServletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private IFuncionarioDAO funcDAO = new FuncionarioDAOImpl();   
	
    public ServletLogin() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Funcionario func = new Funcionario();
		HttpSession sessao = request.getSession();
		func.setEmail(request.getParameter("login"));
		func.setSenha(Integer.parseInt(request.getParameter("senha")));
		try {
			if(funcDAO.verificaLogin(func).getNome() !=  null){
				sessao.setAttribute("usuario",funcDAO.verificaLogin(func).getNome());
	    		request.getRequestDispatcher("home").forward(request, response);	
			} else {
				request.getRequestDispatcher("login.jsp").forward(request,response);
			}
			
		} catch (SQLException e) {
			System.out.println("Erro:"+e);
		}
	}

}
