package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import models.Supermercado;
import java.util.List;
import dao.SupermercadoDAO;
import java.text.NumberFormat;

public final class adm_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_import_url_nobody;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_c_import_url_nobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_c_import_url_nobody.release();
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      if (_jspx_meth_c_import_0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div id=\"page-wrapper\">\r\n");
      out.write("    <div class=\"row\">\r\n");
      out.write("        <div class=\"col-lg-12\">\r\n");
      out.write("            <h1 class=\"page-header\">Supermercados</h1>\r\n");
      out.write("        </div>\r\n");
      out.write("        <!-- /.col-lg-12 -->\r\n");
      out.write("    </div>\r\n");
      out.write("    <!-- /.row -->\r\n");
      out.write("    <!--    <div class=\"row\">\r\n");
      out.write("            <div class=\"col-lg-3 col-md-6\">\r\n");
      out.write("                <div class=\"panel panel-yellow\">\r\n");
      out.write("                    <div class=\"panel-heading\">\r\n");
      out.write("                        <div class=\"row\">\r\n");
      out.write("                            <div class=\"col-xs-3\">\r\n");
      out.write("                                <i class=\"fa fa-5x fa-calendar-minus-o\"></i>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"col-xs-9 text-right\">\r\n");
      out.write("                                <div class=\"huge\">5</div>\r\n");
      out.write("                                <div>Details 1</div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <a href=\"#\">\r\n");
      out.write("                        <div class=\"panel-footer\">\r\n");
      out.write("                            <span class=\"pull-left\">Mais Detalhes</span>\r\n");
      out.write("                            <span class=\"pull-right\"><i class=\"fa fa-arrow-circle-right\"></i></span>\r\n");
      out.write("                            <div class=\"clearfix\"></div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </a>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"col-lg-3 col-md-6\">\r\n");
      out.write("                <div class=\"panel panel-green\">\r\n");
      out.write("                    <div class=\"panel-heading\">\r\n");
      out.write("                        <div class=\"row\">\r\n");
      out.write("                            <div class=\"col-xs-3\">\r\n");
      out.write("                                <i class=\"fa fa-5x fa-calendar-check-o\"></i>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"col-xs-9 text-right\">\r\n");
      out.write("    \r\n");
      out.write("                                <div class=\"huge\"> 40 </div>\r\n");
      out.write("                                <div>Details 2</div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <a href=\"#\">\r\n");
      out.write("                        <div class=\"panel-footer\">\r\n");
      out.write("                            <span class=\"pull-left\">Mais Detalhes</span>\r\n");
      out.write("                            <span class=\"pull-right\"><i class=\"fa fa-arrow-circle-right\"></i></span>\r\n");
      out.write("                            <div class=\"clearfix\"></div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </a>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"col-lg-3 col-md-6\">\r\n");
      out.write("                <div class=\"panel panel-danger\">\r\n");
      out.write("                    <div class=\"panel-heading\">\r\n");
      out.write("                        <div class=\"row\">\r\n");
      out.write("                            <div class=\"col-xs-3\">\r\n");
      out.write("                                <i class=\"fa fa-5x fa-calendar-times-o\"></i>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"col-xs-9 text-right\">\r\n");
      out.write("    \r\n");
      out.write("                                <div class=\"huge\">34</div>\r\n");
      out.write("                                <div>Details 3</div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <a href=\"#\">\r\n");
      out.write("                        <div class=\"panel-footer\">\r\n");
      out.write("                            <span class=\"pull-left\">Mais Detalhes</span>\r\n");
      out.write("                            <span class=\"pull-right\"><i class=\"fa fa-arrow-circle-right\"></i></span>\r\n");
      out.write("                            <div class=\"clearfix\"></div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </a>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>-->\r\n");
      out.write("    <!-- /.row -->\r\n");
      out.write("\r\n");
      out.write("    <div class=\"row\">\r\n");
      out.write("        <div class=\"col-sm-6\">\r\n");
      out.write("            <button class=\"btn btn-success\" type=\"button\" data-toggle=\"collapse\" data-target=\"#collapseExample\" aria-expanded=\"false\" aria-controls=\"collapseExample\">\r\n");
      out.write("                <!--Cadastrar-->\r\n");
      out.write("                <i class=\"fa fa-plus\"></i>\r\n");
      out.write("            </button>\r\n");
      out.write("            <br>\r\n");
      out.write("            <br>\r\n");
      out.write("            <div class=\"collapse\" id=\"collapseExample\">\r\n");
      out.write("                <form action=\"supermercado\" method=\"post\"  class=\"form-horizontal\" >\r\n");
      out.write("                    <div class=\"well well-sm\">\r\n");
      out.write("\r\n");
      out.write("                        <p>\r\n");
      out.write("                            <input type=\"text\" class=\"form-control\" name=\"txtnome\"required placeholder=\"Nome\"/>\r\n");
      out.write("                        </p>\r\n");
      out.write("                        <p>\r\n");
      out.write("                            <input type=\"text\" class=\"form-control\" name=\"txtendereco\"required placeholder=\"Endereço \"/>\r\n");
      out.write("                        </p>\r\n");
      out.write("\r\n");
      out.write("                        </p>\r\n");
      out.write("                        <p><button type=\"submit\" name=\"acao\" value=\"criar\" class=\"btn btn-info\"> Salvar</button></p>\r\n");
      out.write("\r\n");
      out.write("                    </div>\r\n");
      out.write("                </form>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <div class=\"row\">\r\n");
      out.write("        <div class=\"col-lg-12\">\r\n");
      out.write("            <div class=\"panel panel-default\">\r\n");
      out.write("                <div class=\"panel-heading\">\r\n");
      out.write("                    Lista\r\n");
      out.write("                </div>  \r\n");
      out.write("                <!-- /.panel-heading -->\r\n");
      out.write("                <div class=\"panel-body\">\r\n");
      out.write("                    <table width=\"100%\" class=\"table table-striped table-bordered table-hover\" id=\"dataTables-example\">\r\n");
      out.write("                        <thead>\r\n");
      out.write("                            <tr>\r\n");
      out.write("                                <th>Codigo</th>\r\n");
      out.write("                                <th>Nome</th>\r\n");
      out.write("                                <th>Endereço</th>\r\n");
      out.write("                                <th>Ação</th>\r\n");
      out.write("\r\n");
      out.write("                            </tr>\r\n");
      out.write("                        </thead>\r\n");
      out.write("                        <tbody>\r\n");
      out.write("                            ");

                                SupermercadoDAO sDao = new SupermercadoDAO();
                                List<Supermercado> list = sDao.listar();
                                for (Supermercado s : list) {
                            
      out.write("\r\n");
      out.write("                            <tr class=\"odd gradeX\">\r\n");
      out.write("                                <td>");
      out.print(s.getCodigo());
      out.write("</td>\r\n");
      out.write("                                <td>");
      out.print(s.getNome());
      out.write("</td>\r\n");
      out.write("                                <td>");
      out.print(s.getEndereco());
      out.write("</td>\r\n");
      out.write("                                <td class=\"text-center\">\r\n");
      out.write("                                    <a href=\"#\" data-toggle=\"modal\" data-cod=\"");
      out.print(s.getCodigo());
      out.write("\"\r\n");
      out.write("                                       data-target=\"#");
      out.print(s.getCodigo());
      out.write("\" >Abrir</a>\r\n");
      out.write("                                </td>\r\n");
      out.write("\r\n");
      out.write("                            </tr>\r\n");
      out.write("                        <div class=\"modal fade\" id=\"");
      out.print(s.getCodigo());
      out.write("\"  tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"myModalLabel\">\r\n");
      out.write("                            <div class=\"modal-dialog modal-lg\" role=\"document\">\r\n");
      out.write("                                <div class=\"modal-content\">\r\n");
      out.write("                                    <div class=\"modal-header\">\r\n");
      out.write("                                        <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">\r\n");
      out.write("                                            <span aria-hidden=\"true\">&times;</span>\r\n");
      out.write("                                        </button>\r\n");
      out.write("                                        <h3 class=\"modal-title\" id=\"myModalLabel\">Dados Supermercado</h3>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <form action=\"supermercado\" method=\"get\">\r\n");
      out.write("                                        <div class=\"modal-body\">\r\n");
      out.write("                                            <div class=\"row form-group\">\r\n");
      out.write("                                                <div class=\"  col-sm-6 \">\r\n");
      out.write("                                                    <label for=\"cNome\" class=\"form-label\">Nome</label>\r\n");
      out.write("                                                    <input type=\"text\" class=\"form-control\" required name=\"txtnome\" id=\"cNome\" placeholder=\"Preencha seu nome completo\"\r\n");
      out.write("                                                           value=\"");
      out.print(s.getNome());
      out.write("\" data-bv-notempty-message=\"Nome completo obrigatório.\" />\r\n");
      out.write("                                                </div>\r\n");
      out.write("                                            </div>\r\n");
      out.write("                                            <div class=\"row form-group\">\r\n");
      out.write("                                                <div class=\"  col-sm-6 \">\r\n");
      out.write("                                                    <label for=\"cEnd\" class=\"form-label\">Endereço</label>\r\n");
      out.write("                                                    <input type=\"text\" class=\"form-control\" required name=\"txtendereco\" id=\"cEnd\" placeholder=\"Preencha seu nome completo\"\r\n");
      out.write("                                                           value=\"");
      out.print(s.getEndereco());
      out.write("\" data-bv-notempty-message=\"Nome completo obrigatório.\" />\r\n");
      out.write("                                                    <input type=\"hidden\" value=\"");
      out.print(s.getCodigo());
      out.write("\" name=\"txtcod\"/>\r\n");
      out.write("                                                </div>\r\n");
      out.write("                                            </div>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <div class=\"modal-footer\">\r\n");
      out.write("                                            <button type=\"button\" class=\"btn\" id=\"sombrabtn\" data-dismiss=\"modal\">Fechar</button>\r\n");
      out.write("                                            <button type=\"submit\" class=\"btn btn-primary\" id=\"sombrabtn\" \r\n");
      out.write("                                                    value=\"alterar\" name=\"acao\">Solicitar</button>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                    </form>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        ");
}
      out.write("\r\n");
      out.write("                        </tbody>\r\n");
      out.write("                    </table>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
      out.write("<script src=\"vendor/jquery/jquery.min.js\"></script>\r\n");
      out.write("<script src=\"resources-freezer/js/bootstrap.min.js\"></script>\r\n");
      out.write("<script src=\"resources-freezer/js/metisMenu.min.js\"></script>\r\n");
      out.write("<script src=\"resources-freezer/js/sb-admin-2.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<script src=\"resources-freezer/js/jquery.dataTables.min.js\"></script>\r\n");
      out.write("<script src=\"resources-freezer/js/dataTables.bootstrap.min.js\"></script>\r\n");
      out.write("<script src=\"resources-freezer/js/dataTables.responsive.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("    $(document).ready(function () {\r\n");
      out.write("        $('#dataTables-example').DataTable({\r\n");
      out.write("            responsive: true\r\n");
      out.write("        });\r\n");
      out.write("    });\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_import_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:import
    org.apache.taglibs.standard.tag.rt.core.ImportTag _jspx_th_c_import_0 = (org.apache.taglibs.standard.tag.rt.core.ImportTag) _jspx_tagPool_c_import_url_nobody.get(org.apache.taglibs.standard.tag.rt.core.ImportTag.class);
    _jspx_th_c_import_0.setPageContext(_jspx_page_context);
    _jspx_th_c_import_0.setParent(null);
    _jspx_th_c_import_0.setUrl("cabecalhoAdm.jsp");
    int[] _jspx_push_body_count_c_import_0 = new int[] { 0 };
    try {
      int _jspx_eval_c_import_0 = _jspx_th_c_import_0.doStartTag();
      if (_jspx_th_c_import_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_c_import_0[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_c_import_0.doCatch(_jspx_exception);
    } finally {
      _jspx_th_c_import_0.doFinally();
      _jspx_tagPool_c_import_url_nobody.reuse(_jspx_th_c_import_0);
    }
    return false;
  }
}
