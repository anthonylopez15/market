<%@page import="models.Produto"%>
<%@page import="dao.ProdutoDAO"%>
<%@page import="dao.MarcaDAO"%>
<%@page import="java.util.List"%>
<%@page import="models.Marca"%>
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

                <h1 class="page-header">Marcas</h1>
            </div>

        </div>

        <div class="row">
            <div class="col-sm-4">
                <button class="btn btn-success" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                    <i class="fa fa-plus"></i>
                </button>
                <br>
                <br>
                <div class="collapse" id="collapseExample">
                    <form action="marca" method="post"  class="form-horizontal" >
                        <div class="well well-sm">

                            <p>
                                <input type="text" class="form-control" name="txtnome"required placeholder="Nome"/>
                            </p>

                            </p>
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
                        Lista de Marcas
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                                <tr>
                                    <th>Codigo</th>
                                    <th>Nome</th>
                                    <th>Ação</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    MarcaDAO mDao = new MarcaDAO();
                                    List<Marca> listar = mDao.listaMarcas();
                                    for (Marca m : listar) {
                                %>

                                <tr class="odd gradeX">
                                    <td><%=m.getCodigo()%></td>
                                    <td><%=m.getNome()%></td>
                                    <td class="text-center">
                                        <a href="#" data-toggle="modal" data-cod="<%=m.getCodigo()%>"
                                           data-target="#<%=m.getCodigo()%>" >Abrir</a>
                                    </td>
                                </tr>
                            <div class="modal fade" id="<%=m.getCodigo()%>"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                <div class="modal-dialog modal-sm" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                            <h3 class="modal-title" id="myModalLabel">Dados Marca</h3>
                                        </div>
                                        <form action="marca" method="post">
                                            <div class="modal-body">
                                                <div class="row form-group">
                                                    <div class="col-lg-12">
                                                        <label for="cNome" class="form-label">Nome</label>
                                                        <input type="text" class="form-control" required name="txtnome" id="cNome" 
                                                               placeholder="Nome do supermercado" value="<%=m.getNome()%>"  />
                                                        <input type="hidden" name="codigo" value="<%=m.getCodigo()%>"  />
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

<script>
    $(document).ready(function () {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
</script>
</body>
</html>