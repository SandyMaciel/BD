package trabalho;
import java.sql.*;
import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.SQLException;

/**
 * Created by Sandy on 09/05/2016.
 */
public class Conexao {
    public static void main(String[] args) throws SQLException, ClassNotFoundException {

        String driverName = "com.mysql.jdbc.Driver";

        Class.forName(driverName);

        String serverName = "localhost";    //caminho do servidor do BD

        String mydatabase ="trabalhodbiptu";        //nome do seu banco de dados

        String url = "jdbc:mysql://" + serverName + "/" + mydatabase;

        String username = "root";        //nome de um usuário de seu BD

        String password = "sandy";      //sua senha de acesso

        Connection connection = DriverManager.getConnection(url, username, password);


        System.out.println("args = [" + connection + "]");

        String sql = "SELECT * FROM BAIRRO";
        PreparedStatement ps = connection.prepareStatement(sql);

        //Executa o comando de consulta aonde guarda os dados retornados dentro do ResultSet.
//Pelo fato de gerar uma lista de valores, é necessário percorrer os dados através do laço while
        ResultSet rs = ps.executeQuery();
//Faz a verificação de enquanto conter registros, percorre e resgata os valores
        while(rs.next()){
            //Recupera valor referente ao nome da coluna
            int nome = rs.getInt("NOME");
            //Recupera o índice do campo referente ao campo nome
            String representante = rs.getString("representante");
            int tel_contato = rs.getInt("TEL_CONTATO");

            System.out.printf("Código %d: %s - %d | Salário: \n", nome, representante,tel_contato);
        }
    }
}
