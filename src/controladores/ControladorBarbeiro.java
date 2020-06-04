package controladores;

import entidades.Barbeiro;
import persistencia.BarbeiroDAO;


public class ControladorBarbeiro {
	private BarbeiroDAO repositorioBarbeiro = new BarbeiroDAO();
	
	public void CadastrarBarbeiro(Barbeiro barbeiro) {
		repositorioBarbeiro.Create(barbeiro);
	}
	

	public void ExcluirBabeiro(int codBarbeiro) {
		repositorioBarbeiro.Delete(codBarbeiro);
	}
	
	
	public void listarBarbeiro() {
		repositorioBarbeiro.Reader();
	}
	
	
	public void editarBarbeiro(int codigoBarbeiro, Barbeiro barbeiro) {
		repositorioBarbeiro.Update(codigoBarbeiro, barbeiro);
	}
	
	
	
	public boolean verificarLogin(String login, String senha){
		
				return repositorioBarbeiro.Login(login, senha);
			
		
		
	}
	
}
