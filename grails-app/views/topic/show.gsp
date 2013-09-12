
<%@ page import="org.ig.Topic" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'topic.label', default: 'Topic')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
        <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
        <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
        <script>
            $(function() {

                    $( "#resource" ).dialog({
                    autoOpen: false,
                    height: 480,
                    width: 450,
                    modal: true
                });
                $( "#add_resource" )
                        .button()
                        .click(function() {
                            $( "#resource" ).dialog( "open" );
                        });
            });
        </script>
	</head>
	<body>
		<a href="#show-topic" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link controller="user" action="dashBoard"><g:message code="default.home.label"/></g:link></li>
				%{--<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--}%
				%{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
			</ul>
		</div>
		<div id="show-topic" class="content scaffold-show" role="main">
			<h1>
                <g:if test="${isSubscribed==false}">
                    <g:form action="subscriber" controller="Subscription" method="post">
                        <g:message code="default.show.label" args="[entityName]" />
                        <b>Seriousness:</b>
                        <select name="seriousness">
                            <option value="CASUAL">casual</option>
                            <option value="SERIOUS">serious</option>
                            <option value="VERY_SERIOUS">very serious</option>
                        </select>
                        <g:hiddenField name="topic" value="${topicInstance?.id}"></g:hiddenField>
                        <g:submitButton name="subscribe" value="subscribe"></g:submitButton>
                    </g:form>
                </g:if>
                <g:else>
                    <g:form action="unsubscribe" controller="subscription">
                        <g:message code="default.show.label" args="[entityName]" />
                        <g:hiddenField name="unSubId" value="${subscribed.id}"></g:hiddenField>
                        <g:submitButton name="unsubscribe" value="unsubscribe"></g:submitButton>
                    </g:form>

                </g:else>
            </h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list topic">
			
				<g:if test="${topicInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="topic.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${topicInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${topicInstance?.content}">
				<li class="fieldcontain">
					<span id="content-label" class="property-label"><g:message code="topic.content.label" default="Content" /></span>
					
						<span class="property-value" aria-labelledby="content-label"><g:fieldValue bean="${topicInstance}" field="content"/></span>
					
				</li>
				</g:if>
			
				%{--<g:if test="${topicInstance?.owner}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="owner-label" class="property-label"><g:message code="topic.owner.label" default="Owner" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="owner-label"><g:link controller="user" action="show" id="${topicInstance?.owner?.id}">${topicInstance?.owner?.encodeAsHTML()}</g:link></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			
				%{--<g:if test="${topicInstance?.resources}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="resources-label" class="property-label"><g:message code="topic.resources.label" default="Resources" /></span>--}%
					%{----}%
						%{--<g:each in="${topicInstance.resources}" var="r">--}%
						%{--<span class="property-value" aria-labelledby="resources-label"><g:link controller="resource" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>--}%
						%{--</g:each>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			
				%{--<g:if test="${topicInstance?.subscriptions}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="subscriptions-label" class="property-label"><g:message code="topic.subscriptions.label" default="Subscriptions" /></span>--}%
					%{----}%
						%{--<g:each in="${topicInstance.subscriptions}" var="s">--}%
						%{--<span class="property-value" aria-labelledby="subscriptions-label"><g:link controller="subscription" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>--}%
						%{--</g:each>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			
				<g:if test="${topicInstance?.visibility}">
				<li class="fieldcontain">
					<span id="visibility-label" class="property-label"><g:message code="topic.visibility.label" default="Visibility" /></span>
					
						<span class="property-value" aria-labelledby="visibility-label"><g:fieldValue bean="${topicInstance}" field="visibility"/></span>
					
				</li>
				</g:if>
            </ol>
            <h1>Available Resources</h1>
            <g:each in="${availRes}" var="item">
                <div class="outer_div">
                <span class="title">
                <g:link>${item.title}</g:link>
                </span> <br>
                </div>
            </g:each>
			%{--<g:form>--}%
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${topicInstance?.id}" />
                    <g:if test="${isOwner==true}">
                    <g:link class="edit" action="edit" id="${topicInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    </g:if>

                    <button id="add_resource">Add Resource</button>
                    %{--<a href="javascript:void(0);" onclick="document.getElementById('resource').style.display='block';">Add Resource</a>--}%
					%{--<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />--}%
				</fieldset>
			%{--</g:form>--}%
		</div>
        <div id="resource">
                %{--<g:form controller="resource" action="addLinkResource">--}%
                <g:uploadForm  name="myResource" controller="resource" action="addResource">
                <table>
                    <tr>
                        <td>
                            Title
                        </td>
                        <td>
                            <g:textField name="title"></g:textField>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Summary
                        </td>
                        <td>
                            <g:textArea name="summary"></g:textArea>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="radio" name="resource" value="link" checked="checked" onclick="document.getElementById('linkRes').style.display='block';document.getElementById('docRes').style.display='none';"> Link Resouce
                            <input type="radio" name="resource" value="document" onclick="document.getElementById('linkRes').style.display='none';document.getElementById('docRes').style.display='block';"> Document Resouce
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div id="linkRes">

                                Url: <g:textField name="url"></g:textField>


                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div id="docRes" style="display: none;">
                                <input type="file" name="uploadFile">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <g:hiddenField name="topic" value="${topicInstance?.id}"></g:hiddenField>
                            <g:submitButton name="linkSubmit" value="Submit"></g:submitButton>
                        </td>
                    </tr>
                </table>
                %{--Title: <g:textField name="title"></g:textField><br>--}%
                %{--Summary: <g:textArea name="summary"></g:textArea><br>--}%
                %{--<input type="radio" name="resource" value="link" checked="checked" onclick="document.getElementById('linkRes').style.display='block';document.getElementById('docRes').style.display='none';"> Link Resouce--}%
                %{--<input type="radio" name="resource" value="document" onclick="document.getElementById('linkRes').style.display='none';document.getElementById('docRes').style.display='block';"> Document Resouce--}%
                    %{--<g:hiddenField name="topic" value="${topicInstance?.id}"></g:hiddenField>--}%
                    %{--<div id="linkRes">--}%

                    %{--Url: <g:textField name="url"></g:textField>--}%


                %{--</div>--}%
                    %{--<div id="docRes" style="display: none;">--}%
                        %{--<input type="file" name="uploadFile">--}%
                    %{--</div>--}%
                    %{--<g:submitButton name="linkSubmit" value="Submit"></g:submitButton>--}%
                </g:uploadForm>
                %{--</g:form>--}%
                %{--<div id="docRes" style="display: none;">--}%
                    %{--<g:uploadForm  name="myUpload">--}%
                        %{--<input type="file" name="uploadFile">--}%
                        %{--<g:submitButton name="docSubmit" value="Submit"></g:submitButton>--}%
                     %{--</g:uploadForm>--}%
                %{--</div>--}%

        </div>
	</body>
</html>
