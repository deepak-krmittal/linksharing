
<%@ page import="org.ig.Resource" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'resource.label', default: 'Resource')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-resource" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="home" controller="user" action="dashBoard"><g:message code="default.home.label"/></g:link></li>
				%{--<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--}%
				%{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
			</ul>
		</div>
		<div id="show-resource" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list resource">
			
				<g:if test="${resourceInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="resource.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${resourceInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${resourceInstance?.summary}">
				<li class="fieldcontain">
					<span id="summary-label" class="property-label"><g:message code="resource.summary.label" default="Summary" /></span>
					
						<span class="property-value" aria-labelledby="summary-label"><g:fieldValue bean="${resourceInstance}" field="summary"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${resourceInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="resource.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${resourceInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${resourceInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="resource.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${resourceInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${resourceInstance?.readingItems}">
				<li class="fieldcontain">
					<span id="readingItems-label" class="property-label"><g:message code="resource.readingItems.label" default="Reading Items" /></span>
					
						<g:each in="${resourceInstance.readingItems}" var="r">
						<span class="property-value" aria-labelledby="readingItems-label"><g:link controller="readingItem" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>

                <g:if test="${resourceInstance.instanceOf(org.ig.DocumentResource)}">
                    <li class="fieldcontain">
                        <span id="summary-type" class="property-label">Type</span>

                        <span class="property-value" aria-labelledby="summary-label">Document Resource </span>

                    </li>
                    <li class="fieldcontain">
                        <span id="summary-url" class="property-label">Document</span>

                        <span class="property-value" aria-labelledby="summary-label"><g:fieldValue bean="${resourceInstance}" field="fileName"/></span>

                    </li>
                </g:if>
                <g:else>
                    <li class="fieldcontain">
                        <span id="summary-type" class="property-label">Type</span>

                        <span class="property-value" aria-labelledby="summary-label">Link Resource </span>

                    </li>
                    <li class="fieldcontain">
                        <span id="summary-url" class="property-label">URL</span>

                        <span class="property-value" aria-labelledby="summary-label"><g:fieldValue bean="${resourceInstance}" field="url"/></span>

                    </li>
                </g:else>

				%{--<g:if test="${resourceInstance?.owner}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="resourceOwner-label" class="property-label"><g:message code="resource.resourceOwner.label" default="Resource Owner" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="resourceOwner-label"><g:link controller="user" action="show" id="${resourceInstance?.owner?.id}">${resourceInstance?.owner?.encodeAsHTML()}</g:link></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			
				%{--<g:if test="${resourceInstance?.topic}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="topic-label" class="property-label"><g:message code="resource.topic.label" default="Topic" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="topic-label"><g:link controller="topic" action="show" id="${resourceInstance?.topic?.id}">${resourceInstance?.topic?.encodeAsHTML()}</g:link></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${resourceInstance?.id}" />
					<g:link class="edit" action="edit" id="${resourceInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <g:if test="${resourceInstance.owner.equals(session.user.id)}">
                    <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </g:if>
            </fieldset>
			</g:form>
		</div>
	</body>
</html>
