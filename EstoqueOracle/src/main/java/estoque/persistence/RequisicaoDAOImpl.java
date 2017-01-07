package estoque.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import estoque.model.Funcionario;
import estoque.model.Produto;
import estoque.model.Requisicao;

public class RequisicaoDAOImpl implements IRequisicaoDAO {

	private Connection con = null;
	
	public RequisicaoDAOImpl() {
		con = new DBUtil().getConnection();	
	}
	
	@Override
	public void geraRequisicao(Requisicao req) throws SQLException {
		String sql = "BEGIN inserirRequisicao(?,?,?); END;";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, req.getFunc().getCodigo());
		ps.setInt(2,req.getProd().getCodigo());
		ps.setInt(3,req.getQtd_requisicao());
		ps.execute();
		ps.close();
	}


	@Override
	public List<Requisicao> listaRequisicao() throws SQLException {
		String sql = "SELECT  req.codigo_requisicao AS codigo_requisicao ,"+
          "func.nome_funcionario AS nome_funcionario,"+ 
          "prod.nome_produto AS nome_produto, "+
          "req.qtd_requisicao AS qtd_requisicao,"+ 
          "req.data_requisicao AS data_requisicao,"+ 
          "req.status_requisicao AS status_requisicao "+ 
		  "FROM tb_requisicao req "+
		  "INNER JOIN tb_produtos prod ON req.codigo_produto = prod.codigo_produto "+
		  "INNER JOIN tb_funcionarios func ON req.codigo_funcionario = func.codigo_funcionario";
		List<Requisicao> listaRequisicao = new ArrayList<Requisicao>();
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next()){
			Requisicao req = new Requisicao();
			Funcionario func = new Funcionario();
			Produto prod = new Produto();
			req.setCodigo_requisicao((rs.getInt("codigo_requisicao")));
			func.setNome((rs.getString("nome_funcionario")));
			prod.setNome((rs.getString("nome_produto")));
			req.setFunc(func);
			req.setProd(prod);
			req.setQtd_requisicao((rs.getInt("qtd_requisicao")));
			req.setData_requisicao((rs.getDate("data_requisicao")));
			req.setStatus((rs.getString("status_requisicao")));
			listaRequisicao.add(req);
		}
		rs.close();
		ps.close();		
		return listaRequisicao;
	}

	@Override
	public void baixaRequisicao(int codigo) throws SQLException {
		String sql = "UPDATE tb_requisicao SET status_requisicao='B' WHERE codigo_requisicao=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, codigo);
		ps.execute();
		ps.close();
	}

	@Override
	public void estornaRequisicao(int codigo) throws SQLException {
		String sql = "UPDATE tb_requisicao SET status_requisicao='P' WHERE codigo_requisicao=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, codigo);
		ps.execute();
		ps.close();
	}

	@Override
	public List<Requisicao> listaSaidaCaixa() throws SQLException {
		String sql = "	SELECT  prod.codigo_produto,prod.nome_produto AS nome_produto,req.qtd_requisicao,"+ 
         "SUM (req.QTD_REQUISICAO * prod.PRECO_PRODUTO) AS valor_caixa "+ 
         "FROM tb_requisicao req "+
         "INNER JOIN tb_produtos prod	ON req.codigo_produto = prod.codigo_produto "+
         "GROUP BY prod.codigo_produto,prod.NOME_PRODUTO,req.qtd_requisicao "+
         "ORDER BY valor_caixa DESC ";
		System.out.println(sql);
		List<Requisicao> listaRequisicao = new ArrayList<Requisicao>();
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next()){
			Requisicao req = new Requisicao();
			Funcionario func = new Funcionario();
			Produto prod = new Produto();
			prod.setCodigo((rs.getInt("codigo_produto")));
			prod.setNome((rs.getString("nome_produto")));
			prod.setPreco((rs.getDouble("valor_caixa")));
			req.setFunc(func);
			req.setProd(prod);
			req.setQtd_requisicao((rs.getInt("qtd_requisicao")));
			listaRequisicao.add(req);
		}
		rs.close();
		ps.close();		
		System.out.println(listaRequisicao);
		return listaRequisicao;
	}

	@Override
	public void cancelaRequisicao(int codigo) throws SQLException {
		String sql = "BEGIN excluirRequisicao(?); END;";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, codigo);
		ps.execute();
		ps.close();
	}

}
