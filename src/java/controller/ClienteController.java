package controller;

import dao.EnderecoDAO;
import dao.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Endereco;
import models.Usuario;

public class ClienteController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            HttpSession session = request.getSession();
            Usuario u = new Usuario();
            UsuarioDAO udao = new UsuarioDAO();
            Endereco e = new Endereco();
            EnderecoDAO eDao = new EnderecoDAO();

            String codigo = null, nome = null, login = null, senha = null, telefone = null;
            String email = null, rua = null, numero = null, cep = null, bairro = null, end_cod = null;

            String msg = null, alerta = "alert-success", url = "";
            //        Nome, telefone, e-mail, endereço(rua, número e cep) e Bairro
            try {
                if (request.getParameter("codigo") != null) {
                    codigo = request.getParameter("codigo");
                }
                if (request.getParameter("txtnome") != null) {
                    nome = request.getParameter("txtnome").trim();
                }
                if (request.getParameter("txttelefone") != null) {
                    telefone = request.getParameter("txttelefone").trim();
                }
                if (request.getParameter("txtemail") != null) {
                    email = request.getParameter("txtemail").trim();
                }
                if (request.getParameter("txtlogin") != null) {
                    login = request.getParameter("txtlogin").trim();
                }
                if (request.getParameter("txtsenha") != null) {
                    senha = request.getParameter("txtsenha").trim();
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
                if (request.getParameter("endcod") != null) {
                    end_cod = request.getParameter("endcod").trim();
                }

                String acao = request.getParameter("acao");
                if (acao.equals("cadastrar")) {
                    u.setNome(nome);
                    u.setLogin(login);
                    u.setSenha(senha);
                    u.setTipocod(2);
                    u.setEmail(email);
                    u.setTelefone(telefone);
                    e.setRua(rua);
                    e.setNumero(numero);
                    e.setCep(cep);
                    e.setBairrocod(bairro);
                    u.setEndereco(String.valueOf(eDao.salvar(e)));
                    udao.salvar(u);
                    msg = "Cadastro realizado com sucesso, faça login.";
                    url = "login.jsp";
                } else if (acao.equals("alterar")) {
                    u.setNome(nome);
                    u.setSenha(senha);
                    u.setEmail(email);
                    u.setTelefone(telefone);
                    e.setRua(rua);
                    e.setNumero(numero);
                    e.setCep(cep);
                    e.setBairrocod(bairro);
                    e.setCodigo(Integer.valueOf(end_cod));
                    eDao.alterar(e);
                    u.setCodigo(Integer.parseInt(codigo));
                    udao.alterarCliente(u);
                    msg = "Dados alterados com sucesso.";
                } else if (acao.equals("desativar")) {
                    int cod = (int) session.getAttribute("codigo");
                    u.setStatus("Desativado");
                    u.setCodigo(cod);
                    udao.alterarStatus(u);
                    session.removeAttribute("usuario");
                    session.removeAttribute("codigo");
                    url = "login.jsp";
                    msg = "Você desativou sua conta.";
                } else {

                }
                request.setAttribute("msg", msg);
                request.setAttribute("alert", alerta);
                request.getRequestDispatcher(url).forward(request, response);
            } catch (Exception ex) {
                request.setAttribute("alert", "alert-danger");
                request.setAttribute("msg", "Um erro acontenceu " + ex.getMessage());
                request.getRequestDispatcher("index.jsp").forward(request, response);
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
