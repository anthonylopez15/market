<%@page import="models.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Mercado</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <link rel="stylesheet" href="static/assets/css/AdminLTE.min.css">
  <link rel="stylesheet" href="static/assets/css/skins/_all-skins.min.css">
  <link rel="stylesheet" href="static/assets/css/meat.css">

</head>

<body class="hold-transition skin-red layout-top-nav">
<div class="wrapper">

  <header class="main-header">
    <nav class="navbar navbar-static-top">
      <div class="container">
        <div class="navbar-header">
          <a href="pesquisa?acao" class="navbar-brand"><b>Pesquisa de Mercadoria</b></a>
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
            <i class="fa fa-bars"></i>
          </button>
        </div>

        <div class="collapse navbar-collapse" id="navbar-collapse">
            <ul class="nav navbar-nav">
              <li class="dropdown">
                  <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="download">Pesquisar <span class="caret"></span></a>
                  <ul class="dropdown-menu" aria-labelledby="download">
                      <li><a href="">Lista de compras</a></li>
                      <li><a href="">Produto</a></li>
                      <li><a href="">Supermercados</a></li>
                  </ul>
              </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <%Usuario u ;
                if (session.getAttribute("usuario") != null) {
                    u = (Usuario) session.getAttribute("usuario"); %>
                
                    <li><a href="session?acao=sair">Sair</a></li>
                    <li><a href="#"> <%=u.getLogin()%></a></li>
                <% }else { %>
                    <li><a href="login.jsp">Entrar</a></li>
                    <li><a href="cadastrar.jsp">Cadastrar-se</a></li>
                <%}%>
            </ul>
            
        </div>

      </div>
    </nav>
  </header>