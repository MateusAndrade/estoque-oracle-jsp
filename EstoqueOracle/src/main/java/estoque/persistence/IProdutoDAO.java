package estoque.persistence;

import java.sql.SQLException;
import java.util.List;

import estoque.model.Produto;

public interface IProdutoDAO {

	public void adicionarProduto( Produto prod ) throws SQLException;
	public void excluirProduto( Produto prod ) throws SQLException;
	public void alterarProduto( Produto prod ) throws SQLException;
	public List<Produto> listarProdutos(  ) throws SQLException;
	public List<Produto> listaEstoqueBaixo(  ) throws SQLException;
	public Produto retornaProduto( int cod ) throws SQLException;
}
