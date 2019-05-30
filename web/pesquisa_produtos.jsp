<%@page import="java.text.NumberFormat"%>
<%@page import="dao.Carrinho"%>
<%@page import="models.ItemProduto"%>
<%@page import="models.ListaCompra"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="base.jsp"/>

<div class="content-wrapper">
    <div class="container">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>

            </h1>
        </section>
        <%
//            List<ListaCompra> listCompra = new ArrayList<>();
            List<ListaCompra> listCompra = (List<ListaCompra>) request.getAttribute("listCompra");
            Carrinho carrinho = (Carrinho) session.getAttribute("carrinho");
            List<ItemProduto> itens = carrinho.getItems();
        %>
        <!-- Main content -->
        <section class="content">

            <div class="row">
                <!-- INICIO DO CONTEUDO -->
                <!--For-->
                
                <%  
                    NumberFormat formatadorMoeda = NumberFormat.getCurrencyInstance();
                    for (ListaCompra ite : listCompra) {
                    int tam = ite.getListProdutos().size();
                    double total = 0;
                %>
                <div class="col-xs-12 col-sm-6">

                    <div class="box box-solid">
                        <div class="box-header with-border">
                            <span class="btn btn-instagram pull-right"><a href="#" class="fa fa-save"></a></i> Imprimir</span>
                            <div class="user-block">
                                <img alt="User Image" class="img-circle" src="design/img/reactions/loved.png">
                                <span class="username"><%=ite.getSupermercado()%></span>
                                <span class="description"><%=tam%> produto(s) encontrado(s) de <%=itens.size()%> da sua lista.</span>
                            </div>
                        </div>

                        <div class="box-body">
                            <table class="table col-md-12 table-bordered">
                                <thead>
                                    <tr>
                                        <th>Produto</th>
                                        <th>Marca</th>
                                        <th>Preço</th>
                                        <th>Quantidade</th>
                                        <th>Subtotal</th>
                                    </tr>
                                </thead>
                                <tbody>

                                <%
                                double subtotal = 0;
                                for (ItemProduto p : ite.getListProdutos()) {
                                    
                                    String preco = formatadorMoeda.format(p.getEstoque().getPreco());
                                    subtotal = p.getEstoque().getPreco() * p.getQuantidade();
                                    String subtotal_str = formatadorMoeda.format(subtotal);
                                %>
                                    <tr>
                                        <td><%=p.getProduto().getNome()%></td>
                                        <td><%=p.getProduto().getMarca()%></td>
                                        <td><%=preco%></td>
                                        <td><%=p.getQuantidade()%></td>
                                        <td><%=subtotal_str%></td>
                                    </tr>

                                </tbody>
                                <% total = total +  subtotal; %>
                                <%}%>
                            </table>
                            <span class="review-score pull-right"><i class="fa fa-money"></i> Total: <%=formatadorMoeda.format(total)%></span>
                        </div>
                    </div>
                </div>
                <%}%>
                <!--fim for-->
                
                <!--FIM DO CONTEUDO -->
            </div>


        </section>
        <!-- /.content -->
    </div>
    <!-- /.container -->
</div>
<c:import url="footer.jsp"/>
</div>
<!-- ./wrapper -->

<script src="design/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="design/bootstrap/js/bootstrap.min.js"></script>
<script src="design/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="design/plugins/fastclick/fastclick.js"></script>
<script src="design/assets/js/app.min.js"></script>
<script src="design/assets/js/demo.js"></script>
</body>
</html>