
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
import models.Endereco;
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
        sql = "INSERT INTO usuario(nome, login, senha, tipocod, cpf, email, rg, telefone, enderecocod) VALUES (?,?,?,?,?,?,?,?,?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, u.getNome());
            ps.setString(2, u.getLogin());
            ps.setString(3, u.getSenha());
            ps.setInt(4, u.getTipocod());
            ps.setString(5, u.getCpf());
            ps.setString(6, u.getEmail());
            ps.setString(7, u.getRg());
            ps.setString(8, u.getTelefone());
            ps.setString(9, u.getEndereco());
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
                + " INNER JOIN endereco e on e.codigo = u.enderecocod";
        List<Usuario> list = new ArrayList<>();
        EnderecoDAO eDao = new EnderecoDAO();
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
                u.setRg(rs.getString("u.rg"));
                u.setStatus(rs.getString("u.status"));
                if (rs.getString("u.enderecocod") != null) {
                    int enderecocod = rs.getInt("u.enderecocod");
                    u.setEndereco(rs.getString("u.enderecocod"));
                    u.setE(eDao.buscarPorCod(enderecocod));
                }

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
        sql = "UPDATE usuario SET nome = ?, login = ?, senha = ?, email = ?, telefone = ? WHERE codigo = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, u.getNome());
            ps.setString(2, u.getLogin());
            ps.setString(3, u.getSenha());
            ps.setString(4, u.getEmail());
            ps.setString(5, u.getTelefone());
            ps.setInt(6, u.getCodigo());
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
    public void alterarCliente(Usuario u) {
        sql = "UPDATE usuario SET nome = ?, senha = ?, email = ?, telefone = ? WHERE codigo = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, u.getNome());
            ps.setString(2, u.getSenha());
            ps.setString(3, u.getEmail());
            ps.setString(4, u.getTelefone());
            ps.setInt(5, u.getCodigo());
            ps.executeUpdate();
            System.out.println("cliente alterado");
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionFactory.close(con, ps);
        }
    }

    public Usuario logar(Usuario u) {
        sql = "SELECT * FROM usuario WHERE login = ? and senha = ? and status = 'Ativado'";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, u.getLogin());
            ps.setString(2, u.getSenha());
            rs = ps.executeQuery();
            if (rs.next()) {
                int codigo = rs.getInt("codigo");
                u = getForId(codigo);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionFactory.closeAll(con, ps, rs);
        }
        return u;
    }

    public Usuario getForId(int cod) {
        sql = "SELECT * FROM usuario WHERE codigo = ?";
        Usuario u = null;
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, cod);
            rs = ps.executeQuery();
            if (rs.next()) {
                u = new Usuario();
                u.setCodigo(rs.getInt("codigo"));
                u.setNome(rs.getString("nome"));
                u.setLogin(rs.getString("login"));
                u.setTipocod(rs.getInt("tipocod"));
                u.setStatus(rs.getString("status"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return u;
    }
    public Usuario getAll(int cod) {
        sql = "SELECT * FROM usuario u INNER JOIN endereco e ON u.enderecocod = e.codigo WHERE u.codigo = ?";
        Usuario u = null;
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, cod);
            rs = ps.executeQuery();
            if (rs.next()) {
                u = new Usuario();
                u.setCodigo(rs.getInt("u.codigo"));
                u.setNome(rs.getString("u.nome"));
                u.setLogin(rs.getString("u.login"));
                u.setSenha(rs.getString("u.senha"));
                u.setTipocod(rs.getInt("u.tipocod"));
                u.setCpf(rs.getString("u.cpf"));
                u.setEmail(rs.getString("u.email"));
                u.setRg(rs.getString("u.rg"));
                u.setStatus(rs.getString("u.status"));
                u.setTelefone(rs.getString("u.telefone"));
                Endereco e = new Endereco();
                e.setCodigo(rs.getInt("e.codigo"));
                e.setRua(rs.getString("e.rua"));
                e.setNumero(rs.getString("e.numero"));
                e.setCep(rs.getString("e.cep"));
                e.setBairrocod(rs.getString("e.bairrocod"));
                u.setE(e);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return u;
    }

    public static void main(String[] args) {
        UsuarioDAO d = new UsuarioDAO();
        Usuario u = d.getAll(17);
        System.out.println(">> " + u);

//        e.setRua("Endereco rua");
//        e.setNumero("Endereco numero");
//        e.setCep("Endereco cep");
//        e.setBairrocod("1");
//        u.setEndereco(String.valueOf(edao.salvar(e)));
//
//        u.setNome("Nome com endereco");
//        u.setLogin("login enderoco");
//        u.setSenha("senha enderoco");
//        u.setTipocod(2);
//        u.setCpf("912.349.321-34");
//        u.setEmail("marcelo@gmail.com");
//        u.setRg("0912390-0");
//        u.setTelefone("(23) 91234-0000");
//        d.salvar(u);
//        List<Usuario> list = d.listar();
//        for (Usuario us : list) {
//            System.out.println("Nome "+us);
//            if (u.getE() != null) {
//                System.out.println(us.getE().getRua());
//            }
//        }

    }

}
