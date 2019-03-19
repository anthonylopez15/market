package dao;

import connection.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Marca;
import models.Produto;

public class ProdutoDAO {

    private String sql;
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;

    public ProdutoDAO() {
        this.con = ConnectionFactory.conecta();
    }

    public boolean salvar(Produto p) {
        sql = "INSERT INTO produto(nome, marcacod) values (?, ?)";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, p.getNome());
            ps.setInt(2, p.getMarcacod().getCodigo());
            ps.execute();
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro ao salvar produto" + ex.getMessage());
        } finally {
            ConnectionFactory.close(con, ps);
        }
        return false;
    }

    public List<Produto> listar() {
        sql = "SELECT * FROM produto p inner join marca m on m.codigo = p.marcacod";
        List<Produto> list = new ArrayList<>();
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Marca m = new Marca(rs.getInt("m.codigo"), rs.getString("m.nome"));
                Produto p = new Produto();
                p.setCodigo(rs.getInt("p.codigo"));
                p.setNome(rs.getString("p.nome"));
                p.setMarcacod(m);
                list.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionFactory.closeAll(con, ps, rs);
        }
        return list;
    }

    public static void main(String[] args) {
        ProdutoDAO dao = new ProdutoDAO();
        List<Produto> list = dao.listar();
        
        if (list.size() > 0) {
            for (Produto p : list) {
                System.out.println(p);
            }
        } else {
            System.out.println("Lista vazia");
        }
    }

}
