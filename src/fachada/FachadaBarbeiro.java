package fachada;

import java.util.InputMismatchException;

import controladores.ControladorBarbeiro;
import entidades.Barbeiro;

public class FachadaBarbeiro {

	private static FachadaBarbeiro instance;

	private ControladorBarbeiro controladorBarbeiro = new ControladorBarbeiro();

	public FachadaBarbeiro() {
	}

	public static FachadaBarbeiro getInstanceFachada() {
		if (instance == null) {
			instance = new FachadaBarbeiro();
		}
		return instance;
	}

	public void Cadastro(Barbeiro barbeiro) {
		controladorBarbeiro.CadastrarBarbeiro(barbeiro);
	}

	public void Deletar(int codBarbeiro) {
		try {
			controladorBarbeiro.ExcluirBabeiro(codBarbeiro);
		} catch (InputMismatchException e) {
			System.out.println("Apenas numeros");
		}
		
	}

	public void imprimir() {
		controladorBarbeiro.listarBarbeiro();
	}

	public void editar(int codBarbeiro, Barbeiro barbeiro) {
		controladorBarbeiro.editarBarbeiro(codBarbeiro, barbeiro);
	}

	public boolean verificarLoginBarbeiro(String login, String senha) {

		try {
			return controladorBarbeiro.verificarLogin(login, senha);
		} catch (NullPointerException e) {
			System.out.println("Usuário ou senha Invalidos!!" + e.getMessage());

		}
		return false;

	}
}
