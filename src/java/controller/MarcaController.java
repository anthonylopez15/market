package controller;

import dao.MarcaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Marca;

public class MarcaController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            request.setCharacterEncoding("UTF-8");

            Marca m = new Marca();
            MarcaDAO mDao = new MarcaDAO();

            String codigo = null, nome = null, msg = null, alerta = "alert-success";

            try {
                if (request.getParameter("txtnome") != null) {
                    nome = request.getParameter("txtnome").trim();
                }

                String acao = request.getParameter("acao");
                if (acao.equals("criarMarca")) {
                    m.setNome(nome);
                    mDao.salvar(m);
                } else {

                }
                request.setAttribute("msg", msg);
                request.setAttribute("alert", alerta);
                request.getRequestDispatcher("marcas.jsp").forward(request, response);
            } catch (Exception e) {
                request.setAttribute("alert", "alert-danger");
                request.setAttribute("msg", "Um erro acontenceu " + e.fillInStackTrace());
                request.getRequestDispatcher("marcas.jsp").forward(request, response);
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
