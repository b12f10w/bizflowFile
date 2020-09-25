<%@ page import="java.io.File" %>
<%@ page import="java.io.FileInputStream" %><%--
  Created by IntelliJ IDEA.
  User: islee201
  Date: 9/25/2020
  Time: 5:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String fileName = (String)request.getParameter("file");

    String path = request.getSession().getServletContext().getRealPath("upload/");
    File f = new File(path + "/" + fileName);

    String mimeType = getServletContext().getMimeType(f.toString());
    System.out.println("[mimeType]" + mimeType);

    if(mimeType == null) {
        response.setContentType("application/octec-stream");
        //response.setContentType("application/pdf");
    }

    String downloadName = "";

    if(request.getHeader("user-agent").indexOf("MSIE") == -1) {
        downloadName = new String(fileName.getBytes("UTF-8"),"8859_1");
    } else {
        downloadName = new String(fileName.getBytes("EUC-KR"),"8859_1");
    }

    response.setHeader("Content-Disposition","attachment;filename=\"" + downloadName + "\";");

    FileInputStream fileInputStream = new FileInputStream(f);
    ServletOutputStream servletOutputStream = response.getOutputStream();

    byte b[] = new byte[1024];
    int data = 0;

    while((data = (fileInputStream.read(b,0,b.length))) != -1) {
        servletOutputStream.write(b,0,data);
    }
    servletOutputStream.flush();
    servletOutputStream.close();
    fileInputStream.close();
%>
<html>
<head>
    <title>Download File</title>
</head>
<body>

</body>
</html>
