<%@ page import="net.xpresstek.zrosterlight.S3cre3t" %>



<div class="fieldcontain ${hasErrors(bean: s3cre3tInstance, field: 'employee', 'error')} required">
	<label for="employee">
		<g:message code="s3cre3t.employee.label" default="Employee" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="employee" name="employee.id" from="${net.xpresstek.zrosterlight.Employee.list()}" optionKey="id" required="" value="${s3cre3tInstance?.employee?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: s3cre3tInstance, field: 'pass', 'error')} ">
	<label for="pass">
		<g:message code="s3cre3t.pass.label" default="Pass" />
		
	</label>
	<g:textField name="pass" value="${s3cre3tInstance?.pass}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: s3cre3tInstance, field: 'salt', 'error')} ">
	<label for="salt">
		<g:message code="s3cre3t.salt.label" default="Salt" />
		
	</label>
	<g:textField name="salt" value="${s3cre3tInstance?.salt}"/>

</div>

