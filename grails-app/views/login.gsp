<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="linksharing"/>
    <title>Login Page of Link Sharing Application.</title>
    <style>


    </style>
</head>
<body>
<g:form name="homepage" controller="authentication" action="loginhandler">

    <div style="background-color: #E1F2B6">


        <table style="width: 100%">
            <td style="width: 50%;"></td>
            <td>
                <table>
                    <tr>
                        <td colspan="2">${flash.message}</td>
                    </tr>
                    <tr>
                        <td>Enter Email</td>
                        <td>Password</td>
                    </tr>
                    <tr>
                        <td><g:textField name="emailig" /></td>
                        <td><g:passwordField name="passwordig" /></td>
                    </tr>
                    <tr>
                        <td>

                            <g:link action="register"  controller="user" >Sign Up</g:link>
                            <br>
                            <g:link controller="user" action="forget">Forget Password</g:link>
                        </td>
                        <td> <g:submitButton name="login" value="Login" /> </td>
                    </tr>

                </table>
            </td>
        </table>
    </div>

</g:form>
</body>
</html>