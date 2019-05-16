<%@page import="java.util.List"%>
<%@page import="models.Supermercado"%>
<%@page import="dao.SupermercadoDAO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="base.jsp"/>
<div class="page-header">
    <h2>Pesquisar Produtos</h2>
</div>
    <div class="row">
        <%
            SupermercadoDAO sDao = new SupermercadoDAO();
            List<Supermercado> list = sDao.listar();
            for (Supermercado s : list) {
        %>
        <div class="col-md-8 col-xs-12">
            <div class="thumbnail">
<!--                <a href="#">
                    <img src="http://placehold.it/350x250" alt="" />
                </a>-->
                <div class="caption">
                    <h4><%=s.getNome()%></h4>
                    <p><%=s.getEnderecocod()%></p>
                    <p>
                        <a href="#" class="btn btn-success" role="button">Listar produtos</a> 
                    </p>
                </div>
            </div>
        </div>
        <%}%>
        <div class="col-md-4 col-xs-12">
            <div class="thumbnail">
              <!--INICIO DO CARRINHO-->
              <div class="box box-solid">
                <div class="box-header">
                  <i class="fa fa-shopping-cart"></i>

                  <h3 class="box-title">Carrinho</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                  <div class="table-responsive">
                      <table class="table">
                        <tbody>
                        <tr>
                          <th style="width:60%">Cerveja:</th>

                          <td class="text-right">R$ 6,00</td>

                        </tr>
                        <tr>
                          <th>Pork Burger</th>

                          <td class="text-right">R$ 22,00</td>
                        </tr>
                        <tr>
                          <th>Frete:</th>

                          <td class="text-right">R$ 8,00</td>
                        </tr>
                        <tr>
                          <th>Total:</th>

                          <td class="text-right">R$ 80,90</td>
                        </tr>
                      </tbody></table>
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
        </div>
    <%--<c:import url="footer.jsp"/>--%>