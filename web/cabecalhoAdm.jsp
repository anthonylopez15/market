
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="shortcut icon" href="resources-freezer/img/ic_launcher.png"> 
        <title>Area administrador</title>
        <!-- Bootstrap Core CSS -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- MetisMenu CSS -->
        <link href="resources-freezer/css/metisMenu.css" rel="stylesheet">
        <!-- Custom CSS -->
        <!-- DataTables CSS -->
        <link href="resources-freezer/css/dataTables.bootstrap.css" rel="stylesheet">
        <!-- DataTables Responsive CSS -->
        <link href="resources-freezer/css/dataTables.responsive.css" rel="stylesheet">
        <link href="resources-freezer/css/sb-admin-2.css" rel="stylesheet">
        <!-- Custom Fonts -->
        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <!--<link href="style.css" rel="stylesheet" type="text/css">-->

    </head>
    <body>
        <div id="wrapper">
            <!-- Navigation -->
            <nav class="navbar navbar-default navbar-static-top navbar-inverse" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.html">Dashboard</a>
                </div>
                <ul class="nav navbar-top-links navbar-right">
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i></a>
                        <ul class="dropdown-menu dropdown-user">


                            <li>
                                <a href="#"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                            </li>
                        </ul>
                        <!-- /.dropdown-user -->
                    </li>
                    <!-- /.dropdown -->
                </ul>
                <!-- /.navbar-top-links -->


                <div class="navbar-default sidebar " role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav" id="side-menu">
                            <li class="sidebar-search">
                                <div class="input-group custom-search-form">
                                </div>
                            </li>
                            <li>
                                <a href="adm.jsp"><i class="fa fa-fw fa-home"></i> Supermercados</a>
                            </li>
                            <li>
                                <a href="produto?acao=listar"><i class="fa fa-fw fa-tencent-weibo"></i> Produtos</a>
                            </li>

                            <li>
                                <a href="marca?acao=listar"><i class="fa fa-fw fa-leaf"></i> Marcas</a>
                            </li>

                            <li>
                                <a href="#"><i class="fa fa-fw fa-users"></i> Colaboradores</a>
                            </li>
                            
                            <li>
                                <a href="#"><i class="fa fa-fw fa-pencil"></i> Gerar Relatórios<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level fa-ul">
                                    <li>
                                        <a href="report_for_id.jsp"><i class="fa fa-fw fa-edit"></i> Ordem de serviço </a>
                                    </li>

                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>



                <!-- /.navbar-header -->
                <!-- /.navbar-top-links -->
                <!-- /.navbar-static-side -->
            </nav>
