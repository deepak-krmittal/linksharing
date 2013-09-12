<%--
  Created by IntelliJ IDEA.
  User: intelligrape
  Date: 12/9/13
  Time: 10:29 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title></title>
</head>
<body>
<g:uploadForm name="upload" controller="resource" action="checkUpload">
    Name: <g:textField name="name"></g:textField>
    <br>
    File: <input type="file" name="file">
    <br>
    <g:submitButton name="submit" value="Submit"></g:submitButton>
</g:uploadForm>
</body>
</html>