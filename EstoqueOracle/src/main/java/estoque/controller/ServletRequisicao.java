package estoque.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import estoque.model.Funcionario;
import estoque.model.Produto;
import estoque.model.Requisicao;
import estoque.persistence.IRequisicaoDAO;
import estoque.persistence.RequisicaoDAOImpl;

@WebServlet("/ControllerRequisicao")
public class ServletRequisicao extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IRequisicaoDAO reqDao = new RequisicaoDAOImpl();

    public ServletRequisicao() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Requisicao req = new Requisicao();
		Funcionario func = new Funcionario();
		Produto prod = new Produto();
		try {
			func.setCodigo(Integer.parseInt(request.getParameter("funcionarios")));
			prod.setCodigo(Integer.parseInt(request.getParameter("produtos")));
			req.setQtd_requisicao(Integer.parseInt(request.getParameter("qtd")));
			req.setFunc(func);
			req.setProd(prod);
			reqDao.geraRequisicao(req);
			response.sendRedirect("RetornaRequisicao");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			if(request.getParameter("tipo").equals("B")){
				reqDao.baixaRequisicao(Integer.parseInt(request.getParameter("codigo")));
				System.out.println("show");				
			} else if(request.getParameter("tipo").equals("P")){
				reqDao.estornaRequisicao(Integer.parseInt(request.getParameter("codigo")));
				System.out.println("show 1");
			}
		} catch (NumberFormatException e) {
			System.out.println("Erro de Numeração: "+e);
		} catch (SQLException e) {
			System.out.println("Erro de SQL: "+e);
		}
	}
	
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			reqDao.cancelaRequisicao(Integer.parseInt(request.getParameter("codigo")));
		} catch (NumberFormatException e) {
			System.out.println("Número invalido");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("Erro SQL: "+e);
			e.printStackTrace();
		}
	}
	
}
