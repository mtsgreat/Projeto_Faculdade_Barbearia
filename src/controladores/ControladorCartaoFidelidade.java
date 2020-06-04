package controladores;

import entidades.CartaoFidelidade;
import persistencia.CartaoFidelidadeDAO;

public class ControladorCartaoFidelidade {
	private CartaoFidelidadeDAO cartaoFidelidadeDAO = new CartaoFidelidadeDAO();
	
	public void cadastrar(CartaoFidelidade objeto) {
		cartaoFidelidadeDAO.Create(objeto);
		
	}
	
	
	public void listar() {
		cartaoFidelidadeDAO.Reader();
	}
	
	
	public void atualizar(int id, CartaoFidelidade objeto) {
		cartaoFidelidadeDAO.Update(id, objeto);
		
	}
	
	
	public void excluir(int id) {
		cartaoFidelidadeDAO.Delete(id);
	}

}
