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

public class MarcaDAO {

    private String sql;
    private final Connection con;
    private PreparedStatement ps;
    private ResultSet rs;

    public MarcaDAO() {
        this.con = ConnectionFactory.conecta();
    }

    public Marca salvar(Marca m) {
        sql = "insert into marca(nome) values (?);";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, m.getNome());
            ps.execute();
        } catch (SQLException ex) {
            System.out.println("Erro ao salvar marcar" + ex.getMessage());
        } finally {
            ConnectionFactory.close(con, ps);
        }
        return m;
    }

    public Marca alterar(Marca m) {
        sql = "UPDATE marca SET nome = ? WHERE codigo = ? ";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, m.getNome());
            ps.setInt(2, m.getCodigo());
            ps.execute();
            System.out.println("alterar ok ");
        } catch (SQLException ex) {
            System.out.println("Erro ao alterar marcar" + ex.getMessage());
        } finally {
            ConnectionFactory.close(con, ps);
        }
        return m;
    }

    public List<Marca> listaMarcas() {
        sql = "SELECT * FROM marca";
        List<Marca> list = new ArrayList<>();
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Marca m = new Marca();
                m.setCodigo(rs.getInt("codigo"));
                m.setNome(rs.getString("nome"));
                list.add(m);
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao listar marca " + ex.getMessage());
        } finally {
            ConnectionFactory.closeAll(con, ps, rs);
        }
        return list;
    }

    public Marca getPorCodigo(int codigo) {
        sql = "SELECT * FROM marca WHERE codigo = ?";
        Marca m = null;
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, codigo);
            rs = ps.executeQuery();
            if (rs.next()) {
                Integer cod = rs.getInt(1);
                String nome = rs.getString(2);
                m = new Marca(cod, nome);
            }
        } catch (SQLException ex) {
            Logger.getLogger(MarcaDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionFactory.closeAll(con, ps, rs);
        }
        return m;
    }

    public static void main(String[] args) {
        MarcaDAO dao = new MarcaDAO();
        List<Marca> listar = dao.listaMarcas();
        Marca m = new Marca();

    }
}
