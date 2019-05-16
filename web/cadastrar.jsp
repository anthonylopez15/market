<%@page import="models.Bairro"%>
<%@page import="dao.BairroDAO"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="base.jsp"/>

<div class="content-wrapper">
    <div class="container">

        <section class="content">

            <div class="box box-solid">
                <div class="box-header with-border">
                    <h2 class="page-header">
                        <i class="fa fa-users"></i> Cadastro
                    </h2>
                    <form action="cliente" method="post" id="defaultForm" method="post" action="#"  class="form-horizontal" 
                          data-bv-feedbackicons-valid="glyphicon glyphicon-ok"
                          data-bv-feedbackicons-invalid="glyphicon glyphicon-remove" data-bv-feedbackicons-validating="glyphicon glyphicon-refresh">
                        <div class="row form-group">
                            <div class="col-sm-6">
                                <label for="cNome" class="form-label">Nome</label>
                                <input type="text" class="form-control" required name="txtnome" id="cNome" 
                                       placeholder="Nome completo" data-bv-notempty-message="Campo obrigatório." />
                            </div>
                            <div class="col-sm-6">
                                <label for="ctel" class="form-label">Telefone/Celular</label>
                                <input type="tel" class="form-control" required="" name="txttelefone" id="ctel"
                                       placeholder="(99) 99999-9999" data-mask="(99) 99999-9999" pattern="\([0-9]{2}\) [0-9]{5}-[0-9]{4}"/>
                            </div>

                        </div> 

                        <div class="row form-group">
                            <div class="col-sm-4">
                                <label for="txtlogin" class="form-label">E-mail</label>
                                <input type="email" class="form-control" data-bv-notempty-message="Campo obrigatório." required name="txtemail" id="txtemail" placeholder="Digite seu email"/>
                            </div>
                            <div class="col-sm-4">
                                <label for="txtlogin" class="form-label">Login</label>
                                <input type="text" class="form-control" data-bv-notempty-message="Campo obrigatório." required name="txtlogin" id="txtlogin" placeholder="Login"/>
                            </div>
                            <div class="col-sm-4">
                                <label for="txtsenha" class="form-label">Senha</label>
                                <input type="password" class="form-control" required name="txtsenha" data-bv-notempty-message="Campo obrigatório." id="txtsenha" placeholder="Senha" minlength="5"/>
                            </div>
                        </div>

                        <div class="row form-group">
                            <div class="col-sm-6">
                                <label for="txtrua" class="form-label">Rua/Logradouro</label>
                                <input type="text" class="form-control" required name="txtrua" id="txtrua" 
                                       data-bv-notempty-message="Campo obrigatório." placeholder="Endereço"/>
                            </div>
                            <div class="col-sm-6">
                                <label for="txtnumero" class="form-label">Número</label>
                                <input type="text" class="form-control" required name="txtnumero" id="txtnumero" 
                                       data-bv-notempty-message="Campo obrigatório." placeholder="Endereço"/>
                            </div>

                        </div>

                        <div class="row form-group">
                            <div class="col-sm-6">
                                <label for="txtcep" class="form-label">CEP</label>
                                <input type="text" class="form-control" required name="txtcep" id="txtcep" placeholder="CEP"
                                       data-bv-notempty-message="Campo obrigatório." data-mask="99999-999" pattern="[0-9]{5}-[0-9]{3}"/>
                            </div>
                            <div class="col-sm-6">
                                <label for="txtbairro" class="form-label">Bairro</label>
                                <select class="form-control" data-bv-notempty-message="Campo obrigatório." required name="txtbairro" id="txtbairro">
                                    <option value="" selected="" disabled="" class="sr-only">Selecione</option>
                                    <%
                                        BairroDAO bDao = new BairroDAO();
                                        for (Bairro b : bDao.listar()) {
                                    %>
                                    <option value="<%=b.getCodigo()%>"><%=b.getNome()%></option>
                                    <%}%>
                                </select>
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col-sm-6">
                                <button type="submit" class="btn btn-primary" id="sombrabtn" 
                                        value="cadastrar" name="acao">Salvar</button>
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


<script src="static/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="resources/js/bootstrapValidator.js" type="text/javascript" ></script>
<script type="text/javascript" src="resources/js/jquery.mask.js"></script>
<script src="static/bootstrap/js/bootstrap.min.js"></script>
<script src="static/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="static/plugins/fastclick/fastclick.js"></script>
<script src="static/assets/js/app.min.js"></script>
<script src="static/assets/js/demo.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#defaultForm').bootstrapValidator();
    });
</script>
</body>
</html>
