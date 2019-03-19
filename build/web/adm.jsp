
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
            <h1 class="page-header">Supermercados</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <!--    <div class="row">
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-yellow">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-5x fa-calendar-minus-o"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">5</div>
                                <div>Details 1</div>
                            </div>
                        </div>
                    </div>
                    <a href="#">
                        <div class="panel-footer">
                            <span class="pull-left">Mais Detalhes</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-green">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-5x fa-calendar-check-o"></i>
                            </div>
                            <div class="col-xs-9 text-right">
    
                                <div class="huge"> 40 </div>
                                <div>Details 2</div>
                            </div>
                        </div>
                    </div>
                    <a href="#">
                        <div class="panel-footer">
                            <span class="pull-left">Mais Detalhes</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-danger">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-5x fa-calendar-times-o"></i>
                            </div>
                            <div class="col-xs-9 text-right">
    
                                <div class="huge">34</div>
                                <div>Details 3</div>
                            </div>
                        </div>
                    </div>
                    <a href="#">
                        <div class="panel-footer">
                            <span class="pull-left">Mais Detalhes</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
        </div>-->
    <!-- /.row -->

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
                        <p><button type="submit" name="acao" value="criarSupermercado" class="btn btn-info"> Salvar</button></p>

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
                                    <a href="#" data-toggle="modal" data-cod="<%=s.getCodigo()%>" data-target="#<%=s.getCodigo()%>" >
                                        <i class="fa fa-user fa-file-text"> </i> 
                                        Abrir
                                    </a>
                                </td>
                        <div class="modal fade" id="<%=s.getCodigo()%>"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                            <div class="modal-dialog modal-lg" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                        <h3 class="modal-title" id="myModalLabel">Dados Supermercado</h3>
                                    </div>
                                    <div class="modal-body">

                                        <div class="row form-group">
                                            <div class="  col-sm-6 ">
                                                <label for="cNome" class="form-label">Nome</label>
                                                <input type="text" class="form-control" required name="txtNome" id="cNome" placeholder="Preencha seu nome completo"
                                                       value="<%=s.getNome()%>" data-bv-notempty-message="Nome completo obrigatório." />
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="  col-sm-6 ">
                                                <label for="cNome" class="form-label">Endereço</label>
                                                <input type="text" class="form-control" required name="txtNome" id="cNome" placeholder="Preencha seu nome completo"
                                                       value="<%=s.getEndereco()%>" data-bv-notempty-message="Nome completo obrigatório." />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn" id="sombrabtn" data-dismiss="modal">Fechar</button>
                                        <input type="hidden" name="acao" value="solicitar" />
                                        <button type="sumit" class="btn btn-primary" id="sombrabtn" href="#<%=s.getCodigo()%>" > Solicitar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </tr>
                        <%}%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<script type="text/javascript">
    $(function () {
        $('[data-toggle="popover"]').popover();
    });
    $(function () {
        $("#dialog-message").dialog({
            modal: true,
            buttons: {
                Ok: function () {
                    $(this).dialog("close");
                    history.back();
                }
            }
        });
    });
</script>

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