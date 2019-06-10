<%@page import="models.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" href="resources/img/ic_launcher.png"> 
        <title>Area administrador</title>
        <link href="resources/css/bootstrap.min.css" rel="stylesheet">
        <link href="resources/css/metisMenu.css" rel="stylesheet">
        <link href="resources/css/dataTables.bootstrap.css" rel="stylesheet">
        <link href="resources/css/dataTables.responsive.css" rel="stylesheet">
        <link href="resources/css/sb-admin-2.css" rel="stylesheet">
        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="style.css" rel="stylesheet" type="text/css">

    </head>
    <body>
        <div id="wrapper">
            <nav class="navbar navbar-default navbar-static-top navbar-inverse" role="navigation" style="margin-bottom: 0px">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Administrador</a>
                </div>

                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <%
                    String usuario = "Deslogado";
                    if (session.getAttribute("usuario") != null) {
                        Usuario u = (Usuario) session.getAttribute("usuario");
                        usuario = u.getNome();
                    }
                %>
                <ul class="nav navbar-top-links navbar-right">
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-user fa-fw"></i> <%=usuario%> <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li>
                                <a href="index.jsp" ><i class="fa fa-book fa-fw"></i> Pagina cliente</a>
                            </li>
                            <li>
                                <a href="session?acao=sair" ><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                            </li>
                        </ul>
                    </li>
                </ul>

                <div class="navbar-default sidebar " role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav" id="side-menu">
                            <li>
                                <a href="supermercado?acao=listar"><i class="fa fa-fw fa-home"></i> Supermercados</a>
                            </li>
                            <li>
                                <a href="produto?acao=listar"><i class="fa fa-fw fa-tencent-weibo"></i> Produtos</a>
                            </li>

                            <li>
                                <a href="marca?acao=listar"><i class="fa fa-fw fa-leaf"></i> Marcas</a>
                            </li>

                            <li>
                                <a href="usuario?acao=listar"><i class="fa fa-fw fa-user"></i> Usuários </a>
                            </li>
                            <li>
                                <a href="bairros.jsp"><i class="fa fa-fw fa-map"></i> Bairros </a>
                            </li>

                            <li>
                                <a href="#"><i class="fa fa-fw fa-pencil"></i> Gerar Relatórios<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level fa-ul">
                                    <li>
                                        <a href="relatorios?acao=listarClientes" target="_blank"><i class="fa fa-fw fa-edit"></i> Listar Clientes </a>
                                    </li>
                                    <li>
                                        <a href="relatorio_compra.jsp"><i class="fa fa-fw fa-edit"></i> Relatório de compras </a>
                                    </li>
<!--                                    <li>
                                        <a href="#"><i class="fa fa-fw fa-edit"></i> Relatório 1 </a>
                                    </li>-->

                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>

            </nav>
