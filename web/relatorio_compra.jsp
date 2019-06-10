
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="cabecalhoAdm.jsp"/>

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

                <h1 class="page-header">Relatório de compras por periódo</h1>
            </div>

        </div>

        <div class="row">
            <div class="col-sm-6">

                <form action="relatorios" method="post">

                    <div class="row form-group">
                        <div class="col-sm-6">
                            <label class="form-label">Data inicial</label>
                            <input type="date" class="form-control" required name="datainicial" />
                        </div>
                        <div class="col-sm-6">
                            <label  class="form-label">Data final</label>
                            <input type="date" class="form-control" required name="datafinal" />
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary" value="compraPeriodo" name="acao">Gerar</button>
                </form>
            </div>
        </div>

    </div>
</div>

</div>

<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/metisMenu.min.js"></script>
<script src="resources/js/sb-admin-2.js"></script>
</body>
</html>