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
import models.Usuario;

public class UsuarioDAO {

    private String sql;
    private final Connection con;
    private PreparedStatement ps;
    private ResultSet rs;

    public UsuarioDAO() {
        this.con = ConnectionFactory.conecta();
    }

    public void salvar(Usuario u) {
        sql = "INSERT INTO usuario(nome, login, senha, tipocod, cpf, telefone, endereco, cep, bairrocod) VALUES (?,?,?,?,?,?,?,?,?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, u.getNome());
            ps.setString(2, u.getLogin());
            ps.setString(3, u.getSenha());
            ps.setInt(4, u.getTipocod());
            ps.setString(5, u.getCpf());
            ps.setString(6, u.getTelefone());
            ps.setString(7, u.getEndereco());
            ps.setString(8, u.getCep());
            ps.setString(9, u.getBairrocod());
            ps.execute();
            System.out.println("Usuario ok");
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionFactory.close(con, ps);
        }
    }

    public List<Usuario> listar() {
        sql = "SELECT * FROM usuario u INNER JOIN tipo_usuario t ON u.tipocod = t.codigo "
                + "INNER JOIN bairro b ON b.codigo = u.bairrocod ";
        List<Usuario> list = new ArrayList<>();
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Usuario u = new Usuario();
                u.setCodigo(rs.getInt("u.codigo"));
                u.setNome(rs.getString("u.nome"));
                u.setLogin(rs.getString("u.login"));
                u.setSenha(rs.getString("u.senha"));
                u.setTipoDesc(rs.getString("t.descricao"));
                u.setTipocod(rs.getInt("t.codigo"));
                u.setCpf(rs.getString("u.cpf"));
                u.setTelefone(rs.getString("u.telefone"));
                u.setEndereco(rs.getString("u.endereco"));
                u.setCep(rs.getString("u.cep"));
                u.setBairrocod(rs.getString("b.codigo"));
                u.setBairroNome(rs.getString("b.nome"));
                list.add(u);
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao listar usuarios " + ex.getMessage());
        } finally {
            ConnectionFactory.closeAll(con, ps, rs);
        }
        return list;
    }

    public void alterar(Usuario u) {
        sql = "UPDATE usuario SET nome = ?, login = ?, senha = ?, bairrocod = ?, "
                + " telefone = ?, endereco = ?, cep = ? WHERE codigo = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, u.getNome());
            ps.setString(2, u.getLogin());
            ps.setString(3, u.getSenha());
            ps.setString(4, u.getBairrocod());
            ps.setString(5, u.getTelefone());
            ps.setString(6, u.getEndereco());
            ps.setString(7, u.getCep());
            ps.setInt(8, u.getCodigo());
            ps.executeUpdate();
            System.out.println("Usuario alterado");
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionFactory.close(con, ps);
        }
    }

    public static void main(String[] args) {
        UsuarioDAO d = new UsuarioDAO();
        Usuario u = new Usuario();
        u.setNome("Anthony teste");
        u.setLogin("emaill@hotmail.com");
        u.setCodigo(7);
        d.alterar(u);
//        List<Usuario> l = d.listar();
//        for (Usuario u : l) {
//            System.out.println(u);
//        }
    }

}
