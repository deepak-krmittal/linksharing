
<%@ page import="org.ig.Topic" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'topic.label', default: 'Topic')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-topic" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li>
                    <g:link controller="user" action="dashBoard"><g:message code="default.home.label"/></g:link>
                </li>
				%{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
			</ul>
		</div>
		<div id="list-topic" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'topic.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="content" title="${message(code: 'topic.content.label', default: 'Content')}" />
					
						%{--<th><g:message code="topic.owner.label" default="Owner" /></th>--}%
					
						%{--<g:sortableColumn property="visibility" title="${message(code: 'topic.visibility.label', default: 'Visibility')}" />--}%
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${topicInstanceList}" status="i" var="topicInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${topicInstance.id}">${fieldValue(bean: topicInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: topicInstance, field: "content")}</td>
					
						%{--<td>${fieldValue(bean: topicInstance, field: "owner")}</td>--}%
					
						%{--<td>${fieldValue(bean: topicInstance, field: "visibility")}</td>--}%
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${topicInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
