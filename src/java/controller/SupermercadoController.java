package controller;

import dao.EnderecoDAO;
import dao.SupermercadoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Endereco;
import models.Estoque;
import models.Produto;
import models.Supermercado;

public class SupermercadoController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            request.setCharacterEncoding("UTF-8");

            SupermercadoDAO sDao = new SupermercadoDAO();
            Supermercado s = new Supermercado();
            Endereco end = new Endereco();
            EnderecoDAO enDAO = new EnderecoDAO();
            Estoque e = new Estoque();
            Produto p = null;

            String supermercadoCod = null, nome = null, rua = null, msg = null, produtoCod = null, preco = null;
            String numero = null, bairro = null, cep = null, status = null, end_cod = null;
            String alerta = "alert-success", url = "supermercado.jsp";

            try {
                if (request.getParameter("txtcod") != null) {
                    supermercadoCod = request.getParameter("txtcod");
                }
                if (request.getParameter("txtnome") != null) {
                    nome = request.getParameter("txtnome").trim();
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
                    bairro = request.getParameter("txtbairro");
                }
                if (request.getParameter("status") != null) {
                    status = request.getParameter("status");
                }
                if (request.getParameter("produtocod") != null) {
                    produtoCod = request.getParameter("produtocod");
                }
                if (request.getParameter("txtpreco") != null) {
                    preco = request.getParameter("txtpreco").replace(".", "").replace(",", ".");
                }
                if (request.getParameter("end_cod") != null) {
                    end_cod = request.getParameter("end_cod");
                }

                String acao = request.getParameter("acao");

                if (acao.equals("criar")) {
                    s.setNome(nome);
                    end.setRua(rua);
                    end.setNumero(numero);
                    end.setBairrocod(bairro);
                    end.setCep(cep);
                    s.setEnderecocod(String.valueOf(enDAO.salvar(end)));
                    sDao.salvar(s);
                    msg = "Supermercado criado com sucesso!";
                } else if (acao.equals("alterar")) {
                    s.setCodigo(Integer.parseInt(supermercadoCod));
                    s.setNome(nome);
                    end.setCodigo(Integer.parseInt(end_cod));
                    end.setRua(rua);
                    end.setNumero(numero);
                    end.setCep(cep);
                    end.setBairrocod(bairro);
                    enDAO.alterar(end);
                    s.setStatus(status);
                    sDao.alterar(s);
                    msg = "O supermercado '" + s + "' foi alterado com sucesso.";
                } else if (acao.equals("addProdutos")) {
                    s = new Supermercado(Integer.parseInt(supermercadoCod), "");
                    if (produtoCod != null) {
                        p = new Produto(Integer.parseInt(produtoCod), "");
                        e.setProduto(p);
                        e.setSupermercado(s);
                        e.setPreco(Double.parseDouble(preco));
                        if (sDao.addProdutoEstoque(e)) {
                            msg = "Produto adicionado com sucesso.";
                        } else {
                            alerta = "alert-danger";
                            msg = "Produto já se encontra na lista.";
                        }
                    }
                    url = "addProdutos.jsp";
                } else if (acao.equals("estoque")) {
                    url = "estoqueSupermercado.jsp";
                } else if (acao.equals("updatePrecoEstoque")) {
                    e.setSupermercadoCod(Integer.parseInt(supermercadoCod));
                    e.setProdutoCod(Integer.parseInt(produtoCod));
                    e.setPreco(Double.parseDouble(preco));
                    sDao.alterarEstoque(e);
                    msg = "Preço alterado com sucesso";
                    url = "estoqueSupermercado.jsp";
                }

                request.setAttribute("msg", msg);
                request.setAttribute("alert", alerta);
                request.getRequestDispatcher(url).forward(request, response);

            } catch (NumberFormatException | ServletException | IOException ex) {
                request.setAttribute("alert", "alert-danger");
                request.setAttribute("msg", "Um erro acontenceu " + ex.getMessage());
                request.getRequestDispatcher("supermercado.jsp").forward(request, response);
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
