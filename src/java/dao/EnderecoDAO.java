package dao;

import connection.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Endereco;

public class EnderecoDAO {

    private String sql;
    private final Connection con;
    private PreparedStatement ps;
    private ResultSet rs;

    public EnderecoDAO() {
        this.con = ConnectionFactory.conecta();
    }

    public int salvar(Endereco e) {
        sql = "INSERT INTO endereco (rua, numero, cep, bairrocod) values (?,?,?,?)";
        int cod = 0;
        try {
            ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, e.getRua());
            ps.setString(2, e.getNumero());
            ps.setString(3, e.getCep());
            ps.setString(4, e.getBairrocod());
            ps.executeUpdate();
            rs = ps.getGeneratedKeys();
            if (rs.next()) {
                cod = rs.getInt(1);
            }

        } catch (SQLException ex) {
            Logger.getLogger(EnderecoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
//            ConnectionFactory.closeAll(con, ps, rs);
        }
        return cod;
    }

    public void alterar(Endereco e) {
        sql = "UPDATE endereco SET rua = ?, numero = ?, cep = ?, bairrocod = ? WHERE codigo = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, e.getRua());
            ps.setString(2, e.getNumero());
            ps.setString(3, e.getCep());
            ps.setString(4, e.getBairrocod());
            ps.setInt(5, e.getCodigo());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(EnderecoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Endereco buscarPorCod(int codigo) {
        sql = "select * from endereco e inner join bairro b on e.bairrocod = b.codigo where e.codigo = ? ";
        Endereco e = new Endereco();
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, codigo);
            rs = ps.executeQuery();
            if (rs.next()) {
                e.setRua(rs.getString("e.rua"));
                e.setNumero(rs.getString("e.numero"));
                e.setCep(rs.getString("e.cep"));
                e.setBairrocod(rs.getString("b.nome"));
            }

        } catch (SQLException ex) {
            Logger.getLogger(EnderecoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return e;
    }

}
