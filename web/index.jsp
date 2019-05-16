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
if(request.getAttribute("listProdutos") != null){
    listaProdutos = (List<Produto>) request.getAttribute("listProdutos");
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
                    <form action="pesquisa" method="get">
                        <div class="menu-item-info-box">
                            <span class="menu-item-info-box-icon"><img src="static/assets/img/foods/cupcake.png"></span>

                            <div class="menu-item-info-box-content">
                              <span class="menu-item-info-box-text"><%=p.getNome()%> - <%=p.getMarca()%></span>
                              <span class="menu-item-info-box-detail"><%=p.getDescricao()%></span>
                              <!--<span class="menu-item-info-box-price">Qtd : 1</span>-->
                              <input type="text" value="<%=p.getNome()%>" name="nome" />
                              <input type="text" value="<%=p.getCodigo()%>" name="codigo" />
                              <input type="text" value="<%=p.getDescricao()%>" name="descricao" />
                              <input type="text" value="<%=p.getMarca()%>" name="marca" />
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
                    
               
                <div class="col-md-4 col-xs-12 " >
                  <!--INICIO DO CARRINHO-->
                  <div class="box box-solid">
                    <div class="box-header">
                      <i class="fa fa-shopping-cart"></i>

                      <% Carrinho carrinho = (Carrinho) session.getAttribute("carrinho"); %>
                      <h3 class="box-title">Carrinho de produtos</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                    <div class="table-responsive">
                        <table class="table">
                            <tbody>
                            <%  List<Produto> itens = null;
                            if (carrinho != null) {
                                itens = carrinho.getItems();
                                for(Produto p: itens){
                            %>
                                <tr>
                                  <th style="width:60%"><%=p.getNome()%></th>
                                  <td class="text-right">Qtde 2</td>
                                </tr>
                                <%}
                            }%>
                            <tr>
                                  <th style="width:60%">opaa</th>
                                  <td class="text-right">Qtde 2</td>
                                </tr>
                            </tbody>
                        </table>
                      </div>
                    </div>
                    <div class="box-footer">
                        <div class="pull-right">
                          <button type="button" class="btn btn-danger"><i class="fa fa-trash"></i> Limpar</button>
                          <a href="order.html" class="btn btn-success"><i class="fa fa-credit-card"></i> Fechar Pedido</a>
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
