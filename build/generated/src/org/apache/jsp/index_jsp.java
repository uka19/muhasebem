package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("    <title>Muhasebe'm</title>\n");
      out.write("    <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js\"></script>\n");
      out.write("    <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js\"></script>\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\">\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js\"></script>\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js\"></script>\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js\"></script>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\"/>\n");
      out.write("        <script src='https://kit.fontawesome.com/a076d05399.js'></script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

            if (session.getAttribute("user_id") != null) {
                response.sendRedirect("dashboard");
            }

        
      out.write("\n");
      out.write("\n");
      out.write("    <div class=\"jumbotron text-center\" style=\"background:transparent url('images/muhasebe.jpeg') no-repeat center center /cover\">\n");
      out.write("        <div class='container col-5 p-3 my-3 bg-dark text-white rounded opacity-2 '>\n");
      out.write("            <h1 class=\"display-1\">Muhasebe'm</h1>\n");
      out.write("        </div>\n");
      out.write("        <div class='container col-3 p-3 bg-danger text-white rounded opacity-2 '>\n");
      out.write("            <h6 class=\"display-9\">İşletmeniz İşletmemizdir.</h6>\n");
      out.write("        </div> \n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <div class=\"container\">\n");
      out.write("        <div class=\"row\">\n");
      out.write("            <div class=\"col-sm-6 text-center\">\n");
      out.write("                <a href=\"companyRegister\" type=\"button\" class=\"btn btn-primary btn-block\">Bizimle Çalışın</a>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-sm-6 text-center\">\n");
      out.write("                <a href=\"login\" type=\"button\" class=\"btn btn-success btn-block\">Giriş Yap</a>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <div class=\"container\" style=\"margin-top:30px\">\n");
      out.write("        <div class=\"row\">\n");
      out.write("            <div class=\"col-sm-4\">\n");
      out.write("                <h2>Kullanıcı Sayımız</h2>\n");
      out.write("                <div class=\"count-up h1\" data-from=\"10\" data-to=\"1215615\" data-time=\"2000\">\n");
      out.write("                    0\n");
      out.write("                </div>\n");
      out.write("                <p>Her ay 100'e yakın kullanıcıya hizmet veriyoruz.</p>\n");
      out.write("                <h3>Sosyal Medya Hesaplarımız</h3>\n");
      out.write("\n");
      out.write("                <ul class=\"nav nav-pills flex-column\">\n");
      out.write("                    <li class=\"nav-item\">\n");
      out.write("                        <a class=\"nav-link\" href=\"#\">Facebook</a>\n");
      out.write("                    </li>\n");
      out.write("                    <li class=\"nav-item\">\n");
      out.write("                        <a class=\"nav-link\" href=\"#\">Twitter</a>\n");
      out.write("                    </li>\n");
      out.write("                    <li class=\"nav-item\">\n");
      out.write("                        <a class=\"nav-link\" href=\"#\">İnstagram</a>\n");
      out.write("                    </li>\n");
      out.write("                </ul>\n");
      out.write("                <hr class=\"d-sm-none\">\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-sm-8\">\n");
      out.write("                <h2>Kullanımı Kolay Teknoloji</h2>\n");
      out.write("                <h5>İşletmenizin yanında</h5>\n");
      out.write("\n");
      out.write("                <p>..</p>\n");
      out.write("                <p>İşletmelerin temel muhasebe işlemlerini kolaylıkla halledebileceğiniz, müşterileriniz ile kolaylıkla alışverişlerinizi yapabilirsiniz.</p>\n");
      out.write("                <br>\n");
      out.write("                <h2>İşletmenizin Temel İhtiyaçlarını Karşılar</h2>\n");
      out.write("                <h5>2007'den beri gelişen teknoloji</h5>\n");
      out.write("\n");
      out.write("                <p>..</p>\n");
      out.write("                <p>İşe başladığımız ilk günden beri işletmelerin fonksiyonlarını kolaylaştırmak için araştırmalarımızı ve geliştirmelerimizi sürdürüyoruz. Uzman kadromuz ile gelişimimizi sürdürüyoruz</p>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <div class=\"jumbotron text-center\" style=\"margin-bottom:0\">\n");
      out.write("        <div class='row'>\n");
      out.write("            <div class='col'>\n");
      out.write("                <h2>Hakkımızda</h2>\n");
      out.write("                <p>\n");
      out.write("                    Vizyonumuz, işletmelerin kolayca ürünlerini pazarlaması ve muhasabe işlemlerini yaptırılması.\n");
      out.write("                </p>\n");
      out.write("            </div>  \n");
      out.write("            <div class='col'>\n");
      out.write("                <h3>En Son Haberler</h3>\n");
      out.write("            </div>\n");
      out.write("            <div class='col'>\n");
      out.write("                <h3>:D</h3>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("    <script>\n");
      out.write("        (function ($) {\n");
      out.write("            $.fn.counter = function () {\n");
      out.write("                const $this = $(this),\n");
      out.write("                        numberFrom = parseInt($this.attr('data-from')),\n");
      out.write("                        numberTo = parseInt($this.attr('data-to')),\n");
      out.write("                        delta = numberTo - numberFrom,\n");
      out.write("                        deltaPositive = delta > 0 ? 1 : 0,\n");
      out.write("                        time = parseInt($this.attr('data-time')),\n");
      out.write("                        changeTime = 10;\n");
      out.write("\n");
      out.write("                let currentNumber = numberFrom,\n");
      out.write("                        value = delta * changeTime / time;\n");
      out.write("                var interval1;\n");
      out.write("                const changeNumber = () => {\n");
      out.write("                    currentNumber += value;\n");
      out.write("                    //checks if currentNumber reached numberTo\n");
      out.write("                    (deltaPositive && currentNumber >= numberTo) || (!deltaPositive && currentNumber <= numberTo) ? currentNumber = numberTo : currentNumber;\n");
      out.write("                    this.text(parseInt(currentNumber));\n");
      out.write("                    currentNumber == numberTo ? clearInterval(interval1) : currentNumber;\n");
      out.write("                }\n");
      out.write("\n");
      out.write("                interval1 = setInterval(changeNumber, changeTime);\n");
      out.write("            }\n");
      out.write("        }(jQuery));\n");
      out.write("        $('.count-up').counter();\n");
      out.write("\n");
      out.write("    </script>\n");
      out.write("</body>\n");
      out.write("\n");
      out.write("</html>\n");
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
}
