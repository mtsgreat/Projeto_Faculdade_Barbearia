package persistencia;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import entidades.Cliente;
import util.Conexao;

public class ClienteDAO implements CRUD<Cliente>{
	
	Conexao conex = new Conexao();
	Cliente cliente = new Cliente();

	@Override
	public void Create(Cliente objeto) {
		conex.conexao();
		
		try {
			PreparedStatement pst = conex.con.prepareStatement("insert into cliente "
					+ "(nome_cliente, cpf_cliente, telefone_cliente, cod_barbeiro_fk) values (?, ?, ?, ?)");
			
			pst.setString(1, objeto.getNomeCliente());
			pst.setString(2, objeto.getCpfCliente());
			pst.setString(3, objeto.getTelCliente());
			pst.setInt(4, objeto.getCodBarbeiroFk());
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
			PreparedStatement pst = conex.con.prepareStatement("Select * from cliente");
			ResultSet resultado = pst.executeQuery();
			
			while(resultado.next()) {
				int codCliente = resultado.getInt("cod_cliente");
				String nomeCliente = resultado.getString("nome_cliente");
				String cpfCliente = resultado.getString("cpf_cliente");
				String telCliente = resultado.getString("telefone_cliente");
				int codBarbeiroFK = resultado.getInt("cod_barbeiro_fk"); 
				
				System.err.println("Código Cliente :" + codCliente);
				System.err.println("Nome :" + nomeCliente);
				System.err.println("CPF :" + cpfCliente);
				System.err.println("Telefone :" + telCliente);
				System.err.println("Corta o cabelo com o Barbeiro:" + codBarbeiroFK);
				System.err.println("=================================================================\n");
				
				
			}
		} catch (SQLException e) {
			System.out.println("ERRO AO EFETUAR A BUSCA" + e.getMessage());;
		}
		
		
		conex.desconecta();
		
	}

	@Override
	public void Update(int id, Cliente objeto) {
		conex.conexao();
		
		try {
			PreparedStatement pst = conex.con.prepareStatement("UPDATE cliente "
					+ "set nome_cliente=?, cpf_cliente=?, telefone_cliente=?, cod_barbeiro_fk=? where cod_cliente =?");
			
			pst.setString(1, objeto.getNomeCliente());
			pst.setString(2, objeto.getCpfCliente());
			pst.setString(3, objeto.getTelCliente());
			pst.setInt(4, objeto.getCodBarbeiroFk());
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
			PreparedStatement pst = conex.con.prepareStatement("delete from cliente where cod_cliente=?");
			pst.setInt(1, id);
			pst.execute();
			System.err.println("Operação realizada com Sucesso");
		} catch (SQLException e) {
			System.out.println("Erro ao excluir o Barbeiro" + e.getMessage());
		}
		
		
		conex.desconecta();
		
	}


	

}
