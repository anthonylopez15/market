<%@page import="models.Bairro"%>
<%@page import="dao.BairroDAO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="base.jsp"/>
<div class="row">
    <div class="col-md-8 col-md-offset-2">
        <div class="page-header">
            <h1>Registro</h1>
        </div>
        <form action="cliente" method="post" id="defaultForm" method="post" action="#"  class="form-horizontal" 
               >

            <div class="row form-group">
                <div class="col-sm-6">
                    <label for="cNome" class="form-label">Nome</label>
                    <input type="text" class="form-control" required name="txtnome" id="cNome" 
                           placeholder="Nome completo" data-bv-notempty-message="Campo obrigatório." />
                </div>
                <div class="col-sm-6">
                    <label for="cCpf" class="form-label">CPF</label>
                    <input type="text" class="form-control" required name="txtcpf" id="cCpf" data-mask="999.999.999-99"
                           placeholder="999.999.999-99"  data-bv-notempty-message="CPF obrigatório." />
                </div>
            </div>
            <div class="row form-group">
                <div class="col-sm-6">
                    <label for="txtlogin" class="form-label">Login</label>
                    <input type="text" class="form-control" data-bv-notempty-message="Campo obrigatório." required name="txtlogin" id="txtlogin" placeholder="Login"/>
                </div>
                <div class="col-sm-6">
                    <label for="txtsenha" class="form-label">Senha</label>
                    <input type="password" class="form-control" required name="txtsenha" data-bv-notempty-message="Campo obrigatório." id="txtsenha" placeholder="Senha" minlength="5"/>
                </div>
            </div>

            <div class="row form-group">
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
                <div class="col-sm-6">
                    <label for="txtemail" class="form-label">E-mail</label>
                    <input type="email" class="form-control"  required name="txtemail" id="txtemail"  placeholder="E-mail" />
                </div>
            </div>
            <div class="row form-group">
                <div class="col-sm-6">
                    <label for="txtendereco" class="form-label">Endereço</label>
                    <input type="text" class="form-control" required name="txtendereco" id="txtendereco" 
                           data-bv-notempty-message="Campo obrigatório." placeholder="Endereço"/>
                </div>

                <div class="col-sm-6">
                    <label for="txtcep" class="form-label">CEP</label>
                    <input type="text" class="form-control" required name="txtcep" id="txtcep" placeholder="CEP"
                           data-bv-notempty-message="Campo obrigatório." data-mask="99999-999" pattern="[0-9]{5}-[0-9]{3}"/>
                </div>
            </div>

            <div class="row form-group">
                <div class="col-sm-6">
                    <button type="submit" class="btn btn-primary" id="sombrabtn" 
                            value="cadastrar" name="acao">Salvar</button>
                </div>
            </div>
    </div>
</form>
</div>
</div>

<c:import url="footer.jsp"/>