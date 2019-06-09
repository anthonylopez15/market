<%@page import="models.ItemProduto"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="models.ListaCompra"%>
<%@page import="java.util.List"%>
<%@page import="models.Supermercado"%>
<%@page import="dao.SupermercadoDAO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="base.jsp"/>
<div class="content-wrapper">
    <div class="container">

        <!--INICIO DO CONTEUDO-->
        <section class="content-header">
        </section>

        <section class="content">
            <section class="invoice">

                <form>
                    <div class="row">
                        <div class="col-xs-12">
                            <h2 class="page-header">
                                <i class="fa fa-align-right"></i> Histórico de Compras
                            </h2>
                        </div>
                    </div>                

                    <!-- Table row -->
                    <div class="row">
                        <div class="col-xs-12">
                            <p class="lead">Minhas compras:</p>
                        </div>
                        <div class="panel-body">
                        
                            <div class="col-xs-12 table-responsive">

                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th class="text-center">Codigo</th>
                                            <th class="text-center">Data/Hora</th>
                                            <th>Supermercado</th>
                                            <th class="text-center">Total compra</th>
                                            <th class="text-center">Qtde Produtos</th>
                                            <th class="text-right">Abrir</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!--inicio for-->

                                        <% 
                                            SimpleDateFormat formatador = new SimpleDateFormat("dd/MM/yyyy");
                                            NumberFormat formatadorMoeda = NumberFormat.getCurrencyInstance();
                                            SupermercadoDAO dao = new SupermercadoDAO();
                                            int codigo = (int) session.getAttribute("codigo");
                                            List<ListaCompra> list = dao.minhaLista(codigo); 
                                            for (ListaCompra compra: list){
                                        %>
                                        <tr>
                                            <td class="text-center">#<%=compra.getCodigo()%></td>
                                            <td class="text-center"><%=formatador.format(compra.getDatahora())%></td>
                                            <td><%=compra.getSupermercado_str()%></td>
                                            <td class="text-center"><%=formatadorMoeda.format(compra.total)%></td>
                                            <td class="text-center"><%=compra.qtd_prod%></td>
                                            <td class="text-right">
                                                <a href="itens_compra.jsp?codigo=<%=compra.getCodigo()%>" target="_blank" class="btn btn-sm info" data-toggle="modal">
                                                    <i class="fa fa-external-link"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    <%}%>
                                    <!--fim for-->
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->

                </form>

            </section>
        </section>
        <!-- FIM DO CONTEUDO-->
    </div>
    <!-- /.container -->
</div>
<c:import url="footer.jsp"/>
</div>

<script src="design/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="design/bootstrap/js/bootstrap.min.js"></script>
<script src="design/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="design/plugins/fastclick/fastclick.js"></script>
<script src="design/assets/js/app.min.js"></script>
<script src="design/assets/js/demo.js"></script>
</body>
</html>
