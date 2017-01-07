package estoque.persistence;

import java.sql.SQLException;
import java.util.List;

import estoque.model.Requisicao;

public interface IRequisicaoDAO {

	public void geraRequisicao( Requisicao req ) throws SQLException;
	public void estornaRequisicao( int codigo ) throws SQLException;
	public void baixaRequisicao( int codigo ) throws SQLException;
	public List<Requisicao> listaRequisicao(   ) throws SQLException;
	public List<Requisicao> listaSaidaCaixa( ) throws SQLException;
	public void cancelaRequisicao( int codigo ) throws SQLException;
	
}
