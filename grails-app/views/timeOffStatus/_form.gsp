<%@ page import="net.xpresstek.zrosterlight.TimeOffStatus" %>



<div class="fieldcontain ${hasErrors(bean: timeOffStatusInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="timeOffStatus.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${timeOffStatusInstance?.name}"/>

</div>

