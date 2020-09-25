<%--
  Created by IntelliJ IDEA.
  User: islee201
  Date: 9/25/2020
  Time: 12:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String customKey = (String)request.getParameter("customKey");
    System.out.println("!!!" + customKey);
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; chartset=UTF-8">
    <title>Regist File</title>
</head>
<body>
<form action="registFileAction.jsp" method="post" enctype="multipart/form-data">
    <input type="hidden" name="customKey" value="<%= customKey %>">
    file : <input type="file" name="file1" ><br>
    file : <input type="file" name="file2" ><br>
    file : <input type="file" name="file3" ><br>
    file : <input type="file" name="file4" ><br>
    file : <input type="file" name="file5" ><br>
    file : <input type="file" name="file6" ><br>
    file : <input type="file" name="file7" ><br>
    <p/>
    <div style="margin: 100px 0px">

    <input type="submit" value="fileupload">
    </div>
</form>

</body>
</html>
