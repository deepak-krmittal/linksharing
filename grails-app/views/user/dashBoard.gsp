<%--
  Created by IntelliJ IDEA.
  User: intelligrape
  Date: 10/9/13
  Time: 10:50 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>Welcome Page</title>
  <meta name="layout" content="linksharing">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <script>
        $(function() {
            $( "#tabs" ).tabs();
        });
    </script>
</head>
<body>
<div style="background-color: #E1F2B6">

    <table border="0" style="width: 100%">
       <tr>
           <td>Welcome <g:link action="show" id="${session.user.id}">${session.user.firstName} ${session.user.lastName}</g:link></td>
           <td><g:link controller="Authentication" action="logout">Logout</g:link></td>
       </tr>
    </table>
    <table>
        <tr>
            <td width="25%">
                <ul>
                    <li><g:link controller="topic" action="create">Create A New Topic</g:link></li>
                    <li><g:link controller="topic" action="list">List All Public Topic</g:link></li>
                </ul>
            </td>
            <td>
                <div id="tabs">
                    <ul>
                        <li><a href="#tabs-1">Subscribed Topics</a></li>
                        <li><a href="#tabs-2">Top Resources</a></li>
                        <li><a href="#tabs-3">Top Topics</a></li>
                    </ul>
                    <div id="tabs-1">
                        <p>
                            <g:each in="${subs}">
                            <%
                            List l = it;
                            %>
                                <g:link controller="topic" action="show" id="${l.get(0)}">${l.get(1)}</g:link>
                                <br>
                                <span>${l.get(2)}</span>
                            <%

                            %>
                            </g:each>
                        </p>
                    </div>
                    <div id="tabs-2">
                        <p>
                            Second Contents
                            ---------------------------------------------------------------------
                        </p>
                    </div>
                    <div id="tabs-3">
                        <ls:topTopics></ls:topTopics>
                    </div>
                </div>
                %{--<h1>User Subscribed Topics</h1>--}%
                %{--<g:each in="${subs}">--}%
                    %{--<%--}%
                        %{--List l = it;--}%
                        %{--out.println("<h1>"+l.get(0)+"</h1><br>"+l.get(1)+"<hr>")--}%
                    %{--%>--}%
                %{--</g:each>--}%
            </td>
            <td></td>
        </tr>
    </table>
</div>
</body>
</html>