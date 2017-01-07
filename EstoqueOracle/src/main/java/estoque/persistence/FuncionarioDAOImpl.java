package estoque.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import estoque.model.Funcionario;

public class FuncionarioDAOImpl implements IFuncionarioDAO {

	private Connection con = null;
	
	public FuncionarioDAOImpl() {
		con = new DBUtil().getConnection();
	}
	
	@Override
	public void adicionarFuncionario(Funcionario func) throws SQLException {
		String sql = "BEGIN inserirFuncionario(?,?,?,?,?,?); END;";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1,func.getNome());
		ps.setString(2,func.getCpf());
		ps.setString(3,func.getRg());
		ps.setString(4, func.getTelefone());
		ps.setString(5,func.getEmail());
		ps.setInt(6, func.getSenha());
		ps.execute();
		ps.close();		
	}

	@Override
	public void excluirFuncionario(Funcionario func) throws SQLException {
		String sql = "BEGIN excluirFuncionario(?); END;";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1,func.getCodigo());
		ps.execute();
		ps.close();
	}

	@Override
	public void consultarFuncionario(String nome) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void alterarFuncionario(Funcionario func) throws SQLException {
		String sql = "BEGIN updateFuncionario(?,?,?,?,?,?,?);  END;";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1,func.getCodigo());
		ps.setString(2,func.getNome());
		ps.setString(3,func.getCpf());
		ps.setString(4,func.getRg());
		ps.setString(5, func.getTelefone());
		ps.setString(6,func.getEmail());
		ps.setInt(7, func.getSenha());
		ps.execute();
		ps.close();		
	}

	@Override
	public List<Funcionario> retornaFuncionarios() throws SQLException {
		String sql = "SELECT * FROM tb_funcionarios";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<Funcionario> listaFuncionarios = new ArrayList<Funcionario>();
		while (rs.next()){
			Funcionario func = new Funcionario();
			func.setCodigo((rs.getInt("codigo_funcionario")));
			func.setNome((rs.getString("nome_funcionario")));
			func.setCpf((rs.getString("cpf_funcionario")));
			func.setTelefone((rs.getString("telefone_funcionario")));
			func.setEmail((rs.getString("email_funcionario")));
			listaFuncionarios.add(func);
		}
		rs.close();
		ps.close();		
		return listaFuncionarios;
	}

	@Override
	public Funcionario verificaLogin(Funcionario func) throws SQLException {
		String sql = "SELECT nome_funcionario FROM tb_funcionarios WHERE email_funcionario = ? AND senha = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, func.getEmail());
		ps.setInt(2, func.getSenha());
		ResultSet rs = ps.executeQuery();
		if(rs.next()){
			System.out.println(rs.getString("nome_funcionario"));
			func.setNome(rs.getString("nome_funcionario"));
			return func;
		} else {
			return null;			
		}
	}

	@Override
	public Funcionario retornaFuncionario(int cod) throws SQLException {
		Funcionario func = new Funcionario();
		String sql = "SELECT * FROM tb_funcionarios WHERE codigo_funcionario = ?";
		PreparedStatement ps =  con.prepareStatement(sql);
		ps.setInt(1, cod);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			func.setCodigo((rs.getInt("codigo_funcionario")));
			func.setNome((rs.getString("nome_funcionario")));
			func.setCpf((rs.getString("cpf_funcionario")));
			func.setRg((rs.getString("rg_funcionario")));
			func.setEmail((rs.getString("email_funcionario")));
			func.setTelefone((rs.getString("telefone_funcionario")));
			func.setSenha((rs.getInt("senha")));		
		}
		return func;
	}

}
