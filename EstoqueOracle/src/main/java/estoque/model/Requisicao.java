package estoque.model;

import java.util.Date;

public class Requisicao {

	private Produto prod;
	private Funcionario func;
	private int codigo_requisicao;
	private int qtd_requisicao;
	private Date data_requisicao;
	private String hora_requisicao;
	private String status;

	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Produto getProd() {
		return prod;
	}
	public void setProd(Produto prod) {
		this.prod = prod;
	}
	public Funcionario getFunc() {
		return func;
	}
	public void setFunc(Funcionario func) {
		this.func = func;
	}
	public int getCodigo_requisicao() {
		return codigo_requisicao;
	}
	public void setCodigo_requisicao(int codigo_requisicao) {
		this.codigo_requisicao = codigo_requisicao;
	}
	public int getQtd_requisicao() {
		return qtd_requisicao;
	}
	public void setQtd_requisicao(int qtd_requisicao) {
		this.qtd_requisicao = qtd_requisicao;
	}
	public Date getData_requisicao() {
		return data_requisicao;
	}
	public void setData_requisicao(Date data_requisicao) {
		this.data_requisicao = data_requisicao;
	}
	public String getHora_requisicao() {
		return hora_requisicao;
	}
	public void setHora_requisicao(String hora_requisicao) {
		this.hora_requisicao = hora_requisicao;
	}
	
	
}
