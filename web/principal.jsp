<%@page import="java.util.List"%>
<%@page import="models.Supermercado"%>
<%@page import="dao.SupermercadoDAO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="base.jsp"/>
<div class="page-header">
    <h2>Supermercados</h2>
</div>
    <div class="row">
        <%
            SupermercadoDAO sDao = new SupermercadoDAO();
            List<Supermercado> list = sDao.listar();
            for (Supermercado s : list) {
        %>
        <div class="col-sm-3">
            <div class="thumbnail">
                <a href="#">
                    <img src="http://placehold.it/350x250" alt="" />
                </a>
                <div class="caption">
                    <h4><%=s.getNome()%></h4>
                    <p><%=s.getEndereco()%></p>
                    <p>
                        <a href="#" class="btn btn-success" role="button">Listar produtos</a> 
                    </p>
                </div>
            </div>
        </div>
        <%}%>
    </div>
    <c:import url="footer.jsp"/>