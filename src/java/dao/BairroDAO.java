
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
import models.Bairro;
import models.Marca;


public class BairroDAO {
    private String sql;
    private final Connection con;
    private PreparedStatement ps;
    private ResultSet rs;

    public BairroDAO() {
        this.con = ConnectionFactory.conecta();
    }
    
    public Bairro salvar(Bairro b) {
        sql = "insert into bairro(nome) values (?);";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, b.getNome());
            ps.execute();
        } catch (SQLException ex) {
            System.out.println("Erro ao salvar bairro" + ex.getMessage());
        } finally {
            ConnectionFactory.close(con, ps);
        }
        return b;
    }

    public Bairro alterar(Bairro b) {
        sql = "UPDATE bairro SET nome = ? WHERE codigo = ? ";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, b.getNome());
            ps.setInt(2, b.getCodigo());
            ps.execute();
            System.out.println("alterar ok ");
        } catch (SQLException ex) {
            System.out.println("Erro ao alterar bairro" + ex.getMessage());
        } finally {
            ConnectionFactory.close(con, ps);
        }
        return b;
    }

    public List<Bairro> listar() {
        sql = "SELECT * FROM bairro";
        List<Bairro> list = new ArrayList<>();
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Bairro b = new Bairro();
                b.setCodigo(rs.getInt("codigo"));
                b.setNome(rs.getString("nome"));
                list.add(b);
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao listar bairro " + ex.getMessage());
        } 
        return list;
    }

    public Bairro getPorCodigo(int codigo) {
        sql = "SELECT * FROM bairro WHERE codigo = ?";
        Bairro b = null;
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, codigo);
            rs = ps.executeQuery();
            if (rs.next()) {
                Integer cod = rs.getInt(1);
                String nome = rs.getString(2);
                b = new Bairro(cod, nome);
            }
        } catch (SQLException ex) {
            System.out.println("Erro get por codigo bairro " + ex.getMessage());
        } 
        return b;
    }
}
