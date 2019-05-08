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
            request.setCharacterEncoding("UTF-8");

            MarcaDAO mDao = new MarcaDAO();
            Marca m = new Marca();
            ProdutoDAO pDao = new ProdutoDAO();
            Produto p = new Produto();

            String codigo = null, nome = null, descricao = null, marca, msg = null, alerta = "alert-success", status = null;

            try {
                if (request.getParameter("codigo") != null) {
                    codigo = request.getParameter("codigo");
                }
                if (request.getParameter("txtnome") != null) {
                    nome = request.getParameter("txtnome").trim();
                }
                if (request.getParameter("txtdescricao") != null) {
                    descricao = request.getParameter("txtdescricao").trim();
                }
                 if (request.getParameter("status") != null) {
                    status = request.getParameter("status");
                }
                if (request.getParameter("selmarca") != null) {
                    marca = request.getParameter("selmarca");
                    m = mDao.getPorCodigo(Integer.valueOf(marca));
                }

                String acao = request.getParameter("acao");

                if (acao.equals("criarProduto")) {
                    p.setNome(nome);
                    p.setDescricao(descricao);
                    p.setMarcacod(m);
                    pDao.salvar(p);
                    msg = "Produto criado com sucesso";
                } else if (acao.equals("alterar")) {
                    p.setCodigo(Integer.parseInt(codigo));
                    p.setNome(nome);
                    p.setDescricao(descricao);
                    p.setStatus(status);
                    pDao.alterar(p);
                    System.out.println("nome "+nome);
                    msg = "Produto alterar com sucesso";
                } else {

                }

                request.setAttribute("msg", msg);
                request.setAttribute("alert", alerta);
                request.getRequestDispatcher("produtos.jsp").forward(request, response);

            } catch (Exception e) {
                request.setAttribute("alert", "alert-danger");
                request.setAttribute("msg", "Um erro acontenceu " + e.fillInStackTrace());
                request.getRequestDispatcher("produtos.jsp").forward(request, response);
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
