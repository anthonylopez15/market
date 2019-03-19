package controller;

import dao.SupermercadoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Supermercado;

public class SupermercadoController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            SupermercadoDAO sDao = new SupermercadoDAO();
            Supermercado s = new Supermercado();

            String codigo = null, nome = null, endereco = null;

            try {

                if (request.getParameter("txtnome") != null) {
                    nome = request.getParameter("txtnome").trim();
                }
                if (request.getParameter("txtendereco") != null) {
                    endereco = request.getParameter("txtendereco").trim();
                }

                String acao = request.getParameter("acao");

                if (acao.equals("criarSupermercado")) {
                    s.setNome(nome);
                    s.setEndereco(endereco);
                    sDao.salvar(s);
                } else {
                }

                request.getRequestDispatcher("adm.jsp").forward(request, response);

            } catch (Exception e) {
                out.print("Erro " + e.getMessage());
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
