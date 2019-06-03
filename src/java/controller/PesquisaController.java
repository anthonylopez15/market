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
                    nome = null, marca = null, descricao = null, msg = null, alert = null;
            try {

                if (request.getParameter("q") != null) {
                    pesquisa = request.getParameter("q").trim();
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
                Usuario u = (Usuario) session.getAttribute("usuario");
                Carrinho carrinho = (Carrinho) session.getAttribute("carrinho");
                String acao = request.getParameter("acao");
                if (acao.equals("buscar")) {
                    if (!pesquisa.equals("")) {
                        List<Produto> list = pDao.pesquisarPorNome(pesquisa);
                        session.setAttribute("listProdutos", list);
                    }
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
                    msg = "Produto adicionado";
                    alert = "alert-success";
                    url = "index.jsp";
                } else if (acao.equals("removerCarrinho")) {
                    session.removeAttribute("carrinho");
                    session.removeAttribute("listProdutos");
//                    msg = "Lista de produto vazia.";
//                    alert = "alert-info";
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
                    if (u != null) {
                        
                        List<ItemProduto> items = carrinho.getItems();

                        List<Supermercado> listSuper = sDao.listarAll();
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
                            cart.setSupermercado(s);
                            cart.setListProdutos(listPesquisa);
                            listCompra.add(cart);
                        }

                        session.setAttribute("listCompra", listCompra);
                        url = "pesquisa_produtos.jsp";
                    
                    } else {
                        url = "login.jsp";
                    }
                } else if (acao.equals("salvarLista")) {
                    List<ListaCompra> listCompra = (List<ListaCompra>) session.getAttribute("listCompra");
                    ListaCompra temp = (ListaCompra) listCompra.get(Integer.valueOf(index)); // Está vindo da view (Tela)
                    ListaCompra compra = sDao.criarListaCompra(u, temp.getSupermercado()); // Retorna a compra criada no banco

                    for (ItemProduto i : temp.getListProdutos()) {
                        sDao.addItens(i, compra);
                    }

                    url = "pesquisa_produtos.jsp";

                } else {
                    session.removeAttribute("listProdutos");
                }
                request.setAttribute("msg", msg);
                request.setAttribute("alert", alert);
                request.getRequestDispatcher(url).forward(request, response);
            } catch (Exception e) {
                request.setAttribute("alert", "alert-danger");
                request.setAttribute("msg", "Um erro acontenceu - " + e.getLocalizedMessage());
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
