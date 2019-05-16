package controller;

import dao.Carrinho;
import dao.ProdutoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Produto;

public class PesquisaController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            ProdutoDAO pDao = new ProdutoDAO();
            Produto item;
            String pesquisa = "", url = null, codigo = null, nome = null, marca = null, descricao = null;

            try {
                String index = request.getParameter("item");

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
                HttpSession session = request.getSession();
                Carrinho carrinho = (Carrinho) session.getAttribute("carrinho");

                String acao = request.getParameter("acao");
                if (acao.equals("buscar")) {
                    List<Produto> list = pDao.pesquisarPorNome(pesquisa);
                    request.setAttribute("listProdutos", list);
                    url = "index.jsp";
                } else if (acao.equals("add")) {
                    item = new Produto(Integer.parseInt(codigo), nome, descricao, marca);
                    if (carrinho == null) {
                        carrinho = new Carrinho(item);
                        session.setAttribute("carrinho", carrinho);
                    } else {
                        carrinho.addItem(item);
                    }
                    url = "index.jsp";
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
