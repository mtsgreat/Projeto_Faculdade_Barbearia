package util;

import java.sql.*;

import javax.swing.JOptionPane;

public class Conexao {

	public Statement stm;
	public ResultSet rs;
	private String drive = "org.postgresql.Driver";
	private String caminho = "jdbc:postgresql://localhost:5432/Barbearia";
	private String usuario = "postgres";
	private String senha = "12345";
	public Connection con;

	public void conexao() {

		try {
			System.setProperty("jdbc.Drivers", drive);
			con = DriverManager.getConnection(caminho, usuario, senha);
			System.err.println("Banco de dados Conectado\n");
		} catch (SQLException e) {
			JOptionPane.showMessageDialog(null, "Erro ao se conectar as Banco de Dados :\n" + e.getMessage());
		}
	}

	public void executaSql(String sql) {
		try {
			stm = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs = stm.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Erro no EXECUTASQL"); 
			e.printStackTrace();
		}
		
	}
	
	
	public void desconecta() {
		try {
			con.close();
			//System.err.println("Banco de dados desconectado");
		} catch (SQLException e) {
			JOptionPane.showMessageDialog(null, "Erro ao fechar a conexão com o Banco de dados : \n" + e.getMessage());
		}
	}

}
