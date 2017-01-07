package estoque.persistence;

import java.lang.invoke.SerializedLambda;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import estoque.model.Produto;

public class ProdutoDAOImp implements IProdutoDAO {

	private Connection con = null;
	
	public ProdutoDAOImp() {
		con = new DBUtil().getConnection();
	}
	
	@Override
	public void adicionarProduto(Produto prod) throws SQLException {
		String sql = "BEGIN inserirProduto(?,?,?); END;";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, prod.getNome());
		ps.setInt(2, prod.getQuantidade());
		ps.setDouble(3, prod.getPreco());
		ps.execute();
		ps.close();	
	}

	@Override
	public void excluirProduto(Produto prod) throws SQLException {
		String sql = "BEGIN CALL excluirProduto(?); END;";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1,prod.getCodigo());
		ps.execute();
		ps.close();
	}

	@Override
	public List<Produto> listarProdutos() throws SQLException {
		String sql = "SELECT * FROM tb_produtos";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<Produto> listaProdutos = new ArrayList<Produto>();
		while (rs.next()){
			Produto prod = new Produto();
			prod.setCodigo((rs.getInt("codigo_produto")));
			prod.setNome((rs.getString("nome_produto")));
			prod.setPreco((rs.getDouble("preco_produto")));
			prod.setQuantidade((rs.getInt("quantidade_produto")));
			listaProdutos.add(prod);
		}
		rs.close();
		ps.close();
		return listaProdutos;
	}

	@Override
	public void alterarProduto(Produto prod) throws SQLException {
		String sql = "BEGIN updateProduto(?,?,?,?); END;";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, prod.getCodigo());
		ps.setString(2,prod.getNome());
		ps.setInt(3,prod.getQuantidade());
		ps.setDouble(4, prod.getPreco());
		ps.execute();
		ps.close();
	}

	@Override
	public List<Produto> listaEstoqueBaixo() throws SQLException {
		String sql = "SELECT * FROM tb_produtos WHERE QUANTIDADE_PRODUTO < 15";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<Produto> listaProdutos = new ArrayList<Produto>();
		while (rs.next()){
			Produto prod = new Produto();
			prod.setCodigo((rs.getInt("codigo_produto")));
			prod.setNome((rs.getString("nome_produto")));
			prod.setPreco((rs.getDouble("preco_produto")));
			prod.setQuantidade((rs.getInt("quantidade_produto")));
			listaProdutos.add(prod);
		}
		rs.close();
		ps.close();
		return listaProdutos;		
		
	}

	@Override
	public Produto retornaProduto(int cod) throws SQLException {
		Produto prod = new Produto();
		String sql = "SELECT * FROM tb_produtos WHERE codigo_produto = ?";
		PreparedStatement ps =  con.prepareStatement(sql);
		ps.setInt(1, cod);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			prod.setCodigo((rs.getInt("codigo_produto")));
			prod.setCodigo((rs.getInt("codigo_produto")));
			prod.setNome((rs.getString("nome_produto")));
			prod.setPreco((rs.getDouble("preco_produto")));
			prod.setQuantidade((rs.getInt("quantidade_produto")));			
		}
		return prod;
	}

}
