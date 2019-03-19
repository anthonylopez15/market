<%@page import="models.Produto"%>
<%@page import="dao.ProdutoDAO"%>
<%@page import="dao.MarcaDAO"%>
<%@page import="java.util.List"%>
<%@page import="models.Marca"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="cabecalhoAdm.jsp"/>

<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Marcas</h1>
        </div>
        <!-- /.col-lg-12 -->

    </div>

    <div class="row">
        <div class="col-sm-4">
            <button class="btn btn-success" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                <!--Cadastrar-->
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
                        <p><button type="submit" name="acao" value="criarMarca" class="btn btn-info"> Salvar</button></p>

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
                                    <a href="#"><i class="fa fa-user fa-file-text"></i> Abrir</a>
                                </td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>


</div>
</body>

<script src="resources-freezer/js/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="resources-freezer/js/bootstrap.min.js"></script>

<script src="resources-freezer/js/metisMenu.min.js"></script>

<script src="resources-freezer/js/jquery.dataTables.min.js"></script>
<script src="resources-freezer/js/dataTables.bootstrap.min.js"></script>
<script src="resources-freezer/js/dataTables.responsive.js"></script>
<!-- Custom Theme JavaScript -->
<script src="resources-freezer/js/sb-admin-2.js"></script>
<script>
    $(document).ready(function () {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
</script>

</html>