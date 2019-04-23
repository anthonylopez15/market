
package controller;

import dao.BairroDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Bairro;

public class BairroController extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            request.setCharacterEncoding("UTF-8");

            Bairro b = new Bairro();
            BairroDAO bDao = new BairroDAO();

            String codigo = null, nome = null, msg = null, alerta = "alert-success", status = null;

            try {
                if (request.getParameter("codigo") != null) {
                    codigo = request.getParameter("codigo");
                }
                if (request.getParameter("txtnome") != null) {
                    nome = request.getParameter("txtnome").trim();
                }
                if (request.getParameter("status") != null) {
                    status = request.getParameter("status").trim();
                }

                String acao = request.getParameter("acao");
                if (acao.equals("criar")) {
                    b.setNome(nome);
                    bDao.salvar(b);
                    msg = "Bairro criado com sucesso.";
                } else if (acao.equals("alterar")) {
                    b.setCodigo(Integer.parseInt(codigo));
                    b.setNome(nome);
                    b.setStatus(status);
                    bDao.alterar(b);
                    msg = "Bairro foi alterado com sucesso.";
                } else {

                }
                request.setAttribute("msg", msg);
                request.setAttribute("alert", alerta);
                request.getRequestDispatcher("bairros.jsp").forward(request, response);
            } catch (Exception e) {
                request.setAttribute("alert", "alert-danger");
                request.setAttribute("msg", "Um erro acontenceu " + e.fillInStackTrace());
                request.getRequestDispatcher("bairros.jsp").forward(request, response);
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
