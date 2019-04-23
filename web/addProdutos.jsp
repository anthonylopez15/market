
<%@page import="models.Supermercado"%>
<%@page import="dao.SupermercadoDAO"%>
<%@page import="models.Produto"%>
<%@page import="models.Produto"%>
<%@page import="dao.ProdutoDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.NumberFormat"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="cabecalhoAdm.jsp"/>

<style>
    .form-group {
        margin-bottom: 0px; 
    }
</style>

<%
    SupermercadoDAO dao = new SupermercadoDAO();
    int codigoSupermercado = Integer.parseInt(request.getParameter("txtcod"));
    Supermercado s = dao.getProCodigo(codigoSupermercado);
    String supermercado_cod = String.valueOf(s.getCodigo());
    String supermercado = s.getNome();
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

                <h2 class="page-header">Incluir produtos - <%=supermercado%>.</h2>
            </div>
        </div>


        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Lista de Produtos - <a href="supermercado?acao=estoque&txtcod=<%=supermercado_cod%>" target="_blank" >Ver meus produtos</a>
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                                <tr>
                                    <th>Codigo</th>
                                    <th>Nome</th>
                                    <th>Marca</th>
                                    <th>Ação</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    ProdutoDAO pDao = new ProdutoDAO();
                                    List<Produto> listar = pDao.listar("Ativo");
                                    for (Produto p : listar) {
                                %>

                                <tr class="odd gradeX">
                                    <td><%=p.getCodigo()%></td>
                                    <td><%=p.getNome()%></td>
                                    <td><%=p.getMarcacod()%></td>
                                    <td class="text-center">
                                        <a  href="#" data-toggle="modal" data-cod="<%=p.getCodigo()%>"
                                            data-target="#<%=p.getCodigo()%>">Adicionar</a>
                                    </td>
                                </tr>
                            <div class="modal fade" id="<%=p.getCodigo()%>"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                <div class="modal-dialog modal-sm" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                            <h3 class="modal-title" id="myModalLabel">Inserir Preço</h3>
                                        </div>
                                        <form action="supermercado" method="post">
                                            <div class="modal-body">
                                                <div class="row form-group" >
                                                    <div class="col-lg-12">
                                                        <div class="input-group" data-pg-collapsed>
                                                            <span class="input-group-btn">
                                                                <button type="button" class="btn btn-info">R$</button>
                                                            </span>
                                                            <input type="text" required name="txtpreco" placeholder="0,00" data-mask="#.##0,00" maxlength="10"
                                                                   class="simple-field-data-mask-reverse form-control"  data-mask-reverse="false" data-mask-maxlength="false" />
                                                        </div>
                                                        <input type="hidden" name="produtocod" value="<%=p.getCodigo()%>"  />
                                                        <input type="hidden" name="txtcod" value="<%=supermercado_cod%>"  />
                                                        <input type="hidden" name="txtnome" value="<%=supermercado%>"  />
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn" id="sombrabtn" data-dismiss="modal">Fechar</button>
                                                <button type="submit" class="btn btn-primary" id="sombrabtn" 
                                                        value="addProdutos" name="acao">Salvar</button>
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


<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/metisMenu.min.js"></script>
<script src="resources/js/sb-admin-2.js"></script>
<script src="resources/js/jquery.mask.js"></script>

<script src="resources/js/jquery.dataTables.min.js"></script>
<script src="resources/js/dataTables.bootstrap.min.js"></script>
<script src="resources/js/dataTables.responsive.js"></script>

<script>
    $(document).ready(function () {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
</script>
</body>
</html>