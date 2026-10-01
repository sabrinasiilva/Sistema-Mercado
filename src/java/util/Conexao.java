package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class Conexao {

    /* Retorna uma conexão ativa com o banco MySQL
       Lança exceção se o driver não for encontrado ou a conexão falhar */
    public static Connection getConexao() throws ClassNotFoundException, SQLException {
        /* carrega o driver JDBC do MySQL */
        Class.forName("com.mysql.jdbc.Driver");
        /* cria e retorna a conexão com o banco sistemaMercado */
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/sistemaMercado", "root", "root");
        return con;
    }
}
