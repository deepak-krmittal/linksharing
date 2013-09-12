<%--
  Created by IntelliJ IDEA.
  User: arpit-singhal
  Date: 10/9/13
  Time: 12:05 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="linksharing"/>
  <title></title>
</head>
<body>
    <H1>Forget Password</H1>
    <div>
      <g:form name="forgetform" controller="user" action="forgetsend">
      <table>
          <tr>
              <td>Enter Your Email ID:</td>
              <td><g:textField name="emailforget"/></td>
              <td><g:submitButton name="send" value="Send" /></td>
          </tr>
      </table>
      </g:form>
    </div>
</body>
</html>