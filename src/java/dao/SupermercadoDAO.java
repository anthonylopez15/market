package dao;

import connection.ConnectionFactory;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Estoque;
import models.ItemProduto;
import models.ListaCompra;
import models.Marca;
import models.Produto;
import models.Supermercado;
import models.Usuario;

public class SupermercadoDAO {

    private String sql;
    private final Connection con;
    private PreparedStatement ps;
    private ResultSet rs;

    public SupermercadoDAO() {
        this.con = ConnectionFactory.conecta();
    }

    public Supermercado salvar(Supermercado s) {
        sql = "insert into supermercado (nome, enderecocod) values (?,?) ";

        try {
            ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, s.getNome());
            ps.setString(2, s.getEnderecocod());
            ps.executeUpdate();
            rs = ps.getGeneratedKeys();
            if (rs.next()) {
                s.setCodigo(rs.getInt(1));
            }
        } catch (SQLException ex) {
            System.out.println("erro ao salvar supermercado - " + ex.getMessage());
        } finally {
            ConnectionFactory.closeAll(con, ps, rs);
        }
        return s;
    }

    public Supermercado alterar(Supermercado s) {
        sql = "update supermercado set nome = ?, status = ? WHERE codigo = ? ";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, s.getNome());
            ps.setString(2, s.getStatus());
            ps.setInt(3, s.getCodigo());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SupermercadoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionFactory.close(con, ps);
        }
        return s;
    }

    public boolean addProdutoEstoque(Estoque e) {
        sql = "INSERT INTO estoque(supermercado, produto, preco) values (?,?,?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, e.getSupermercado().getCodigo());
            ps.setInt(2, e.getProduto().getCodigo());
            ps.setDouble(3, e.getPreco());
            ps.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionFactory.closeAll(con, ps, rs);
        }
        return false;
    }

    public List<Estoque> listarEstoquePorSupermercado(int codigo) {
        sql = "select * from estoque e inner join supermercado s on s.codigo = e.supermercado "
                + "inner join produto p on p.codigo = e.produto "
                + "inner join marca m on p.marcacod = m.codigo "
                + "where s.codigo = ? ";
        List<Estoque> list = new ArrayList<>();
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, codigo);
            rs = ps.executeQuery();
            while (rs.next()) {
                int codSuper = rs.getInt("s.codigo");
                int codProduto = rs.getInt("p.codigo");
                String nomeProduto = rs.getString("p.nome");
                double preco = rs.getDouble("e.preco");
                Produto p = new Produto(codProduto, nomeProduto,
                        new Marca(rs.getInt("m.codigo"), rs.getString("m.nome")));
                Supermercado s = new Supermercado(codSuper, rs.getString("s.nome"));
                Estoque e = new Estoque(p, s, preco);
                list.add(e);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SupermercadoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionFactory.closeAll(con, ps, rs);
        }
        return list;
    }

    public void alterarEstoque(Estoque e) {
        sql = "update estoque set preco = ? where supermercado = ? and produto = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setDouble(1, e.getPreco());
            ps.setInt(2, e.getSupermercadoCod());
            ps.setInt(3, e.getProdutoCod());
            ps.execute();
        } catch (SQLException ex) {
            Logger.getLogger(SupermercadoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Supermercado getProCodigo(int cod) {
        sql = "select * from supermercado where codigo = ? ";
        Supermercado s = null;
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, cod);
            rs = ps.executeQuery();
            if (rs.next()) {
                int codigo = rs.getInt("codigo");
                String nome = rs.getString("nome");
                s = new Supermercado(codigo, nome);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SupermercadoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
//        finally {
//            ConnectionFactory.closeAll(con, ps, rs);
//        }
        return s;
    }

    public List<Supermercado> listar() {
        sql = "SELECT * FROM supermercado s inner join endereco e on s.enderecocod = e.codigo";
        List<Supermercado> list = new ArrayList<>();
        EnderecoDAO eDao = new EnderecoDAO();
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Supermercado s = new Supermercado();
                s.setCodigo(rs.getInt("s.codigo"));
                s.setNome(rs.getString("s.nome"));
                if (rs.getString("s.enderecocod") != null) {
                    int enderecoId = rs.getInt("s.enderecocod");
                    s.setEnderecoM(eDao.buscarPorCod(enderecoId));
                    s.setEnderecocod(rs.getString("s.enderecocod"));
                }
                s.setStatus(rs.getString("s.status"));
                list.add(s);
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao listar supermercado " + ex.getMessage());
        } finally {
            ConnectionFactory.closeAll(con, ps, rs);
        }
        return list;
    }

    public List<Supermercado> listarAll() {
        sql = "SELECT * FROM supermercado  s where status = 'Ativo' ";
        List<Supermercado> list = new ArrayList<>();
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Supermercado s = new Supermercado();
                s.setCodigo(rs.getInt("s.codigo"));
                s.setNome(rs.getString("s.nome"));
                s.setStatus(rs.getString("s.status"));
                list.add(s);
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao listar supermercado " + ex.getMessage());
        }
        return list;
    }

    public ListaCompra criarListaCompra(Usuario user) {
        sql = "INSERT INTO listacompras(usuariocod, datahora) VALUES (?, now())";
        ListaCompra compra = new ListaCompra();
        try {
            ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, user.getCodigo());
            ps.executeUpdate();
            rs = ps.getGeneratedKeys();
            if (rs.next()) {
                compra.setCodigo(rs.getInt(1));
            }
        } catch (SQLException ex) {
            Logger.getLogger(SupermercadoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return compra;
    }

    public boolean addItens(ItemProduto item, ListaCompra compra) {
        sql = "INSERT INTO itemproduto(compracod, produto, quantidade) VALUES (?, ?, ?) ";
        boolean valor = false;
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, compra.getCodigo());
            ps.setInt(2, item.getProduto().getCodigo());
            ps.setInt(3, item.getQuantidade());
            valor = ps.execute();
        } catch (SQLException ex) {
            Logger.getLogger(SupermercadoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return valor;
    }

    public ItemProduto pesquisarProduto(String supermercado, String produto) {
        sql = "SELECT * FROM estoque e INNER JOIN produto p on p.codigo=e.produto INNER JOIN marca m on p.marcacod = m.codigo "
                + "where e.supermercado = ? and e.produto = ? ";
        ItemProduto i = null;
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, supermercado);
            ps.setString(2, produto);
            rs = ps.executeQuery();
            if (rs.next()) {
                i = new ItemProduto();
                Produto p = new Produto(rs.getInt("p.codigo"), rs.getString("p.nome"), rs.getString("m.nome"));
                Estoque e = new Estoque();
                e.setPreco(rs.getDouble("e.preco"));
                e.setProduto(p);
                i.setEstoque(e);
                i.setProduto(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SupermercadoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }

//    public static void main(String[] args) {
//        SupermercadoDAO dao = new SupermercadoDAO();
//        List<Supermercado> l = dao.listarAll();
//        for (Supermercado s : l) {
//            System.out.println(">> " + s.toString());
//        }
//
//    }
}
