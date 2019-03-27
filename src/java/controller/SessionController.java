package controller;

import dao.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Usuario;

public class SessionController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            HttpSession session = request.getSession();
            Usuario u = new Usuario();
            UsuarioDAO udao = new UsuarioDAO();

            String login = null, senha = null, msg = null, alerta = "alert-success", url = null;

            try {
                if (request.getParameter("login") != null) {
                    login = request.getParameter("login").trim();
                }
                if (request.getParameter("senha") != null) {
                    senha = request.getParameter("senha").trim();
                }

                String acao = request.getParameter("acao");
                if (acao.equals("logar")) {
                    u.setLogin(login);
                    u.setSenha(senha);
                    u = udao.logar(u);
                    if (u.getNome() != null && u.getTipocod() == 1) {
                        System.out.println("Usuario " + u);
                        url = "admin.jsp";
                        msg = "Bem-vindo ao sistema, Administrador.";
                    } else if (u.getNome() != null && u.getTipocod() == 2) {
                        System.out.println("Usuario " + u);
                        url = "principal.jsp";
                        msg = "Login realizado com sucesso.";

                    } else {
                        alerta = "alert-danger";
                        url = "login.jsp";
                        msg = "Login ou senha errada.";
                    }
                } 
                session.setAttribute("usuario", u);
                request.setAttribute("msg", msg);
                request.setAttribute("alert", alerta);
                request.getRequestDispatcher(url).forward(request, response);
            } catch (Exception e) {
                request.setAttribute("alert", "alert-danger");
                request.setAttribute("msg", "Um erro acontenceu " + e.fillInStackTrace());
                request.getRequestDispatcher("login.jsp").forward(request, response);
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
