<%@page import="models.ItemProduto"%>
<%@page import="models.ListaCompra"%>
<%@page import="dao.Carrinho"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="models.Produto"%>
<%@page import="dao.ProdutoDAO"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="base.jsp"/>
<%
ProdutoDAO dao = new ProdutoDAO();
List<Produto> listaProdutos = new ArrayList<>();
if(session.getAttribute("listProdutos") != null){
    listaProdutos = (List<Produto>) session.getAttribute("listProdutos");
}

%>
  <div class="content-wrapper">
    <div class="container">
        <section class="content-header">
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
        </section>

        <section class="content">

            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-solid">
                        <div class="box-header with-border">
                            <h2 class="page-header">
                                <i class="fa fa-shopping-cart"></i> Pesquisar produtos
                            </h2>
                            <form method="post" action="pesquisa">
                                <div class="form-group">
                                    <label class="control-label sr-only" for="inputSuccess"><i class="fa fa-check"></i> Pesquisar</label>
                                    <input type="text" class="form-control" required name="q" id="inputSuccess" placeholder="Digite o nome do produto">
                                    <button class="hidden" type="submit" name="acao" value="buscar"></button>
                                    <span class="help-block"></span>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            

            <div class="row">
                <!--INÍCIO DO MENU -->
                <div class="col-md-8 col-xs-12">
                    <% for (Produto p : listaProdutos) {%>    
                    <form action="pesquisa" method="get">
                        <div class="menu-item-info-box">
                            <!--<span class="menu-item-info-box-icon"><img src="static/assets/img/foods/cupcake.png"></span>-->

                            <div class="menu-item-info-box-content">
                                <span class="menu-item-info-box-text"><%=p.getNome()%> - <%=p.getMarca()%></span>
                                <span class="menu-item-info-box-detail"><%=p.getDescricao()%></span>
                                <!--<span class="menu-item-info-box-price">Qtd : 1</span>-->
                                <input type="hidden" value="<%=p.getNome()%>" name="nome" />
                                <input type="hidden" value="<%=p.getCodigo()%>" name="codigo" />
                                <input type="hidden" value="<%=p.getDescricao()%>" name="descricao" />
                                <input type="hidden" value="<%=p.getMarca()%>" name="marca" />
                                <button type="submit" value="add" name="acao" class="btn btn-info">
                                    <i class="fa fa-plus-circle"></i> Adicionar
                                </button>
                            </div>
                            <!-- /.info-box-content -->
                        </div>
                        <!-- /.info-box -->
                    </form>
                    <%}%>
                </div>
                
                <% if (listaProdutos.size() == 0) { %>
                <div class="col-md-8 col-xs-12">
                    Sem resultados.
                </div>
                <%}%>


                <% Carrinho carrinho = (Carrinho) session.getAttribute("carrinho"); %>
                <div class="col-md-4 col-xs-12" >
                    <!--INICIO DO CARRINHO-->
                    <div class="box box-solid">
                        <div class="box-header">
                            <i class="fa fa-shopping-cart"></i>

                            <h3 class="box-title">Carrinho de produtos</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <tbody>
                                        <%  List<ItemProduto> itens = null;
                                            if (carrinho != null) {
                                                itens = carrinho.getItems();
                                                for (ItemProduto item : itens) {
                                        %>
                                        <tr>
                                            <th style="width:60%"><%=item.getProduto().getNome()%> - <%=item.getProduto().getMarca()%></th>
                                            <td class="text-right">Qtde: <%=item.getQuantidade()%></td>
                                            <td class="text-right">
                                                <a  href="pesquisa?acao=remover&item=<%=itens.indexOf(item)%>" class="btn btn-sm danger"><i class="fa fa-remove"></i></a>
                                            </td>
                                        </tr>
                                        <%}
                                            }%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="box-footer">
                            <div class="pull-right">
                                <a type="button" href="pesquisa?acao=removerCarrinho" class="btn btn-danger"><i class="fa fa-trash"></i> Limpar</a>
                                <a href="pesquisa?acao=pesquisarItens" class="btn btn-success"><i class="fa fa-search"></i> Pesquisar</a>
                            </div>
                        </div>
                    </div>
                    <!-- FIM DO CARRINHO -->
                </div>
                <!-- FIM DO MENU -->
            </div>

        </section>
      <!-- FIM DO CONTEÚDO -->
    </div>
    <!-- /.container -->
  </div>
  <!-- /.content-wrapper -->
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
