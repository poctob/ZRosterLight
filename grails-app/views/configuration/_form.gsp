<%@ page import="net.xpresstek.zrosterlight.Configuration" %>



<div class="fieldcontain ${hasErrors(bean: configurationInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="configuration.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${configurationInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: configurationInstance, field: 'value', 'error')} ">
	<label for="value">
		<g:message code="configuration.value.label" default="Value" />
		
	</label>
	<g:textField name="value" value="${configurationInstance?.value}"/>

</div>

