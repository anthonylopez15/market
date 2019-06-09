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
            <%String codigo = request.getParameter("codigo");%>
                <form>
                    <div class="row">
                        <div class="col-xs-12">
                            <h2 class="page-header">
                                <i class="fa fa-align-right"></i> Produtos 
                            </h2>
                        </div>
                    </div>                

                    <!-- Table row -->
                    <div class="row">
                        <div class="col-xs-12">
                            <p class="lead">Compra #<%=codigo%></p>
                        </div>
                        <div class="panel-body">
                        
                            <div class="col-xs-12 table-responsive">

                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th class="text-center">Produto</th>
                                            <th class="text-center">Quantidade</th>
                                            <th>Preço Unitário</th>
                                            <th class="text-center">Subtotal</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!--inicio for-->
                                        <% 
                                            NumberFormat formatadorMoeda = NumberFormat.getCurrencyInstance();
                                            SupermercadoDAO dao = new SupermercadoDAO();
                                            
                                            List<ItemProduto> lista = dao.itensProdutosCompra(Integer.valueOf(codigo));
                                                for (ItemProduto item : lista){%>
                                        
                                        <tr>
                                            <td class="text-center"><%=item.produto_nome%></td>
                                            <td class="text-center"><%=item.getQuantidade()%></td>
                                            <td><%=formatadorMoeda.format (item.getPreco())%></td>
                                            <td class="text-center"><%=formatadorMoeda.format(item.subtotal)%></td>
                                            
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
