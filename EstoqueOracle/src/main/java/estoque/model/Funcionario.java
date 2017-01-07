package estoque.model;

public class Funcionario {

	private int codigo;
	private String nome;
	private String cpf;
	private String rg;
	private String telefone;
	private String email;
	private int senha;
	
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	public String getRg() {
		return rg;
	}
	public void setRg(String rg) {
		this.rg = rg;
	}
	public String getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getSenha() {
		return senha;
	}
	public void setSenha(int senha) {
		this.senha = senha;
	}
	@Override
	public String toString() {
		return "Funcionario [codigo=" + codigo + ", nome=" + nome + ", cpf=" + cpf + ", rg=" + rg + ", telefone="
				+ telefone + ", email=" + email + ", senha=" + senha + ", toString()=" + super.toString() + "]";
	}
	
}
