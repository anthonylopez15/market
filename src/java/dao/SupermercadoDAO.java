package dao;

import connection.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Supermercado;

public class SupermercadoDAO {

    private String sql;
    private final Connection con;
    private PreparedStatement ps;
    private ResultSet rs;

    public SupermercadoDAO() {
        this.con = ConnectionFactory.conecta();
    }

    public Supermercado salvar(Supermercado s) {
        sql = "insert into supermercado (nome, endereco) values (?,?) ";

        try {
            ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, s.getNome());
            ps.setString(2, s.getEndereco());
            ps.executeUpdate();
            rs = ps.getGeneratedKeys();
            if (rs.next()) {
                s.setCodigo(rs.getInt(1));
            }
        } catch (SQLException ex) {
            Logger.getLogger(SupermercadoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionFactory.closeAll(con, ps, rs);
        }
        return s;
    }
    public Supermercado alterar(Supermercado s) {
        sql = "update supermercado set nome = ?, endereco = ? WHERE codigo = ? ";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, s.getNome());
            ps.setString(2, s.getEndereco());
            ps.setInt(3, s.getCodigo());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SupermercadoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionFactory.close(con, ps);
        }
        return s;
    }
    
    public Supermercado getProCodigo(int cod){
        sql = "select * from supermercado where codigo = ? ";
        Supermercado s = null;
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, cod);
            rs = ps.executeQuery();
            if (rs.next()){
                int codigo = rs.getInt("codigo");
                String nome = rs.getString("nome");
                String end = rs.getString("endereco");
                s = new Supermercado(codigo, nome, end);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SupermercadoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            ConnectionFactory.closeAll(con, ps, rs);
        }
        return s;
    }

    public List<Supermercado> listar() {
        sql = "SELECT * FROM supermercado ";
        List<Supermercado> list = new ArrayList<>();
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Supermercado s = new Supermercado();
                s.setCodigo(rs.getInt("codigo"));
                s.setNome(rs.getString("nome"));
                s.setEndereco(rs.getString("endereco"));
                list.add(s);
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao listar supermercado " + ex.getMessage());
        } finally {
            ConnectionFactory.closeAll(con, ps, rs);
        }
        return list;
    }

    public static void main(String[] args) {
        SupermercadoDAO dao = new SupermercadoDAO();
//        List<Supermercado> list = dao.listar();

        Supermercado pro = new Supermercado(null, "Teste 2", "Teste endereco");
        System.out.println(dao.salvar(pro));

//        if (list.size() > 0) {
//            for (Supermercado p : list) {
//                System.out.println(p);
//            }
//        } else {
//            System.out.println("Lista vazia");
//        }
    }
}
