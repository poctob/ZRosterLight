<%@ page import="net.xpresstek.zrosterlight.ClockOutReason" %>



<div class="fieldcontain ${hasErrors(bean: clockOutReasonInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="clockOutReason.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${clockOutReasonInstance?.name}"/>

</div>

