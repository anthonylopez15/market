<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="base.jsp"/>


<div class="row">
    <div class="col-md-8 col-md-offset-2">
        <div class="page-header">
            <h1>Entrar</h1>
        </div>

        <div class="alert
             <%
                 if (request.getAttribute("alert") != null) {
                     out.print(request.getAttribute("alert"));
                 }
             %>">
            <%  
                if (request.getAttribute("msg") != null) {
                    out.print(request.getAttribute("msg"));
                }
            %>
        </div>

        <form action="session" method="post" class="form-horizontal">
            <fieldset>
                <div class="form-group">
                    <label for="id_username" class="col-md-3 control-label">Usuário</label>
                    <div class="col-md-8">
                        <input type="text" name="login" required autofocus class="form-control" id="id_username" placeholder="Usuário" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="id_password" class="col-md-3 control-label">Senha</label>
                    <div class="col-md-8">
                        <input type="password" required name="senha" class="form-control" id="id_password" placeholder="Senha" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-8 col-md-offset-3">
                        <button type="submit" value="logar" name="acao" class="btn btn-primary">Enviar</button>
                    </div>
                </div>
            </fieldset>
        </form>
    </div>
</div>
<c:import url="footer.jsp"/>
