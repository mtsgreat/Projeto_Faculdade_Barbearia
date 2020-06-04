package fachada;

import controladores.ControladorCartaoFidelidade;

import entidades.CartaoFidelidade;

public class FachadaCartaoFidelidade {
	
	public static FachadaCartaoFidelidade instance;
	
	private ControladorCartaoFidelidade controladorCartao= new ControladorCartaoFidelidade();
	
	public FachadaCartaoFidelidade() {}
	
	public static FachadaCartaoFidelidade getInstanceFachada() {
		if (instance == null) {
			instance = new FachadaCartaoFidelidade();
		}
		return instance;
	}
	
	
	public void cadastarCartao(CartaoFidelidade objeto) {
		controladorCartao.cadastrar(objeto);
		
	}

	
	public void listarCartoes() {
		controladorCartao.listar();
	}
	
	
	public void atualizarCartao(int id, CartaoFidelidade objeto) {
		controladorCartao.atualizar(id, objeto);
	}
	
	
	public void excluirCartao(int id) {
		controladorCartao.excluir(id);
	}
}
