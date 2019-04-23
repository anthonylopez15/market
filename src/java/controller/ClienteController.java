
package controller;

import dao.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Usuario;


public class ClienteController extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            Usuario u = new Usuario();
            UsuarioDAO udao = new UsuarioDAO();
            
            String codigo = null, nome = null, login = null, senha = null;
            String cpf = null, email = null, endereço = null, cep = null, bairro = null;
            
            String msg = null, alerta = "alert-success", url = "";

            try {
                if (request.getParameter("codigo") != null) {
                    codigo = request.getParameter("codigo");
                }
                if (request.getParameter("txtnome") != null) {
                    nome = request.getParameter("txtnome").trim();
                }
                if (request.getParameter("txtlogin") != null) {
                    login = request.getParameter("txtlogin").trim();
                }
                if (request.getParameter("txtsenha") != null) {
                    senha = request.getParameter("txtsenha").trim();
                }
                if (request.getParameter("txtcpf") != null) {
                    cpf = request.getParameter("txtcpf");
                }
                if (request.getParameter("txtemail") != null) {
                    email = request.getParameter("txtemail").trim();
                }
                if (request.getParameter("txtendereco") != null) {
                    endereço = request.getParameter("txtendereco").trim();
                }
                if (request.getParameter("txtcep") != null) {
                    cep = request.getParameter("txtcep").trim();
                }
                if (request.getParameter("txtbairro") != null) {
                    bairro = request.getParameter("txtbairro").trim();
                }
                
                String acao = request.getParameter("acao");
                if (acao.equals("cadastrar")) {
                    u.setNome(nome);
                    u.setLogin(login);
                    u.setSenha(senha);
                    u.setTipocod(2);
                    u.setCpf(cpf);
                    u.setEmail(email);
                    u.setEndereco(endereço);
                    u.setCep(cep);
                    u.setBairrocod(bairro);
                    udao.salvar(u);
                    msg = "Cadastro realizado com sucesso, faça login.";
                    url = "login.jsp";
                } else if (acao.equals("alterar")) {
                    u.setNome(nome);
                    u.setLogin(login);
                    u.setSenha(senha);
                    u.setEmail(email);
                    u.setEndereco(endereço);
                    u.setCep(cep);
                    u.setBairrocod(bairro);
                    u.setCodigo(Integer.parseInt(codigo));
                    udao.alterar(u);
                    msg = "Dados alterados.";   
                    url = "principal.jsp";
                } else {

                }
                request.setAttribute("msg", msg);
                request.setAttribute("alert", alerta);
                request.getRequestDispatcher(url).forward(request, response);
            } catch (Exception e) {
                request.setAttribute("alert", "alert-danger");
                request.setAttribute("msg", "Um erro acontenceu " + e.getMessage());
                request.getRequestDispatcher("principal.jsp").forward(request, response);
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
