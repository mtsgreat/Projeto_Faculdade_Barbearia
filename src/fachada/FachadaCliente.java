package fachada;

import controladores.ControladorCliente;
import entidades.Cliente;

public class FachadaCliente {

	public static FachadaCliente instance;

	private ControladorCliente controladorCliente = new ControladorCliente();

	private FachadaCliente() {
	}

	public static FachadaCliente getInstanceFachada() {
		if (instance == null) {
			instance = new FachadaCliente();
		}
		return instance;
	}

	public void cadastrarCliente(Cliente objeto) {
		controladorCliente.cadastrar(objeto);
	}
	
	
	public void imprimirCliente() {
		controladorCliente.listar();
	}
	
	
	public void atulizarCliente(int id, Cliente objeto) {
		controladorCliente.atualizar(id, objeto);
	}
	
	
	public void excluirBarbeiro(int idCliente) {
		controladorCliente.excluir(idCliente);
	}
}
