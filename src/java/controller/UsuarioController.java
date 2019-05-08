package controller;

import dao.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Usuario;

public class UsuarioController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            request.setCharacterEncoding("UTF-8");

            Usuario u = new Usuario();
            UsuarioDAO udao = new UsuarioDAO();

            //    cpf, telefone, endereço, bairro, cep
            
            String codigo = null, nome = null, login = null, senha = null, numero = null, telefone = null;
            String cpf = null, rg = null, email = null, rua = null, cep = null, bairro = null;
            
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
                if (request.getParameter("txtrg") != null) {
                    rg = request.getParameter("txtrg");
                }
                if (request.getParameter("email") != null) {
                    email = request.getParameter("email").trim();
                }
                if (request.getParameter("txttelefone") != null) {
                    telefone = request.getParameter("txttelefone").trim();
                }
                if (request.getParameter("txtrua") != null) {
                    rua = request.getParameter("txtrua").trim();
                }
                if (request.getParameter("txtnumero") != null) {
                    numero = request.getParameter("txtnumero").trim();
                }
                if (request.getParameter("txtcep") != null) {
                    cep = request.getParameter("txtcep").trim();
                }
                if (request.getParameter("txtbairro") != null) {
                    bairro = request.getParameter("txtbairro").trim();
                }
                
                String acao = request.getParameter("acao");
                if (acao.equals("criar")) {
                    u.setNome(nome);
                    u.setLogin(login);
                    u.setSenha(senha);
                    u.setTipocod(1);
                    u.setCpf(cpf);
                    u.setRg(rg);
                    u.setEmail(email);
                    u.setTelefone(telefone);
                    u.setRua(rua);
                    u.setNumero(numero);
                    u.setCep(cep);
                    u.setBairrocod(bairro);
                    udao.salvar(u);
                    msg = "Usuario foi criado com sucesso.";
                } else if (acao.equals("alterar")) {
                    u.setNome(nome);
                    u.setLogin(login);
                    u.setSenha(senha);
                    u.setEmail(email);
                    u.setTelefone(telefone);
                    u.setRua(rua);
                    u.setNumero(numero);
                    u.setCep(cep);
                    u.setBairrocod(bairro);
                    u.setCodigo(Integer.parseInt(codigo));
                    udao.alterar(u);
                    msg = "Usuário foi alterado com sucesso.";   
                } else if(acao.equals("desativar")){
                    u.setStatus("Desativado");
                    u.setCodigo(Integer.parseInt(codigo));
                    udao.alterarStatus(u);
                    msg = "Status alterado.";   
                } else if(acao.equals("ativar")){
                    u.setStatus("Ativado");
                    u.setCodigo(Integer.parseInt(codigo));
                    udao.alterarStatus(u);
                    msg = "Status alterado.";
                } 
                else {

                }
                request.setAttribute("msg", msg);
                request.setAttribute("alert", alerta);
                request.getRequestDispatcher("admin.jsp").forward(request, response);
            } catch (Exception e) {
                request.setAttribute("alert", "alert-danger");
                request.setAttribute("msg", "Um erro acontenceu " + e.fillInStackTrace());
                request.getRequestDispatcher("admin.jsp").forward(request, response);
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
