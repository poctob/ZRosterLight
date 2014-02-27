<%@ page import="net.xpresstek.zrosterlight.Privilege" %>



<div class="fieldcontain ${hasErrors(bean: privilegeInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="privilege.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${privilegeInstance?.name}"/>

</div>

