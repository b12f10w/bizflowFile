<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="org.apache.ibatis.session.SqlSessionFactory" %>
<%@ page import="com.addon.bizflow.db.SqlMapConfig" %>
<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="java.util.HashMap" %>
<%--
  Created by IntelliJ IDEA.
  User: islee201
  Date: 9/25/2020
  Time: 12:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    public int insertFileInfo(HashMap h) {
        SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
        SqlSession sqlSession = sqlSessionFactory.openSession();
        int result = 0;

        try {
            result = sqlSession.insert("app.insertFile",h);
            sqlSession.commit();
            sqlSession.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
%>
<%
    String path = request.getSession().getServletContext().getRealPath("upload/");
                 // application.getRealPath("upload");
    int size = 1024*1024*10;

    String file = "";
    String originFile = "";

    try {
        MultipartRequest multi = new MultipartRequest(request,path,size,"UTF-8", new DefaultFileRenamePolicy());
        String customKey = multi.getParameter("customKey");
        System.out.println("#############[customKey]" + customKey);

        Enumeration files = multi.getFileNames();

        String fileName = "";
        int i = 0;

        while(files.hasMoreElements()) {
            System.out.println("#############" + i);

            fileName = (String) files.nextElement();

            file = multi.getFilesystemName(fileName);
            originFile = multi.getOriginalFileName(fileName);

            HashMap<String, String> h = new HashMap<>();
            h.put("customId", customKey);
            h.put("originFileName", originFile);
            h.put("fileName", file);
            h.put("ver", "1");

            insertFileInfo(h);
        }

    } catch(Exception e) {
        e.printStackTrace();
    }

    response.sendRedirect(request.getContextPath() + "/addon/historyFile.jsp");
%>

<html>
<head>
    <title>UploadFile</title>
</head>
<body>
    file upload success
</body>
</html>
