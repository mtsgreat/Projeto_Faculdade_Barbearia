package entidades;

import java.text.ParseException;

public class Barbeiro {
	private int codBarbeiro;
	private String nomebarbeiro;
	private String cpfbarbeiro;
	private String telbarbeiro;
	private String login;
	private String senha;

	// Se o LOGIN E SENHA pegar, adicionar no constutor e no metodo do banco
	public Barbeiro() {

	}

	public Barbeiro(String nomebarbeiro, String cpfbarbeiro, String telbarbeiro, String login, String senha) throws ParseException {

		this.nomebarbeiro = nomebarbeiro;
		this.cpfbarbeiro = cpfbarbeiro;
		this.telbarbeiro = telbarbeiro;
		this.login = login;
		this.senha = senha;
	}

	public String getNomebarbeiro() {
		return nomebarbeiro;
	}

	public void setNomebarbeiro(String nomebarbeiro) {
		this.nomebarbeiro = nomebarbeiro;
	}

	public String getCpfbarbeiro() {
		return cpfbarbeiro;

	}

	public void setCpfbarbeiro(String cpfbarbeiro) {
		this.cpfbarbeiro = cpfbarbeiro;
	}

	public String getTelbarbeiro() {
		return telbarbeiro;
	}

	public void setTelbarbeiro(String telbarbeiro) {
		this.telbarbeiro = telbarbeiro;
	}

	public int getCodBarbeiro() {
		return codBarbeiro;
	}

	public void setCodBarbeiro(int codBarbeiro) {
		this.codBarbeiro = codBarbeiro;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	
}
