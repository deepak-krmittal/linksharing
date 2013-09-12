<%--
  Created by IntelliJ IDEA.
  User: arpit-singhal
  Date: 8/9/13
  Time: 8:51 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="linksharing"/>
  <title>Login Page of Link Sharing Application.</title>
    <style>


    </style>
</head>
<body>
<g:form name="homepage" controller="user" action="saveig">

<div style="background-color: #E1F2B6">

    <center><h1>Sign Up!!</h1></center>
    <table style="width: 100%">
        <td style="width: 25%;"></td>
        <td>
            <table>
                <tr>
                    <td>Enter Email</td>
                    <td><g:textField name="email"/></td>
                </tr>
                <tr>
                    <td>Enter Name</td>
                    <td><g:textField name="firstName" /><g:textField name="lastName" /></td>
                </tr>
                <tr>
                    <td>Enter Password </td>
                    <td> <g:passwordField name="password" /> </td>
                </tr>
                <tr>
                    <td>Confirm Password </td>
                    <td> <g:passwordField name="confirmPassword" /> </td>
                </tr>
                <tr>
                    <td>Gender </td>
                    <td> <g:textField name="gender" /> </td>
                </tr>
                <tr>
                    <td>Date Of Birth</td>
                    <td> <g:datePicker name="dateOfBirth" precision="day"   default="none" noSelection="['': '']" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td> <g:submitButton name="signup" value="Sign Up"  /></td>
                </tr>
            </table>
        </td>
    </table>




</div>




</g:form>






</body>
</html>