package controller;

import connection.ConnectionFactory;
import dao.GeradorDeRelatorios;
import dao.SupermercadoDAO;
import java.io.IOException;
import java.text.NumberFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.ItemProduto;
import models.ListaCompra;
import models.Usuario;

public class Relatorios extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String acao = request.getParameter("acao");
        String index = null, jrxml;
        NumberFormat formatadorMoeda = NumberFormat.getCurrencyInstance();

        SupermercadoDAO sDao = new SupermercadoDAO();
        HttpSession session = request.getSession();
        Usuario u = (Usuario) session.getAttribute("usuario");

        if (request.getParameter("item") != null) {
            index = request.getParameter("item");
        }
        try {

            if (acao.equals("salvarLista")) {
                List<ListaCompra> listCompra = (List<ListaCompra>) session.getAttribute("listCompra");
                if (listCompra != null) {

                    ListaCompra temp = (ListaCompra) listCompra.get(Integer.valueOf(index));
                    ListaCompra compra = sDao.criarListaCompra(u, temp.getSupermercado());
                    double subtotal;
                    double total = 0.0;

                    for (ItemProduto i : temp.getListProdutos()) {
                        sDao.addItens(i, compra);
                        subtotal = i.getEstoque().getPreco() * i.getQuantidade();
                        total = total + subtotal;
                    }
                    System.out.println(">> " + total);

                    ServletContext contexto = request.getServletContext();
                    jrxml = contexto.getRealPath("/ireport/lista_compra.jrxml");
                    String logo = contexto.getRealPath("/ireport/shopping-cart.jpg");
                    String t = formatadorMoeda.format(total);
                    Map<String, Object> parametros = new HashMap<>();

                    parametros.put("usuario_codigo", u.getCodigo());
                    parametros.put("lista_codigo", compra.getCodigo());
                    parametros.put("logo", logo);
                    parametros.put("total", t);

                    session.removeAttribute("carrinho");
                    session.removeAttribute("listCompra");
                    session.removeAttribute("listProdutos");

                    GeradorDeRelatorios gerador = new GeradorDeRelatorios(ConnectionFactory.conecta());
                    gerador.geraPdf(jrxml, parametros, response);
                }else{
                    request.setAttribute("msg", "Não foi possível gerar o relatório");
                    request.setAttribute("alert", "alert-danger");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(PesquisaController.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("alert", "alert-danger");
            request.setAttribute("msg", "Um erro acontenceu - " + ex.getLocalizedMessage());
            request.getRequestDispatcher("index.jsp").forward(request, response);
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
    }
}
