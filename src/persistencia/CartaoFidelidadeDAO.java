package persistencia;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import entidades.CartaoFidelidade;
import util.Conexao;

public class CartaoFidelidadeDAO implements CRUD<CartaoFidelidade> {
	
	Conexao conex = new Conexao();
	CartaoFidelidade cartao = new CartaoFidelidade();
	
	@Override
	public void Create(CartaoFidelidade objeto) {
		conex.conexao();
		
		try {
			PreparedStatement pst = conex.con.prepareStatement("insert into cartao_fidelidade"
					+ "(data_vencimento, data_emissao, qtd_cartao, cod_cliente_fk) values (?, ?, ?, ?)");
			
			pst.setDate(1, objeto.getData_vencimento());
			pst.setDate(2, objeto.getData_emissao());
			pst.setInt(3, objeto.getQtd_cartao());
			pst.setInt(4, objeto.getCod_cliente_fk());
			pst.execute();
			
			System.err.println("Dados inseridos com Sucesso!");
			
		} catch (SQLException e) {
			System.out.println("Erro ao inserir os dadods: \n" + e.getMessage());
		}
		
		conex.desconecta();
		
	}

	@Override
	public void Reader() {
		conex.conexao();
		
		try {
			PreparedStatement pst = conex.con.prepareStatement("Select * from cartao_fidelidade ");
			ResultSet resultado = pst.executeQuery();
			
			while(resultado.next()) {
				int codCartao = resultado.getInt("cod_cartao");
				String dtVencimento = resultado.getString("data_vencimento");
				String dtEmissao = resultado.getString("data_emissao");
				int qtdCartao = resultado.getInt("qtd_cartao");
				int codCliente_fk = resultado.getInt("cod_cliente_fk");
				
				System.err.println("Código Cartão :" + codCartao);
				System.err.println("Data de Vencimento :" + dtVencimento);
				System.err.println("Data de Emissao :" + dtEmissao);
				System.err.println("Quantidade Cartão :" + qtdCartao);
				System.err.println("Código do Cliente:" + codCliente_fk);
				System.err.println("=================================================================\n");
				
				
			}
		} catch (SQLException e) {
			System.out.println("ERRO AO EFETUAR A BUSCA" + e.getMessage());
		}
		
		conex.desconecta();
		
	}

	@Override
	public void Update(int id, CartaoFidelidade objeto) {
		conex.conexao();
		
		try {
			PreparedStatement pst = conex.con.prepareStatement("UPDATE cartao_fidelidade "
					+ "set data_vencimento=?, data_emissao=?, qtd_cartao=?, cod_cliente_fk=? where cod_cartao=?");
			
			pst.setDate(1, objeto.getData_vencimento());
			pst.setDate(2, objeto.getData_emissao());
			pst.setInt(3, objeto.getQtd_cartao());
			pst.setInt(4, objeto.getCod_cliente_fk());
			pst.setInt(5, id);
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
			PreparedStatement pst = conex.con.prepareStatement("delete from cartao_fidelidade where cod_cartao=?");
			pst.setInt(1, id);
			pst.execute();
			System.err.println("Operação realizada com Sucesso");
			
		} catch (SQLException e) {
			System.out.println("Erro ao excluir o Barbeiro" + e.getMessage());
		}
		conex.desconecta();
		
	}

}
