package controller;

import dao.MarcaDAO;
import dao.ProdutoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Marca;
import models.Produto;

public class ProdutoController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            MarcaDAO mDao = new MarcaDAO();
            Marca m = new Marca();
            ProdutoDAO pDao = new ProdutoDAO();
            Produto p = new Produto();

            String codigo = null, nome = null, marca;

            try {

                if (request.getParameter("txtnome") != null) {
                    nome = request.getParameter("txtnome").trim();
                }
                if (request.getParameter("selmarca") != null) {
                    marca = request.getParameter("selmarca");
                    m = mDao.getPorCodigo(Integer.valueOf(marca));
                }

                String acao = request.getParameter("acao");

                if (acao.equals("criarProduto")) {
                    p.setNome(nome);
                    p.setMarcacod(m);
                    pDao.salvar(p);
                } else {

                }

            } catch (Exception e) {
                out.print("Erro ao salvar" + e.getMessage());
            } 
            finally {
                response.sendRedirect("produtos.jsp");
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
    }
}
