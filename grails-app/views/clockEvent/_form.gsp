<%@ page import="net.xpresstek.zrosterlight.ClockEvent" %>



<div class="fieldcontain ${hasErrors(bean: clockEventInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="clockEvent.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${clockEventInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clockEventInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="clockEvent.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${clockEventInstance?.name}"/>

</div>

