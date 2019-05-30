package controller;

import dao.Carrinho;
import dao.ProdutoDAO;
import dao.SupermercadoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Estoque;
import models.ItemProduto;
import models.ListaCompra;
import models.Produto;
import models.Supermercado;
import models.Usuario;

public class PesquisaController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            ProdutoDAO pDao = new ProdutoDAO();
            SupermercadoDAO sDao = new SupermercadoDAO();
            ItemProduto item;
            String pesquisa = "", index = null, url = null, codigo = null,
                    nome = null, marca = null, descricao = null;
            try {

                if (request.getParameter("q") != null) {
                    pesquisa = request.getParameter("q");
                }
                if (request.getParameter("codigo") != null) {
                    codigo = request.getParameter("codigo");
                }
                if (request.getParameter("nome") != null) {
                    nome = request.getParameter("nome");
                }
                if (request.getParameter("marca") != null) {
                    marca = request.getParameter("marca");
                }
                if (request.getParameter("descricao") != null) {
                    descricao = request.getParameter("descricao");
                }
                if (request.getParameter("item") != null) {
                    index = request.getParameter("item");
                }
                HttpSession session = request.getSession();
                Carrinho carrinho = (Carrinho) session.getAttribute("carrinho");
                String acao = request.getParameter("acao");
                if (acao.equals("buscar")) {
                    List<Produto> list = pDao.pesquisarPorNome(pesquisa);
                    session.setAttribute("listProdutos", list);
                    url = "index.jsp";
                } else if (acao.equals("add")) {
                    Produto p = pDao.buscarPorCodigo(codigo);
                    item = new ItemProduto(p, 1);
                    if (carrinho == null) {
                        carrinho = new Carrinho(item);
                        session.setAttribute("carrinho", carrinho);
                    } else {
                        carrinho.addItem(item);
                    }
                    url = "index.jsp";
                } else if (acao.equals("removerCarrinho")) {
                    session.removeAttribute("carrinho");
                    session.removeAttribute("listProdutos");
                    url = "index.jsp";
                } else if (acao.equals("remover")) {
                    List<ItemProduto> items = carrinho.getItems();
                    if (items != null) {
                        ItemProduto temp = (ItemProduto) items.get(Integer.valueOf(index));
                        carrinho.removeItem(temp);
                        url = "index.jsp";
                    } else {
                        url = "index.jsp";
                    }
                } else if (acao.equals("pesquisarItens")) {
                    Usuario u = (Usuario) session.getAttribute("usuario");
                    if (u != null) {
                        ListaCompra compra = sDao.criarListaCompra(u);
                        List<ItemProduto> items = carrinho.getItems();
//                        for (ItemProduto i: items){
//                           sDao.addItens(i, compra);
//                        }

                        List<Supermercado> listSuper = sDao.listarAll();
//                        List<ItemProduto> listPesquisa = new ArrayList<>();
                        List<ListaCompra> listCompra = new ArrayList<>();
                        for (Supermercado s : listSuper) {
                            ListaCompra cart = new ListaCompra();
                            List<ItemProduto> listPesquisa = new ArrayList<>();
                            for (ItemProduto it : items) {
                                String supermercado_id = String.valueOf(s.getCodigo());
                                String produto_id = String.valueOf(it.getProduto().getCodigo());
                                ItemProduto i = sDao.pesquisarProduto(supermercado_id, produto_id);
                                if (i != null) {
                                    i.setQuantidade(it.getQuantidade());
                                    listPesquisa.add(i);
                                }

                            }
                            cart.setSupermercado(s.getNome());
                            cart.setListProdutos(listPesquisa);
                            listCompra.add(cart);
                        }
                        for (ListaCompra ite : listCompra) {
                            System.out.println(">>>>>" + ite.getSupermercado() + ">>>>>");
                            for (ItemProduto p : ite.getListProdutos()) {
                                System.out.println("\t>> " + p.getProduto().getNome() 
                                        + " - " + p.getProduto().getMarca()+ " - " + p.getEstoque().getPreco()
                                        + " - Qtde = " + p.getQuantidade());
                            }
                        }
                        request.setAttribute("listCompra", listCompra);
                        url = "pesquisa_produtos.jsp";
                    } else {
                        url = "login.jsp";
                    }

                } else {
                    session.removeAttribute("listProdutos");
                }
                request.getRequestDispatcher(url).forward(request, response);
            } catch (Exception e) {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
