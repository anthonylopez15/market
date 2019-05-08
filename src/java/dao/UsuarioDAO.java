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
        sql = "INSERT INTO usuario(nome, login, senha, tipocod, cpf, email, rua, cep, bairrocod, rg, telefone, numero) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, u.getNome());
            ps.setString(2, u.getLogin());
            ps.setString(3, u.getSenha());
            ps.setInt(4, u.getTipocod());
            ps.setString(5, u.getCpf());
            ps.setString(6, u.getEmail());
            ps.setString(7, u.getRua());
            ps.setString(8, u.getCep());
            ps.setString(9, u.getBairrocod());
            ps.setString(10, u.getRg());
            ps.setString(11, u.getTelefone());
            ps.setString(12, u.getNumero());
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
                u.setEmail(rs.getString("u.email"));
                u.setTelefone(rs.getString("u.telefone"));
                u.setRua(rs.getString("u.rua"));
                u.setNumero(rs.getString("u.numero"));
                u.setCep(rs.getString("u.cep"));
                u.setRg(rs.getString("u.rg"));
                u.setStatus(rs.getString("u.status"));
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
                + " email = ?, rua = ?, cep = ?, numero = ?, telefone = ? WHERE codigo = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, u.getNome());
            ps.setString(2, u.getLogin());
            ps.setString(3, u.getSenha());
            ps.setString(4, u.getBairrocod());
            ps.setString(5, u.getEmail());
            ps.setString(6, u.getRua());
            ps.setString(7, u.getCep());
            ps.setString(8, u.getNumero());
            ps.setString(9, u.getTelefone());
            ps.setInt(10, u.getCodigo());
            ps.executeUpdate();
            System.out.println("Usuario alterado");
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionFactory.close(con, ps);
        }
    }
    
    public void alterarStatus(Usuario u) {
        sql = "UPDATE usuario SET status = ? WHERE codigo = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, u.getStatus());
            ps.setInt(2, u.getCodigo());
            ps.executeUpdate();
            System.out.println("Usuario alterado");
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionFactory.close(con, ps);
        }
    }

    public Usuario logar(Usuario u){
        sql = "SELECT * FROM usuario WHERE login = ? and senha = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, u.getLogin());
            ps.setString(2, u.getSenha());
            rs = ps.executeQuery();
            if(rs.next()){
                int codigo = rs.getInt("codigo");
                u = getForId(codigo);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            ConnectionFactory.closeAll(con, ps, rs);
        }
        return u;
    }
    
    public Usuario getForId(int cod){
        sql = "SELECT * FROM usuario WHERE codigo = ?";
        Usuario u = null;
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, cod);
            rs = ps.executeQuery();
            if (rs.next()){
                u = new Usuario();
                u.setCodigo(rs.getInt("codigo"));
                u.setNome(rs.getString("nome"));
                u.setLogin(rs.getString("login"));
                u.setTipocod(rs.getInt("tipocod"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return u;
    }
    public static void main(String[] args) {
        UsuarioDAO d = new UsuarioDAO();
        Usuario u = new Usuario();
        u.setSenha("senhaetal");
        u.setLogin("paulo.silva");
        u = d.logar(u);
        System.out.println(u);
    }

}
