
<%@page import="models.Supermercado"%>
<%@page import="java.util.List"%>
<%@page import="dao.SupermercadoDAO"%>
<%@page import="java.text.NumberFormat"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="cabecalhoAdm.jsp"/>

<div id="page-wrapper">


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
                            <input type="text" class="form-control" name="txtendereco"required placeholder="Endereço "/>
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
                                <td><%=s.getEndereco()%></td>
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
                                    <form action="supermercado" method="POST">
                                        <div class="modal-body">
                                            <div class="row form-group">
                                                <div class="  col-sm-6 ">
                                                    <label for="cNome" class="form-label">Nome</label>
                                                    <input type="text" class="form-control" required name="txtnome" id="cNome" 
                                                           placeholder="Nome do supermercado" value="<%=s.getNome()%>"  />
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="  col-sm-6 ">
                                                    <label for="cEnd" class="form-label">Endereço</label>
                                                    <input type="text" class="form-control" required name="txtendereco" id="cEnd" 
                                                           placeholder="Preencha seu nome completo" value="<%=s.getEndereco()%>" />
                                                    <input type="hidden" value="<%=s.getCodigo()%>" name="txtcod"/>
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
                        <%}%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

</body>

<script src="resources-freezer/js/jquery.min.js"></script>
<script src="resources-freezer/js/bootstrap.min.js"></script>
<script src="resources-freezer/js/metisMenu.min.js"></script>
<script src="resources-freezer/js/sb-admin-2.js"></script>

<script src="resources-freezer/js/jquery.dataTables.min.js"></script>
<script src="resources-freezer/js/dataTables.bootstrap.min.js"></script>
<script src="resources-freezer/js/dataTables.responsive.js"></script>

<script>
    $(document).ready(function () {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
</script>

</html>