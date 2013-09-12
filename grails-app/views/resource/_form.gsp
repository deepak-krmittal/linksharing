<%@ page import="org.ig.Resource" %>



<div class="fieldcontain ${hasErrors(bean: resourceInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="resource.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${resourceInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: resourceInstance, field: 'summary', 'error')} ">
	<label for="summary">
		<g:message code="resource.summary.label" default="Summary" />
		
	</label>
	<g:textArea name="summary" cols="40" rows="5" maxlength="1024" value="${resourceInstance?.summary}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: resourceInstance, field: 'readingItems', 'error')} ">
	<label for="readingItems">
		<g:message code="resource.readingItems.label" default="Reading Items" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${resourceInstance?.readingItems?}" var="r">
    <li><g:link controller="readingItem" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="readingItem" action="create" params="['resource.id': resourceInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'readingItem.label', default: 'ReadingItem')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: resourceInstance, field: 'resourceOwner', 'error')} required">
	<label for="resourceOwner">
		<g:message code="resource.resourceOwner.label" default="Resource Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="resourceOwner" name="resourceOwner.id" from="${org.ig.User.list()}" optionKey="id" required="" value="${resourceInstance?.resourceOwner?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: resourceInstance, field: 'topic', 'error')} required">
	<label for="topic">
		<g:message code="resource.topic.label" default="Topic" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="topic" name="topic.id" from="${org.ig.Topic.list()}" optionKey="id" required="" value="${resourceInstance?.topic?.id}" class="many-to-one"/>
</div>

