
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


public class ClienteController extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            Usuario u = new Usuario();
            UsuarioDAO udao = new UsuarioDAO();
            Endereco e = new Endereco();
            EnderecoDAO eDao = new EnderecoDAO();
            
            String codigo = null, nome = null, login = null, senha = null, telefone = null;
            String email = null, rua = null,  numero = null, cep = null, bairro = null;
            
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
                    u.setLogin(login);
                    u.setSenha(senha);
                    u.setEmail(email);
//                    u.setsairrocod(bairro);
                    u.setCodigo(Integer.parseInt(codigo));
                    udao.alterar(u);
                    msg = "Dados alterados.";   
                    url = "principal.jsp";
                } else {

                }
                request.setAttribute("msg", msg);
                request.setAttribute("alert", alerta);
                request.getRequestDispatcher(url).forward(request, response);
            } catch (NumberFormatException | ServletException | IOException ex) {
                request.setAttribute("alert", "alert-danger");
                request.setAttribute("msg", "Um erro acontenceu " + ex.getMessage());
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
