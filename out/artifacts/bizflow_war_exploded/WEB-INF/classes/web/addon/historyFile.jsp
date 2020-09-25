<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.File" %>
<%
    String path = request.getSession().getServletContext().getRealPath("upload/");
    // application.getRealPath("upload");
    System.out.println(path);
    String files[] = new File(path).list();

    for(String file : files) {
        out.write("<a href=\"" + request.getContextPath() + "/addon/downloadFile.jsp?file=" + java.net.URLEncoder.encode(file,"UTF-8") + "\">"+ file + "</a><br>");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>History File</title>
</head>
<body>

</body>
</html>
