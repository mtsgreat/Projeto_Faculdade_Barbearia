package entidades;

public class Cliente {
	private int codCliente;
	private String nomeCliente;
	private String cpfCliente;
	private String telCliente;
	int codBarbeiroFk;

	public Cliente() {

	}

	public Cliente(String nomeCliente, String cpfCliente, String telCliente, int codBarbeiroFk) {

		this.nomeCliente = nomeCliente;
		this.cpfCliente = cpfCliente;
		this.telCliente = telCliente;
		this.codBarbeiroFk = codBarbeiroFk;
	}

	public int getCodCliente() {
		return codCliente;
	}

	public void setCodCliente(int codCliente) {
		this.codCliente = codCliente;
	}

	public String getNomeCliente() {
		return nomeCliente;
	}

	public void setNomeCliente(String nomeCliente) {
		this.nomeCliente = nomeCliente;
	}

	public String getCpfCliente() {
		return cpfCliente;
	}

	public void setCpfCliente(String cpfCliente) {
		this.cpfCliente = cpfCliente;
	}

	public String getTelCliente() {
		return telCliente;
	}

	public void setTelCliente(String telCliente) {
		this.telCliente = telCliente;
	}

	public int getCodBarbeiroFk() {
		return codBarbeiroFk;
	}

	public void setCodBarbeiroFk(int codBarbeiroFk) {
		this.codBarbeiroFk = codBarbeiroFk;
	}

}
