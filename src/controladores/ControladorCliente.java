package controladores;

import entidades.Cliente;
import persistencia.ClienteDAO;

public class ControladorCliente {
	private ClienteDAO clienteDao = new ClienteDAO();
	
	public void cadastrar(Cliente objeto) {
		clienteDao.Create(objeto);
		
	}
	
	
	public void listar() {
		clienteDao.Reader();
	}
	
	
	
	public void atualizar(int id, Cliente objeto) {
		clienteDao.Update(id, objeto);
		
	}
	
	
	public void excluir(int codCliente) {
		clienteDao.Delete(codCliente);
	}

}
