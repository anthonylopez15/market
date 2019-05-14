package controller;

import dao.EnderecoDAO;
import dao.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Endereco;
import models.Usuario;

public class UsuarioController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            request.setCharacterEncoding("UTF-8");

            Usuario u = new Usuario();
            UsuarioDAO udao = new UsuarioDAO();
            Endereco e = new Endereco();
            EnderecoDAO eDao = new EnderecoDAO();

            String codigo = null, nome = null, login = null, senha = null, numero = null, telefone = null;
            String cpf = null, rg = null, email = null, rua = null, cep = null, bairro = null, end_cod = null;

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
                if (request.getParameter("endcod") != null) {
                    end_cod = request.getParameter("endcod").trim();
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
                    e.setRua(rua);
                    e.setNumero(numero);
                    e.setCep(cep);
                    e.setBairrocod(bairro);
                    u.setEndereco(String.valueOf(eDao.salvar(e)));
                    udao.salvar(u);
                    msg = "Usuario foi criado com sucesso.";
                } else if (acao.equals("alterar")) {
                    u.setNome(nome);
                    u.setLogin(login);
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
                    udao.alterar(u);
                    msg = "Usuário foi alterado com sucesso.";
                } else if (acao.equals("desativar")) {
                    u.setStatus("Desativado");
                    u.setCodigo(Integer.parseInt(codigo));
                    udao.alterarStatus(u);
                    msg = "Status alterado.";
                } else if (acao.equals("ativar")) {
                    u.setStatus("Ativado");
                    u.setCodigo(Integer.parseInt(codigo));
                    udao.alterarStatus(u);
                    msg = "Status alterado.";
                } else {

                }
                request.setAttribute("msg", msg);
                request.setAttribute("alert", alerta);
                request.getRequestDispatcher("admin.jsp").forward(request, response);
            } catch (NumberFormatException | ServletException | IOException ex) {
                request.setAttribute("alert", "alert-danger");
                request.setAttribute("msg", "Um erro acontenceu " + ex.getMessage());
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
