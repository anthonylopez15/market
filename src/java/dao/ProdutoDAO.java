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
    private final Connection con;
    private PreparedStatement ps;
    private ResultSet rs;

    public ProdutoDAO() {
        this.con = ConnectionFactory.conecta();
    }

    public Produto salvar(Produto p) {
        sql = "INSERT INTO produto(nome, marcacod) values (?, ?, ?)";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, p.getNome());
            ps.setString(2, p.getDescricao());
            ps.setInt(3, p.getMarcacod().getCodigo());
            ps.execute();
        } catch (SQLException ex) {
            System.out.println("Erro ao salvar produto" + ex.getMessage());
        } finally {
            ConnectionFactory.close(con, ps);
        }
        return p;
    }
    
    public Produto alterar(Produto p) {
        sql = "UPDATE produto set nome = ?,  descricao = ?, status = ? where codigo = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, p.getNome());
            ps.setString(2, p.getDescricao());
            ps.setString(3, p.getStatus());
            ps.setInt(4, p.getCodigo());
            ps.executeUpdate();
            System.out.println("Produto altera ok");
        } catch (SQLException ex) {
            System.out.println("Erro ao alterar produto" + ex.getMessage());
        } finally {
            ConnectionFactory.close(con, ps);
        }
        return p;
    }

    public List<Produto> listar(String status) {
        sql = "SELECT * FROM produto p left join marca m on m.codigo = p.marcacod where p.status = '"+ status +"' ";
        List<Produto> list = new ArrayList<>();
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Marca m = new Marca(rs.getInt("m.codigo"), rs.getString("m.nome"));
                if (m.getNome() == null) {
                    m.setNome("Indefinido");
                }
                Produto p = new Produto();
                p.setCodigo(rs.getInt("p.codigo"));
                p.setNome(rs.getString("p.nome"));
                p.setDescricao(rs.getString("p.descricao"));
                p.setStatus(rs.getString("p.status"));
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
    public List<Produto> listAll() {
        sql = "SELECT * FROM produto p left join marca m on m.codigo = p.marcacod";
        List<Produto> list = new ArrayList<>();
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Marca m = new Marca(rs.getInt("m.codigo"), rs.getString("m.nome"));
                if (m.getNome() == null) {
                    m.setNome("Indefinido");
                }
                Produto p = new Produto();
                p.setCodigo(rs.getInt("p.codigo"));
                p.setNome(rs.getString("p.nome"));
                p.setDescricao(rs.getString("p.descricao"));
                p.setStatus(rs.getString("p.status"));
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

}