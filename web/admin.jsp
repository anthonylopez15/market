<%@page import="models.Bairro"%>
<%@page import="dao.BairroDAO"%>
<%@page import="models.Usuario"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="models.Produto"%>
<%@page import="dao.ProdutoDAO"%>
<%@page import="dao.MarcaDAO"%>
<%@page import="java.util.List"%>
<%@page import="models.Marca"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="cabecalhoAdm.jsp"/>


<%
    if (session.getAttribute("usuario") == null) {
        //response.sendRedirect("login.jsp");
    }
%>
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class='form-label alert 
                     <%                         
                         if (request.getAttribute("alert") != null) {
                             out.print(request.getAttribute("alert"));
                         }
                     %>
                     <%    
                         if (request.getAttribute("msg") == null) {
                             out.print("hidden");
                         }
                     %>
                     '>
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    <%=request.getAttribute("msg")%>
                </div>

                <h1 class="page-header">Usuários</h1>
            </div>

        </div>

        <div class="row">
            <div class="col-sm-4">
                <a href="#" class="btn btn-success" data-toggle="modal" data-cod="cadastro" data-target="#cadastro" ><i class="fa fa-plus"></i></a>
                <div class="modal fade" id="cadastro"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <h3 class="modal-title" id="myModalLabel">Cadastrar</h3>
                            </div>
                            <form action="usuario" method="get">
                                <div class="modal-body">
                                    <div class="row form-group">
                                        <div class="col-sm-6">
                                            <label for="cNome" class="form-label">Nome</label>
                                            <input type="text" class="form-control" required name="txtnome" id="cNome" 
                                                   placeholder="Nome completo"  />
                                        </div>
                                        <div class="col-sm-6">
                                            <label for="cCpf" class="form-label">CPF</label>
                                            <input type="text" class="form-control" required name="txtcpf" id="cCpf" 
                                                   placeholder="999.999.999-99"  data-bv-notempty-message="CPF obrigatório." data-mask="999.999.999-99"/>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col-sm-6">
                                            <label for="txtlogin" class="form-label">Login</label>
                                            <input type="text" class="form-control" required name="txtlogin" id="txtlogin" placeholder="Login"/>
                                        </div>
                                        <div class="col-sm-6">
                                            <label for="txtsenha" class="form-label">Senha</label>
                                            <input type="password" class="form-control" required name="txtsenha" id="txtsenha" placeholder="Senha" minlength="5"/>
                                        </div>
                                    </div>
                                    <!--cpf, telefone, endereço, bairro, cep-->
                                    <div class="row form-group">
                                        <div class="col-sm-6">
                                            <label for="txtbairro" class="form-label">Bairro</label>
                                            <select class="form-control" required name="txtbairro" id="txtbairro">
                                                <option value="" selected="" disabled="" class="sr-only">Selecione</option>
                                                <%
                                                    BairroDAO bDao = new BairroDAO();
                                                    for (Bairro b : bDao.listar()) {
                                                %>
                                                <option value="<%=b.getCodigo()%>"><%=b.getNome()%></option>
                                                <%}%>
                                            </select>
                                        </div>
                                        <div class="col-sm-6">
                                            <label for="txttelefone" class="form-label">Telefone</label>
                                            <input type="text" class="form-control" required name="txttelefone" id="txttelefone" 
                                                   placeholder="(99) 99999-9999" data-mask="(99) 99999-9999" pattern="\([0-9]{2}\) [0-9]{5}-[0-9]{4}"/>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col-sm-6">
                                            <label for="txtendereco" class="form-label">Endereço</label>
                                            <input type="text" class="form-control" required name="txtendereco" id="txtendereco" placeholder="Endereço"/>
                                        </div>

                                        <div class="col-sm-6">
                                            <label for="txtcep" class="form-label">CEP</label>
                                            <input type="text" class="form-control" required name="txtcep" id="txtcep" placeholder="CEP"
                                                   data-mask="99999-999" pattern="[0-9]{5}-[0-9]{3}"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn" id="sombrabtn" data-dismiss="modal">Fechar</button>
                                    <button type="submit" class="btn btn-primary" id="sombrabtn" 
                                            value="criar" name="acao">Cadastrar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <br>
                <br>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Lista de Usuários
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                                <tr>
                                    <th>Codigo</th>
                                    <th>Nome</th>
                                    <th>Tipo</th>
                                    <th>Login</th>
                                    <th>Ação</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    UsuarioDAO uDao = new UsuarioDAO();
                                    List<Usuario> listar = uDao.listar();
                                    for (Usuario u : listar) {
                                %>

                                <tr class="odd gradeX">
                                    <td><%=u.getCodigo()%></td>
                                    <td><%=u.getNome()%></td>
                                    <td><%=u.getTipoDesc()%></td>
                                    <td><%=u.getLogin()%></td>
                                    <td class="text-center">
                                        <a href="#" data-toggle="modal" data-cod="<%=u.getCodigo()%>"
                                           data-target="#<%=u.getCodigo()%>" >Abrir</a>
                                    </td>
                                </tr>
                            <div class="modal fade" id="<%=u.getCodigo()%>"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                <div class="modal-dialog modal-lg" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                            <h3 class="modal-title" id="myModalLabel">Dados do usuário</h3>
                                        </div>
                                        <form action="usuario" method="post">
                                            <div class="modal-body">
                                                <div class="row form-group">
                                                    <div class="col-sm-6">
                                                        <label for="cNome" class="form-label">Nome</label>
                                                        <input type="text" value="<%=u.getNome()%>" class="form-control" required name="txtnome" id="cNome" 
                                                               placeholder="Nome completo"  />
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <label class="form-label">CPF</label>
                                                        <input type="text" value="<%=u.getCpf()%>" readonly class="form-control" required />
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col-sm-6">
                                                        <label class="form-label">Login</label>
                                                        <input type="text" value="<%=u.getLogin()%>" class="form-control" required name="txtlogin"   placeholder="Login"/>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <label for="txtsenha" class="form-label">Senha</label>
                                                        <input type="password" value="<%=u.getSenha()%>" class="form-control" required name="txtsenha" id="txtsenha" placeholder="Senha" minlength="5"/>
                                                    </div>
                                                </div>

                                                <div class="row form-group">
                                                    <div class="col-sm-6">
                                                        <label for="txtbairro" class="form-label">Bairro</label>
                                                        <select class="form-control" required name="txtbairro" id="txtbairro">
                                                            <option value="" selected="" disabled="" class="sr-only">Selecione</option>
                                                            <%
                                                                String selected = "selected";
                                                                for (Bairro b : bDao.listar()) {
                                                                    if (u.getBairroNome().equals(b.getNome())) {
                                                                        selected = "selected";
                                                                    } else {
                                                                        selected = "";
                                                                    }
                                                            %>
                                                            <option value="<%=b.getCodigo()%>" <%=selected%> ><%=b.getNome()%></option>
                                                            <%}%>
                                                        </select>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <% String telefone = u.getTelefone().replace("(", "").replace(")", "").replace(" ", "").replace("-", "");%>
                                                        <label for="txttelefone" class="form-label">Telefone</label>
                                                        <input type="text" value="<%=telefone%>" class="form-control" required name="txttelefone" id="txttelefone" 
                                                               placeholder="(99) 99999-9999" data-mask="(99) 99999-9999" pattern="\([0-9]{2}\) [0-9]{5}-[0-9]{4}"/>
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col-sm-6">
                                                        <label  class="form-label">Endereço</label>
                                                        <input type="text" value="<%=u.getEndereco()%>" class="form-control" required name="txtendereco" placeholder="Endereço"/>
                                                    </div>

                                                    <div class="col-sm-6">
                                                        <% String cep = u.getCep().replace("-", "");%>
                                                        <label class="form-label">CEP</label>
                                                        <input type="text" value="<%=cep%>" class="form-control" required name="txtcep" placeholder="CEP"
                                                               data-mask="99999-999" pattern="[0-9]{5}-[0-9]{3}"/>

                                                        <input type="hidden" name="codigo" value="<%=u.getCodigo()%>"/>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn" id="sombrabtn" data-dismiss="modal">Fechar</button>
                                                <button type="submit" class="btn btn-primary" id="sombrabtn" 
                                                        value="alterar" name="acao">Alterar</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <% }%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</div>

<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/metisMenu.min.js"></script>
<script src="resources/js/jquery.dataTables.min.js"></script>
<script src="resources/js/dataTables.bootstrap.min.js"></script>
<script src="resources/js/dataTables.responsive.js"></script>
<script src="resources/js/sb-admin-2.js"></script>
<script type="text/javascript" src="resources/js/jquery.mask.js"></script>

<script>
    $(document).ready(function () {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
</script>
</body>
</html>