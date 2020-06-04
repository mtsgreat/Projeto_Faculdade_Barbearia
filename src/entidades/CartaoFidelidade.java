package entidades;

import java.sql.Date;

import util.FormatarData;

public class CartaoFidelidade {
	private int cod_cartao;
	private Date data_vencimento;
	private Date data_emissao;
	private int qtd_cartao;
	private int cod_cliente_fk;
	
	public CartaoFidelidade() {}

	public CartaoFidelidade(String data_vencimento, String data_emissao, int qtd_cartao,
			int cod_cliente_fk) throws Exception {
		
		
		this.data_vencimento = FormatarData.formataData(data_vencimento);
		this.data_emissao = FormatarData.formataData(data_emissao);
		this.qtd_cartao = qtd_cartao;
		this.cod_cliente_fk = cod_cliente_fk;
	}

	public int getCod_cartao() {
		return cod_cartao;
	}

	public void setCod_cartao(int cod_cartao) {
		this.cod_cartao = cod_cartao;
	}

	public Date getData_vencimento() {
		return data_vencimento;
	}

	public void setData_vencimento(Date data_vencimento) {
		this.data_vencimento = data_vencimento;
	}

	public Date getData_emissao() {
		return data_emissao;
	}

	public void setData_emissao(Date data_emissao) {
		this.data_emissao = data_emissao;
	}

	public int getQtd_cartao() {
		return qtd_cartao;
	}

	public void setQtd_cartao(int qtd_cartao) {
		this.qtd_cartao = qtd_cartao;
	}

	public int getCod_cliente_fk() {
		return cod_cliente_fk;
	}

	public void setCod_cliente_fk(int cod_cliente_fk) {
		this.cod_cliente_fk = cod_cliente_fk;
	}
	
	
	
	
	

}
