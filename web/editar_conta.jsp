<%@page import="dao.UsuarioDAO"%>
<%@page import="models.Usuario"%>
<%@page import="models.Bairro"%>
<%@page import="dao.BairroDAO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="base.jsp"/>

<%  
UsuarioDAO udao = new UsuarioDAO();
int codigo = (int) session.getAttribute("codigo");
Usuario u = udao.getAll(codigo);
%>

<div class="content-wrapper">
    <div class="container">
        <section class="content">
            <div class="box box-solid">
                <div class="box-header with-border">
                    <h2 class="page-header">
                        <i class="fa fa-users"></i> Meus dados
                    </h2>
                    <form action="cliente" method="post" id="defaultForm" method="post" action="#"  class="form-horizontal" 
                          data-bv-feedbackicons-valid="glyphicon glyphicon-ok"
                          data-bv-feedbackicons-invalid="glyphicon glyphicon-remove" data-bv-feedbackicons-validating="glyphicon glyphicon-refresh">
                        <div class="row form-group">
                            <div class="col-sm-6">
                                <label for="cNome" class="form-label">Nome</label>
                                <input type="text" value="<%=u.getNome()%>" class="form-control" required name="txtnome" id="cNome" 
                                       placeholder="Nome completo" data-bv-notempty-message="Campo obrigatório." />
                            </div>
                            <div class="col-sm-6">
                                <label for="ctel" class="form-label">Telefone/Celular</label>
                                <input type="tel" class="form-control" value="<%=u.getTelefone()%>" required="" name="txttelefone" id="ctel"
                                       placeholder="(99) 99999-9999" data-mask="(99) 99999-9999" pattern="\([0-9]{2}\) [0-9]{5}-[0-9]{4}"/>
                            </div>
                        </div> 

                        <div class="row form-group">
                            <div class="col-sm-4">
                                <label for="txtlogin" class="form-label">E-mail</label>
                                <input type="email"  name="txtemail" class="form-control" value="<%=u.getEmail()%>" id="txtemail" placeholder="Digite seu email"/>
                            </div>
                            <div class="col-sm-4">
                                <label for="txtlogin" class="form-label">Login</label>
                                <input type="text" class="form-control" disabled value="<%=u.getLogin()%>"
                                       data-bv-notempty-message="Campo obrigatório." required name="txtlogin" id="txtlogin" placeholder="Login"/>
                            </div>
                            <div class="col-sm-4">
                                <label for="txtsenha" class="form-label">Senha</label>
                                <input type="password" class="form-control" required name="txtsenha" value="<%=u.getSenha()%>"
                                       data-bv-notempty-message="Campo obrigatório." id="txtsenha" placeholder="Senha" minlength="5"/>
                            </div>
                        </div>

                        <div class="row form-group">
                            <div class="col-sm-6">
                                <label for="txtrua" class="form-label">Rua/Logradouro</label>
                                <input type="text" class="form-control" value="<%=u.getE().getRua()%>" required name="txtrua" id="txtrua" 
                                       data-bv-notempty-message="Campo obrigatório." placeholder="Endereço"/>
                            </div>
                            <div class="col-sm-6">
                                <label for="txtnumero" class="form-label">Número</label>
                                <input type="text" class="form-control" value="<%=u.getE().getNumero()%>" required name="txtnumero" id="txtnumero" 
                                       data-bv-notempty-message="Campo obrigatório." placeholder="Endereço"/>
                            </div>

                        </div>

                        <div class="row form-group">
                            <div class="col-sm-6">
                                <label for="txtcep" class="form-label">CEP</label>
                                <input type="hidden" name="endcod" value="<%=u.getE().getCodigo()%>"/>
                                <input type="hidden" name="codigo" value="<%=u.getCodigo()%>"/>
                                <input type="text" class="form-control" required value="<%=u.getE().getCep()%>" name="txtcep" id="txtcep" placeholder="CEP"
                                       data-bv-notempty-message="Campo obrigatório." data-mask="99999-999" pattern="[0-9]{5}-[0-9]{3}"/>
                            </div>
                            <div class="col-sm-6">
                                <label for="txtbairro" class="form-label">Bairro</label>
                                <select class="form-control" data-bv-notempty-message="Campo obrigatório." required name="txtbairro" id="txtbairro">
                                    <option value="" selected="" disabled="" class="sr-only">Selecione</option>
                                    <%
                                        BairroDAO bDao = new BairroDAO();
                                        String selected = "selected";
                                        for (Bairro b : bDao.listar()) {
                                            if (b.getCodigo() == Integer.valueOf(u.getE().getBairrocod())) {
                                                selected = "selected";
                                            } else {
                                                selected = "";
                                            }
                                    %>
                                    <option value="<%=b.getCodigo()%>"<%=selected%> ><%=b.getNome()%></option>
                                    <%}%>
                                </select>
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col-sm-6">
                                <button type="submit" class="btn btn-primary" id="sombrabtn" 
                                        value="alterar" name="acao">Alterar</button>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </section>


    </div>
    <!-- /.container -->
</div>
<!-- /.content-wrapper -->

<c:import url="footer.jsp"/>

</div>
<!-- ./wrapper -->


<script src="design/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="resources/js/bootstrapValidator.js" type="text/javascript" ></script>
<script type="text/javascript" src="resources/js/jquery.mask.js"></script>
<script src="design/bootstrap/js/bootstrap.min.js"></script>
<script src="design/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="design/plugins/fastclick/fastclick.js"></script>
<script src="design/assets/js/app.min.js"></script>
<script src="design/assets/js/demo.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#defaultForm').bootstrapValidator();
    });
</script>
</body>
</html>
