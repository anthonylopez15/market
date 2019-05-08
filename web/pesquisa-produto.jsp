<%@page import="models.Produto"%>
<%@page import="dao.ProdutoDAO"%>
<%@page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="base.jsp"/>

<div class="page-header">
    <div class="row">
        <div class="col-lg-6">
            <div class="input-group">
                <input type="text" class="form-control" placeholder="Pesquise seus produtos aqui...">
                <span class="input-group-btn">
                    <button class="btn btn-primary" type="button">
                        <i class="fa fa-search"></i>
                    </button>
                </span>
            </div>
        </div>
    </div>
    <h2>Resultado da pesquisa</h2>
</div>
<div class="row">
    <%
        ProdutoDAO sDao = new ProdutoDAO();
        List<Produto> list = sDao.listar("Ativo");
        for (Produto s : list) {
    %>
    <div class="col-sm-6">
        <div class="media">
            <div class="media-left ">
                <a href="#">
                    <img class="media-object img-circle" src="http://placehold.it/100x100" width="65" height="65">
                </a>
            </div>
            <div class="media-body">
                <h4 class="media-heading"><%=s.getNome()%></h4>
                <p><%=s.getMarcacod().getNome()%></p>
                <p><a href="#" class="btn btn-success btn-sm" role="button">Adicionar</a> </p>
            </div>
        </div>
    </div>
    <%}%>
</div>
<c:import url="footer.jsp"/>