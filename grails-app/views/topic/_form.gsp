<%@ page import="org.ig.Topic" %>



<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="topic.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${topicInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'content', 'error')} ">
	<label for="content">
		<g:message code="topic.content.label" default="Content" />
		
	</label>
	%{--<g:textField name="content" value="${topicInstance?.content}"/>--}%
    <g:textArea name="content" value="${topicInstance?.content}" rows="3" cols="50"></g:textArea>
</div>

%{--<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'owner', 'error')} required">--}%
	%{--<label for="owner">--}%
		%{--<g:message code="topic.owner.label" default="Owner" />--}%
		%{--<span class="required-indicator">*</span>--}%
	%{--</label>--}%
	%{--<g:select id="owner" name="owner.id" from="${org.ig.User.list()}" optionKey="id" required="" value="${topicInstance?.owner?.id}" class="many-to-one"/>--}%
    %{--<g:hiddenField name="owner" value="${session.user.id}"></g:hiddenField>--}%
%{--</div>--}%

%{--<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'resources', 'error')} ">--}%
	%{--<label for="resources">--}%
		%{--<g:message code="topic.resources.label" default="Resources" />--}%
		%{----}%
	%{--</label>--}%
	%{----}%
%{--<ul class="one-to-many">--}%
%{--<g:each in="${topicInstance?.resources?}" var="r">--}%
    %{--<li><g:link controller="resource" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>--}%
%{--</g:each>--}%
%{--<li class="add">--}%
%{--<g:link controller="resource" action="create" params="['topic.id': topicInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'resource.label', default: 'Resource')])}</g:link>--}%
%{--</li>--}%
%{--</ul>--}%

%{--</div>--}%

%{--<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'subscriptions', 'error')} ">--}%
	%{--<label for="subscriptions">--}%
		%{--<g:message code="topic.subscriptions.label" default="Subscriptions" />--}%
		%{----}%
	%{--</label>--}%
	%{----}%
%{--<ul class="one-to-many">--}%
%{--<g:each in="${topicInstance?.subscriptions?}" var="s">--}%
    %{--<li><g:link controller="subscription" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>--}%
%{--</g:each>--}%
%{--<li class="add">--}%
%{--<g:link controller="subscription" action="create" params="['topic.id': topicInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'subscription.label', default: 'Subscription')])}</g:link>--}%
%{--</li>--}%
%{--</ul>--}%

%{--</div>--}%

<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'visibility', 'error')} ">
	<label for="visibility">
		<g:message code="topic.visibility.label" default="Visibility" />
		
	</label>
    <g:select name="visibility" from="${['public','private']}"></g:select>
	%{--<g:textField name="visibility" value="${topicInstance?.visibility}"/>--}%
</div>

