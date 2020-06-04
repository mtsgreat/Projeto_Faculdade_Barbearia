package principal;

import java.util.InputMismatchException;
import java.util.Scanner;

import entidades.Barbeiro;
import entidades.CartaoFidelidade;
import entidades.Cliente;
import fachada.FachadaBarbeiro;
import fachada.FachadaCartaoFidelidade;
import fachada.FachadaCliente;
import utilexceptions.ApenasNumerosExceptions;
import utilexceptions.FormatoDataException;

public class Principal {

	public static void main(String[] args) throws Exception, InputMismatchException, java.text.ParseException{
		Scanner scan = new Scanner(System.in);
		FachadaBarbeiro fachadaBarbeiro = FachadaBarbeiro.getInstanceFachada();
		FachadaCliente fachadaCliente = FachadaCliente.getInstanceFachada();
		FachadaCartaoFidelidade fachadaCartao = FachadaCartaoFidelidade.getInstanceFachada();

		System.err.println("SENHA DE TESTE\n"
				+ "Login: mtsgreat\n"
				+ "Senha: 12345");
		System.out.println("");
		
		System.out.println("Informe se login:");
		String login = scan.next();
		System.out.println("Informe sua senha:");
		String senha = scan.next();
		boolean res  = fachadaBarbeiro.verificarLoginBarbeiro(login, senha);

		while (res) {
			System.out.println("======== SISTEMA BARBEARIA ========");
			System.out.println("1 - GERENCIAR BARBEIRO");
			System.out.println("2 - GERENCIAR CLIENTE");
			System.out.println("3 - GERENCIAR CARTÕES FIDELIDADE");

			try {
				int opcaoM = scan.nextInt();

				if (opcaoM == 1) {
					while (true) {

						System.out.println("==== MENU BARBEIRO ====");
						System.out.println("1 - PARA CADASTRAR UM BARBEIRO");
						System.out.println("2 - APAGAR BARBEIRO");
						System.out.println("3 - LISTAR TODOS OS BARBEIROS");
						System.out.println("4 - EDITAR BABEIRO");
						System.out.println("5 - SAIR");

						int opcaoB = scan.nextInt();

						if (opcaoB == 1) {
							System.out.println("Informe o nome do Barbeiro: ");
							String nomeBarbeiro = scan.next();
							System.out.println("Informe o CPF do Barbeiro :");
							String cpfBarbeiro = scan.next();
							System.out.println("Informe o Telefone:");
							String telBarbeiro = scan.next();
							System.out.println("Informe o Usuário: ");
							String usuarioBarbeiro = scan.next();
							System.out.println("Informe a Senha :");
							String senhaBarbeiro = scan.next();
							fachadaBarbeiro.Cadastro(new Barbeiro(nomeBarbeiro, cpfBarbeiro, telBarbeiro,
									usuarioBarbeiro, senhaBarbeiro));

						} else if (opcaoB == 2) {
							System.out.println("informe o nome do Código :");

							int codBabarbeiro = scan.nextInt();
							System.out.println("");
							fachadaBarbeiro.Deletar(codBabarbeiro);

						} else if (opcaoB == 3) {
							fachadaBarbeiro.imprimir();

						} else if (opcaoB == 4) {
							System.out.println("Informe o Código do Barbeiro:");

							int codBarbeiro = scan.nextInt();

							System.out.println("EDITAR INFORAÇÕES... ");
							System.out.println("Informe o nome do Barbeiro:");
							String nomeBarbeiro = scan.next();
							System.out.println("Informe o CPF do Barbeiro :");
							String cpfBarbeiro = scan.next();
							System.out.println("Informe o Telefone:");
							String telBarbeiro = scan.next();
							System.out.println("Informe o Usuário: ");
							String usuarioBarbeiro = scan.next();
							System.out.println("Informe a Senha :");
							String senhaBarbeiro = scan.next();

							Barbeiro BarbeiroEditado = new Barbeiro(nomeBarbeiro, cpfBarbeiro, telBarbeiro,
									usuarioBarbeiro, senhaBarbeiro);
							fachadaBarbeiro.editar(codBarbeiro, BarbeiroEditado);

						} else if (opcaoB == 5) {
							break;
						}
					}

				} else if (opcaoM == 2) {
					while (true) {
						System.out.println("==== MENU CLIENTE ====");
						System.out.println("1 - PARA CADASTAR CLIENTE");
						System.out.println("2 - APAGAR CLIENTE");
						System.out.println("3 - LISTAR TODOS OS CLIENTES");
						System.out.println("4 - EDITAR CLIENTE");
						System.out.println("5 - SAIR");
						int opcaoC = scan.nextInt();

						if (opcaoC == 1) {
							System.out.println("Informe o nome:");
							String nomeCli = scan.next();
							System.out.println("Informe o CPF:");
							String cpfCli = scan.next();
							System.out.println("Informe o Telefone:");
							String telCli = scan.next();
							System.out.println("Informe o Código do Barbeiro que Fez o Cadastro:");
							int codBarbeiroC = scan.nextInt();
							fachadaCliente.cadastrarCliente(new Cliente(nomeCli, cpfCli, telCli, codBarbeiroC));

						} else if (opcaoC == 2) {
							System.out.println("Informe o código do Cliente:");
							int idCliente = scan.nextInt();
							fachadaCliente.excluirBarbeiro(idCliente);
						} else if (opcaoC == 3) {
							fachadaCliente.imprimirCliente();
						} else if (opcaoC == 4) {
							System.out.println("EDITAR INFORMAÇÕES...");
							System.out.println("Informe o código do Cliente:");
							int codCliente = scan.nextInt();

							System.out.println("Informe o nome:");
							String nomeCli = scan.next();
							System.out.println("informe o CPF:");
							String cpfCli = scan.next();
							System.out.println("Informe o Telefone:");
							String telCli = scan.next();
							System.out.println("Codigo do barbeiro:");
							int codBababeiroFk = scan.nextInt();

							fachadaCliente.atulizarCliente(codCliente,
									new Cliente(nomeCli, cpfCli, telCli, codBababeiroFk));

						} else if (opcaoC == 5) {
							break;
						}
					}
				} else if (opcaoM == 3) {
					while (true) {
						System.out.println("==== MENU CARTÃO FIDELIDADE ====");
						System.out.println("1 - PARA FAZER CARTÃO");
						System.out.println("2 - APAGAR CARTÃO");
						System.out.println("3 - LISTAR TODOS OS CARTÕES");
						System.out.println("4 - EDITAR CARTÃO");
						System.out.println("5 - SAIR");
						int opcaoCartao = scan.nextInt();

						if (opcaoCartao == 1) {
							System.out.println("Informe a data de Vencimento:");
							String data_vencimento = scan.next();
							System.out.println("Informe a data de Emissão:");
							String data_emissao = scan.next();
							System.out.println("Informe a qtd de cartoes:");
							int qtd_cartao = scan.nextInt();
							System.out.println("Informe o Código do Cliente:");
							int cod_cliente_fk = scan.nextInt();
							fachadaCartao.cadastarCartao(
									new CartaoFidelidade(data_vencimento, data_emissao, qtd_cartao, cod_cliente_fk));
						} else if (opcaoCartao == 2) {
							System.out.println("Informe o Código do cartão:");
							int cod_cartão = scan.nextInt();
							fachadaCartao.excluirCartao(cod_cartão);

						} else if (opcaoCartao == 3) {
							fachadaCartao.listarCartoes();
						} else if (opcaoCartao == 4) {
							System.out.println("EDITAR INFORMAÇÕES...");
							System.out.println("Informe o Código do cartão para alteração:");
							int cod_cartao = scan.nextInt();

							System.out.println("Informe a data de Vencimento:");
							String data_vencimento = scan.next();
							System.out.println("Informe a data de Emissão:");
							String data_emissao = scan.next();
							System.out.println("Informe a qtd de cartoes:");
							int qtd_cartao = scan.nextInt();
							System.out.println("Informe o Código do Cliente:");
							int cod_cliente_fk = scan.nextInt();
							fachadaCartao.atualizarCartao(cod_cartao,
									new CartaoFidelidade(data_vencimento, data_emissao, qtd_cartao, cod_cliente_fk));

						} else if (opcaoCartao == 5) {
							break;
						}

					}
				}else {
					System.out.println("Informe Válido pra o MENU\n");
				}
			} catch (InputMismatchException e) {
				throw new ApenasNumerosExceptions();
			}catch (java.text.ParseException e) {
				throw new FormatoDataException();
			}
			
		}
		
		
	}
	

}
