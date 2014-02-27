<%@ page import="net.xpresstek.zrosterlight.Position" %>



<div class="fieldcontain ${hasErrors(bean: positionInstance, field: 'comment', 'error')} ">
	<label for="comment">
		<g:message code="position.comment.label" default="Comment" />
		
	</label>
	<g:textField name="comment" value="${positionInstance?.comment}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: positionInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="position.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${positionInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: positionInstance, field: 'shift', 'error')} ">
	<label for="shift">
		<g:message code="position.shift.label" default="Shift" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${positionInstance?.shift?}" var="s">
    <li><g:link controller="shift" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="shift" action="create" params="['position.id': positionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'shift.label', default: 'Shift')])}</g:link>
</li>
</ul>


</div>

