
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Bairro"%>
<%@page import="dao.BairroDAO"%>
<%@page import="models.Marca"%>
<%@page import="dao.MarcaDAO"%>
<%@page import="models.Supermercado"%>
<%@page import="java.util.List"%>
<%@page import="dao.SupermercadoDAO"%>
<%@page import="java.text.NumberFormat"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="cabecalhoAdm.jsp"/>

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

                <h1 class="page-header">Supermercados</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>

        <div class="row">
            <div class="col-sm-6">
                <button class="btn btn-success" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                    <!--Cadastrar-->
                    <i class="fa fa-plus"></i>
                </button>
                <br>
                <br>
                <div class="collapse" id="collapseExample">
                    <form action="supermercado" method="post"  class="form-horizontal" >
                        <div class="well well-sm">

                            <p>
                                <input type="text" class="form-control" name="txtnome"required placeholder="Nome"/>
                            </p>
                            <p>
                                <input type="text" class="form-control" name="txtrua"required placeholder="Rua "/>
                            </p>
                            <p>
                                <input type="text" class="form-control" name="numero"required placeholder="Número "/>
                            </p>
                            <p>
                                <input type="text" class="form-control" name="cep"required placeholder="CEP "
                                       data-bv-notempty-message="Campo obrigatório." data-mask="99999-999" pattern="[0-9]{5}-[0-9]{3}"/>
                            </p>
                            <select class="form-control" required id="marca" name="bairro">
                                <option value="" selected> Selecione a Bairro </option>
                                <%
                                    BairroDAO bDao = new BairroDAO();
                                    List<Bairro> listB = bDao.listar();
                                    for (Bairro b : listB) {
                                %>
                                <option value="<%=b.getCodigo()%>" ><%=b.getNome()%></option>

                                <%}%>

                            </select>
                            <br>
                            <p><button type="submit" name="acao" value="criar" class="btn btn-info"> Salvar</button></p>

                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Lista
                    </div>  
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                                <tr>
                                    <th>Codigo</th>
                                    <th>Nome</th>
                                    <th>Endereço</th>
                                    <th>Status</th>
                                    <th>Ação</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    SupermercadoDAO sDao = new SupermercadoDAO();
                                    List<Supermercado> list = sDao.listar();
                                    for (Supermercado s : list) {
                                %>
                                <tr class="odd gradeX">
                                    <td><%=s.getCodigo()%></td>
                                    <td><%=s.getNome()%></td>
                                    <td><%=s.getEnderecoM()%></td>
                                    <td><%=s.getStatus()%></td>
                                    <td class="text-center">
                                        <a href="#" data-toggle="modal" data-cod="<%=s.getCodigo()%>"
                                           data-target="#<%=s.getCodigo()%>" >Abrir</a>
                                    </td>

                                </tr>
                            <div class="modal fade" id="<%=s.getCodigo()%>"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                <div class="modal-dialog modal-lg" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                            <h3 class="modal-title" id="myModalLabel">Dados Supermercado</h3>
                                        </div>
                                        <form action="supermercado" method="get">
                                            <div class="modal-body">
                                                <div class="row form-group">
                                                    <div class="  col-sm-6 ">
                                                        <label for="cNome" class="form-label">Nome</label>
                                                        <input type="text" class="form-control" required name="txtnome" id="cNome" 
                                                               placeholder="Nome do supermercado" value="<%=s.getNome()%>"  />
                                                    </div>
                                                    <div class="  col-sm-6 ">
                                                        <label for="cEnd" class="form-label">Rua</label>
                                                        <input type="text" class="form-control" required name="txtrua" id="cEnd" 
                                                               placeholder="Rua, lougradouro..." value="<%=s.getEnderecoM().getRua()%>" />
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="  col-sm-6 ">
                                                        <label for="cEnd" class="form-label">Número</label>
                                                        <input type="text" class="form-control" required name="txtnumero" id="cEnd" 
                                                               placeholder="Rua, lougradouro..." value="<%=s.getEnderecoM().getNumero()%>" />
                                                        <input type="hidden" value="<%=s.getCodigo()%>" name="txtcod"/>
                                                        <input type="hidden" value="<%=s.getEnderecocod()%>" name="end_cod"/>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <label  class="form-label">Bairro</label>
                                                        <select class="form-control" required name="txtbairro" >
                                                            <option value="" selected="" disabled="" class="sr-only">Selecione</option>
                                                            <%
                                                                String selected1 = "selected";
                                                                for (Bairro b : bDao.listar()) {
                                                                    if (s.getEnderecoM().getBairrocod().equals(b.getNome())) {
                                                                        selected1 = "selected";
                                                                    } else {
                                                                        selected1 = "";
                                                                    }
                                                            %>
                                                            <option value="<%=b.getCodigo()%>" <%=selected1%> ><%=b.getNome()%></option>
                                                            <%}%>
                                                        </select>
                                                    </div>
                                                    
                                                </div>
                                                
                                                <div class="row form-group">
                                                    <div class="col-sm-6">
                                                        <% String cep = s.getEnderecoM().getCep().replace("-", "");%>
                                                        <label class="form-label">CEP</label>
                                                        <input type="text" value="<%=cep%>" class="form-control" required name="txtcep" placeholder="CEP"
                                                               data-mask="99999-999" pattern="[0-9]{5}-[0-9]{3}"/>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <label for="txtbairro" class="form-label">Status</label>
                                                        <select class="form-control" required name="status" id="status">
                                                            <option value="" selected="" disabled="" class="sr-only">Selecione</option>
                                                            <%
                                                                String selected = "selected";
                                                                List<String> listarStatus = new ArrayList<>();
                                                                listarStatus.addAll(Arrays.asList(new String("Ativo"), new String("Desativado")));
                                                                for (String str : listarStatus) {
                                                                    if (s.getStatus().equals(str)) {
                                                                        selected = "selected";
                                                                    } else {
                                                                        selected = "";
                                                                    }
                                                            %>
                                                            <option <%=selected%> ><%=str%></option>
                                                            <%}%>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <a type="button" target="_blank" href="supermercado?acao=estoque&txtcod=<%=s.getCodigo()%>" 
                                                   class="btn btn-default" id="sombrabtn" >Listar produtos</a>
                                                <a type="submit" class="btn btn-success" id="sombrabtn"
                                                   href="supermercado?acao=addProdutos&txtcod=<%=s.getCodigo()%>"value="addProdutos" name="acao">Adicionar Produtos</a>
                                                <button type="submit" class="btn btn-primary" id="sombrabtn" 
                                                        value="alterar" name="acao">Alterar</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <%}%>
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
<script src="resources/js/sb-admin-2.js"></script>

<script src="resources/js/jquery.dataTables.min.js"></script>
<script src="resources/js/dataTables.bootstrap.min.js"></script>
<script src="resources/js/dataTables.responsive.js"></script>
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