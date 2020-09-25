<%@ page import="org.apache.ibatis.session.SqlSessionFactory" %>
<%@ page import="com.addon.bizflow.db.SqlMapConfig" %>
<%@ page import="org.apache.ibatis.session.SqlSession" %><%--
  Created by IntelliJ IDEA.
  User: islee201
  Date: 9/25/2020
  Time: 12:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
    SqlSession sqlSession = sqlSessionFactory.openSession();

    try {
        int cnt = sqlSession.selectOne("app.getCount");
        System.out.println("########### Cnt : " + cnt);
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<b>Test</b>
</body>
</html>
