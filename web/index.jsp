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

        <section class="content">

            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-solid">
                        <div class="box-header with-border">
                            <h2 class="page-header">
                                <i class="fa fa-shopping-cart"></i> Pesquisar produtos
                            </h2>
                            <form method="get" action="pesquisa">
                                <div class="form-group">
                                    <label class="control-label sr-only" for="inputSuccess"><i class="fa fa-check"></i> Pesquisar</label>
                                    <input type="text" class="form-control" name="q" id="inputSuccess" placeholder="Digite o nome do produto">
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
                    <% for (Produto p: listaProdutos){ %>    
                    <form action="pesquisa" method="post">
                        <div class="menu-item-info-box">
                            <span class="menu-item-info-box-icon"><img src="static/assets/img/foods/cupcake.png"></span>

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
                            <%  List<ListaCompra> itens = null;
                            if (carrinho != null) {
                                itens = carrinho.getItems();
                                for(ListaCompra item: itens){
                            %>
                                <tr>
                                  <th style="width:60%"><%=item.getProduto().getNome()%> - <%=item.getProduto().getMarca()%></th>
                                  <td class="text-right">Qtde: <%=item.getQuantidade()%></td>
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
                            <a href="order.html" class="btn btn-success"><i class="fa fa-credit-card"></i> Fechar Carrinho</a>
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

<script src="static/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="static/bootstrap/js/bootstrap.min.js"></script>
<script src="static/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="static/plugins/fastclick/fastclick.js"></script>
<script src="static/assets/js/app.min.js"></script>
<script src="static/assets/js/demo.js"></script>
</body>
</html>
