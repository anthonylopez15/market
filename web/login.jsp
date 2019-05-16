<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="base.jsp"/>
  <!-- Full Width Column -->
  <div class="content-wrapper">
    <div class="container">

      <!-- INÍCIO DO CONTEÚDO -->
        <section class="content login-content" style="margin: 10% auto">
            <div class="login-logo">
                       <b>SPM</b> | Login
            </div>
            
            <div class="col-xs-12 col-sm-offset-3 col-sm-6 login-box-body">
                <div class="alert
                    <% if (request.getAttribute("alert") != null) {
                         out.print(request.getAttribute("alert"));
                     }%>" >
                    <%if (request.getAttribute("msg") != null) {
                        out.print(request.getAttribute("msg"));
                    }%>
                </div>
                <p class="login-box-msg">Por favor, efetue o login para continuar</p>
                
                <form action="session" method="post" class="form-horizontal">
                    <div class="form-group has-feedback">
                        <input type="text" name="login" required autofocus class="form-control" id="id_username" placeholder="Usuário" />
                        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                    </div>
                    <div class="form-group has-feedback">
                        <input type="password" required name="senha" class="form-control" id="id_password" placeholder="Senha" />
                        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                    </div>
                    <div class="row">
                        <!-- /.col -->
                        <div class="col-xs-offset-8 col-xs-4">
                            <button type="submit" value="logar" name="acao" class="btn btn-primary btn-block btn-flat">Entrar</button>
                        </div>
                        <!-- /.col -->
                    </div>
                </form>
            </div>
        </section>
    </div>
  </div>
  <c:import url="footer.jsp"/>
</div>

<script src="static/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="static/bootstrap/js/bootstrap.min.js"></script>
<script src="static/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="static/plugins/fastclick/fastclick.js"></script>
<script src="static/assets/js/app.min.js"></script>
<script src="static/assets/js/demo.js"></script>
</body>
</html>
