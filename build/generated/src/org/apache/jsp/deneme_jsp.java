package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class deneme_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("  <head>\n");
      out.write("  </head>\n");
      out.write("  <body onload=\"init();\">\n");
      out.write("    <h1>Take a snapshot of the current video stream</h1>\n");
      out.write("   Click on the Start WebCam button.\n");
      out.write("     <p>\n");
      out.write("    <button onclick=\"startWebcam();\">Start WebCam</button>\n");
      out.write("    <button onclick=\"stopWebcam();\">Stop WebCam</button> \n");
      out.write("       <button onclick=\"snapshot();\">Take Snapshot</button> \n");
      out.write("    </p>\n");
      out.write("    <video onclick=\"snapshot(this);\" width=400 height=400 id=\"video\" controls autoplay></video>\n");
      out.write("  <p>\n");
      out.write("\n");
      out.write("        Screenshots : <p>\n");
      out.write("      <canvas  id=\"myCanvas\" width=\"400\" height=\"350\"></canvas>  \n");
      out.write("  </body>\n");
      out.write("  <script>\n");
      out.write("      //--------------------\n");
      out.write("      // GET USER MEDIA CODE\n");
      out.write("      //--------------------\n");
      out.write("          navigator.getUserMedia = ( navigator.getUserMedia ||\n");
      out.write("                             navigator.webkitGetUserMedia ||\n");
      out.write("                             navigator.mozGetUserMedia ||\n");
      out.write("                             navigator.msGetUserMedia);\n");
      out.write("\n");
      out.write("      var video;\n");
      out.write("      var webcamStream;\n");
      out.write("\n");
      out.write("      function startWebcam() {\n");
      out.write("        if (navigator.getUserMedia) {\n");
      out.write("           navigator.getUserMedia (\n");
      out.write("\n");
      out.write("              // constraints\n");
      out.write("              {\n");
      out.write("                 video: true,\n");
      out.write("                 audio: false\n");
      out.write("              },\n");
      out.write("\n");
      out.write("              // successCallback\n");
      out.write("              function(localMediaStream) {\n");
      out.write("                  video = document.querySelector('video');\n");
      out.write("                 video.src = window.URL.createObjectURL(localMediaStream);\n");
      out.write("                 webcamStream = localMediaStream;\n");
      out.write("              },\n");
      out.write("\n");
      out.write("              // errorCallback\n");
      out.write("              function(err) {\n");
      out.write("                 console.log(\"The following error occured: \" + err);\n");
      out.write("              }\n");
      out.write("           );\n");
      out.write("        } else {\n");
      out.write("           console.log(\"getUserMedia not supported\");\n");
      out.write("        }  \n");
      out.write("      }\n");
      out.write("\n");
      out.write("      function stopWebcam() {\n");
      out.write("          webcamStream.stop();\n");
      out.write("      }\n");
      out.write("      //---------------------\n");
      out.write("      // TAKE A SNAPSHOT CODE\n");
      out.write("      //---------------------\n");
      out.write("      var canvas, ctx;\n");
      out.write("\n");
      out.write("      function init() {\n");
      out.write("        // Get the canvas and obtain a context for\n");
      out.write("        // drawing in it\n");
      out.write("        canvas = document.getElementById(\"myCanvas\");\n");
      out.write("        ctx = canvas.getContext('2d');\n");
      out.write("      }\n");
      out.write("\n");
      out.write("      function snapshot() {\n");
      out.write("         // Draws current image from the video element into the canvas\n");
      out.write("        ctx.drawImage(video, 0,0, canvas.width, canvas.height);\n");
      out.write("      }\n");
      out.write("\n");
      out.write("  </script>\n");
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
}
