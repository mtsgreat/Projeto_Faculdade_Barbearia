package persistencia;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import entidades.Barbeiro;
import util.Conexao;

public class BarbeiroDAO implements CRUDBarbeiro {

	Conexao conex = new Conexao();
	Barbeiro barbeiro = new Barbeiro();

	@Override
	public void Create(Barbeiro barbeiro) {
		conex.conexao();
		try {
			PreparedStatement pst = conex.con.prepareStatement(
					"insert into barbeiro (nome_barbeiro, telefone_barbeiro, cpf_barbeiro, login, senha) values (?,?,?,?,?)");
			pst.setString(1, barbeiro.getNomebarbeiro());
			pst.setString(2, barbeiro.getTelbarbeiro());
			pst.setString(3, barbeiro.getCpfbarbeiro());
			pst.setString(4, barbeiro.getLogin());
			pst.setString(5, barbeiro.getSenha());
			pst.execute();
			System.err.println("Dados inseridos com Sucesso!");
		} catch (SQLException e) {
			System.out.println("Erro ao inserir os dadods: \n" + e);
		}

		conex.desconecta();

	}

	@Override
	public void Reader() {
		conex.conexao();
		try {
			PreparedStatement pst = conex.con.prepareStatement("SELECT * FROM barbeiro");
			ResultSet resultado = pst.executeQuery();

			while (resultado.next()) {
				Integer codBarbeiro = resultado.getInt("cod_barbeiro");
				String nomeBarbiero = resultado.getString("nome_barbeiro");
				String telBarbeiro = resultado.getString("telefone_barbeiro");
				String cpfBarbeiro = resultado.getString("cpf_barbeiro");
				String usuarioBabarbeiro = resultado.getString("login");
				String senhaBabarbeiro = resultado.getString("senha");
				
				System.err.println("Codigo Barbeiro :" + codBarbeiro);
				System.err.println("Nome :" + nomeBarbiero);
				System.err.println("Telefone :" + telBarbeiro);
				System.err.println("CPF :" + cpfBarbeiro);
				System.err.println("Usuario" + usuarioBabarbeiro);
				System.err.println("Senha" + senhaBabarbeiro);
				System.err.println("=================================================================\n");

			}
		} catch (SQLException e) {
			System.out.println("ERRO AO EFETUAR A BUSCA" + e.getMessage());;
		}
		conex.desconecta();
	}

	@Override
	public void Update(int cod_barbeiro, Barbeiro barbeiro) {
		conex.conexao();
		try {
			PreparedStatement pst = conex.con.prepareStatement("UPDATE barbeiro set nome_barbeiro=?, "
					+ "telefone_barbeiro=?, cpf_barbeiro=?, login=?, senha=?  where cod_barbeiro=?");

			pst.setString(1, barbeiro.getNomebarbeiro());
			pst.setString(2, barbeiro.getTelbarbeiro());
			pst.setString(3, barbeiro.getCpfbarbeiro());
			pst.setString(4, barbeiro.getLogin());
			pst.setString(5, barbeiro.getSenha());
			pst.setInt(6, cod_barbeiro);
			pst.execute();

			System.err.println("Dados Alterados com Sucesso!!");
		} catch (SQLException e) {
			System.out.println("ERRO NA ALTERAÇÃO DOS DADOS \n" + e.getMessage());
		}

		conex.desconecta();
	}

	@Override
	public void Delete(int id) {
		conex.conexao();
		try {
			PreparedStatement pst = conex.con.prepareStatement("delete from barbeiro where cod_barbeiro=?");
			pst.setInt(1, id);
			pst.execute();
			System.err.println("Operação realizada com Sucesso");
		} catch (SQLException e) {
			System.out.println("Erro ao excluir o Barbeiro" + e.getMessage());
			
		}

		conex.desconecta();
	}

	public Boolean Login(String login, String senha) {

		conex.conexao();

		PreparedStatement pst;
		try {
			pst = conex.con.prepareStatement("select * from barbeiro where login =? and senha=?");

			pst.setString(1, login);
			pst.setString(2, senha);
			ResultSet resultado = pst.executeQuery();

			while (resultado.next()) {
				resultado.getString("login");
				resultado.getString("senha");
				String nomeUsuario = resultado.getString("nome_barbeiro");

				if (resultado.getString("login").equals(login) && resultado.getString("senha").equals(senha)) {
					System.err.println("BEM VINDO," + nomeUsuario);
					return true;
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("Usuário ou Senha Invalidos!!!");
		conex.desconecta();
		return false;

	}

}
