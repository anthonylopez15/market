package controller;

import dao.SupermercadoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Estoque;
import models.Produto;
import models.Supermercado;

public class SupermercadoController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            request.setCharacterEncoding("UTF-8");

            SupermercadoDAO sDao = new SupermercadoDAO();
            Supermercado s = new Supermercado();
            Estoque e = new Estoque();
            Produto p = null;

            String supermercadoCod = null, nome = null, endereco = null, msg = null, produtoCod = null, preco = null;
            String alerta = "alert-success", url = "supermercado.jsp";

            try {
                if (request.getParameter("txtcod") != null) {
                    supermercadoCod = request.getParameter("txtcod");
                }
                if (request.getParameter("txtnome") != null) {
                    nome = request.getParameter("txtnome").trim();
                }
                if (request.getParameter("txtendereco") != null) {
                    endereco = request.getParameter("txtendereco").trim();
                }

                if (request.getParameter("produtocod") != null) {
                    produtoCod = request.getParameter("produtocod");
                }
                if (request.getParameter("txtpreco") != null) {
                    preco = request.getParameter("txtpreco").replace(".", "").replace(",", ".");
                }

                String acao = request.getParameter("acao");

                if (acao.equals("criar")) {
                    s.setNome(nome);
                    s.setEndereco(endereco);
                    sDao.salvar(s);
                    msg = "Supermercado criado com sucesso!";
                } else if (acao.equals("alterar")) {
                    s.setCodigo(Integer.parseInt(supermercadoCod));
                    s.setNome(nome);
                    s.setEndereco(endereco);
                    sDao.alterar(s);
                    msg = "O supermercado '" + s + "' foi alterado com sucesso.";
                } else if (acao.equals("addProdutos")) {
                    s = new Supermercado(Integer.parseInt(supermercadoCod), "", "");
                    if (produtoCod != null) {
                        p = new Produto(Integer.parseInt(produtoCod), "");
                        e.setProduto(p);
                        e.setSupermercado(s);
                        e.setPreco(Double.parseDouble(preco));
                        if (sDao.addProdutoEstoque(e)) {
                            msg = "Produto adicionado com sucesso.";
                        } else {
                            alerta = "alert-danger";
                            msg = "Produto já se encontra na lista.";
                        }
                    }
                    url = "addProdutos.jsp";
                } else if (acao.equals("estoque")) {
                    url = "estoqueSupermercado.jsp";
                } else if (acao.equals("updatePrecoEstoque")) {
                    e.setSupermercadoCod(Integer.parseInt(supermercadoCod));
                    e.setProdutoCod(Integer.parseInt(produtoCod));
                    e.setPreco(Double.parseDouble(preco));
                    sDao.alterarEstoque(e);
                    msg = "Preço alterado com sucesso";
                    url = "estoqueSupermercado.jsp";
                }

                request.setAttribute("msg", msg);
                request.setAttribute("alert", alerta);
                request.getRequestDispatcher(url).forward(request, response);

            } catch (Exception ex) {
                request.setAttribute("alert", "alert-danger");
                request.setAttribute("msg", "Um erro acontenceu " + ex.fillInStackTrace());
                request.getRequestDispatcher("supermercado.jsp").forward(request, response);
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
