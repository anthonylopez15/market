package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ConnectionFactory {

    private static final String URL = "jdbc:mysql://localhost/mercado";
    private static final String USER = "root";
    private static final String PASSWORD = "1234";

    public static Connection conecta() {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(URL, USER, PASSWORD);
//            System.out.println("[ConnectionManager]: Contectado ao banco");
        } catch (ClassNotFoundException e) {
            System.out.println("Driver nao encontrado " + e.getMessage());
        } catch (SQLException e) {
            System.out.println("Erro ao obter a conexao" + e.getMessage());
        }
        return con;
    }
    
    public static void close(Connection con) {
        try {
            if (con != null) {
                con.close();
            }
            System.out.println("Fechou conexao");
        } catch (SQLException ex) {
            Logger.getLogger(ConnectionFactory.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void close(Connection con, Statement stmt) {
        try {
            if (stmt != null) {
                stmt.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(ConnectionFactory.class.getName()).log(Level.SEVERE, null, ex);
        }
        ConnectionFactory.close(con);
    }

    public static void closeAll(Connection conn, Statement st, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException e) {
            System.out.println("---> Detalhamento do erro: " + e.getMessage());
        }
        ConnectionFactory.close(conn, st);
    }
    
//    public static void main(String[] args) {
//        conecta();
//    }
}
