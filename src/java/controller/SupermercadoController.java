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
            request.setCharacterEncoding("UTF-8");

            SupermercadoDAO sDao = new SupermercadoDAO();
            Supermercado s = new Supermercado();

            String codigo = null, nome = null, endereco = null, msg = null, alerta = "alert-success";

            try {
                if (request.getParameter("txtcod") != null) {
                    codigo = request.getParameter("txtcod");
                }
                if (request.getParameter("txtnome") != null) {
                    nome = request.getParameter("txtnome").trim();
                }
                if (request.getParameter("txtendereco") != null) {
                    endereco = request.getParameter("txtendereco").trim();
                }

                String acao = request.getParameter("acao");

                if (acao.equals("criar")) {
                    s.setNome(nome);
                    s.setEndereco(endereco);
                    sDao.salvar(s);
                    msg = "Supermercado criado com sucesso!";
                }else if(acao.equals("alterar")){
                    s.setCodigo(Integer.parseInt(codigo));
                    s.setNome(nome);
                    s.setEndereco(endereco);
                    sDao.alterar(s);
                    msg = "Alterado com sucesso!";
                } 
                else {
                    
                }
                request.setAttribute("msg", msg);
                request.setAttribute("alert", alerta);
                request.getRequestDispatcher("adm.jsp").forward(request, response);

            } catch (Exception e) {
                request.setAttribute("alert", "alert-danger");
                request.setAttribute("msg", "Um erro acontenceu " +e.fillInStackTrace());
                request.getRequestDispatcher("adm.jsp").forward(request, response);
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
