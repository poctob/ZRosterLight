<%@ page import="net.xpresstek.zrosterlight.Employee" %>



<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="employee.address.label" default="Address" />
		
	</label>
	<g:textField name="address" value="${employeeInstance?.address}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'clockEventTrans', 'error')} ">
	<label for="clockEventTrans">
		<g:message code="employee.clockEventTrans.label" default="Clock Event Trans" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${employeeInstance?.clockEventTrans?}" var="c">
    <li><g:link controller="clockEventTrans" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="clockEventTrans" action="create" params="['employee.id': employeeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'clockEventTrans.label', default: 'ClockEventTrans')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'comment', 'error')} ">
	<label for="comment">
		<g:message code="employee.comment.label" default="Comment" />
		
	</label>
	<g:textField name="comment" value="${employeeInstance?.comment}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="employee.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${employeeInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'isActive', 'error')} ">
	<label for="isActive">
		<g:message code="employee.isActive.label" default="Is Active" />
		
	</label>
	<g:checkBox name="isActive" value="${employeeInstance?.isActive}" />

</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="employee.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${employeeInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'phone', 'error')} ">
	<label for="phone">
		<g:message code="employee.phone.label" default="Phone" />
		
	</label>
	<g:textField name="phone" value="${employeeInstance?.phone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'positions', 'error')} ">
	<label for="positions">
		<g:message code="employee.positions.label" default="Positions" />
		
	</label>
	<g:select name="positions" from="${net.xpresstek.zrosterlight.Position.list()}" multiple="multiple" optionKey="id" size="5" value="${employeeInstance?.positions*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'privileges', 'error')} ">
	<label for="privileges">
		<g:message code="employee.privileges.label" default="Privileges" />
		
	</label>
	<g:select name="privileges" from="${net.xpresstek.zrosterlight.Privilege.list()}" multiple="multiple" optionKey="id" size="5" value="${employeeInstance?.privileges*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 's3cre3t', 'error')} required">
	<label for="s3cre3t">
		<g:message code="employee.s3cre3t.label" default="S3cre3t" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="s3cre3t" name="s3cre3t.id" from="${net.xpresstek.zrosterlight.S3cre3t.list()}" optionKey="id" required="" value="${employeeInstance?.s3cre3t?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'shift', 'error')} ">
	<label for="shift">
		<g:message code="employee.shift.label" default="Shift" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${employeeInstance?.shift?}" var="s">
    <li><g:link controller="shift" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="shift" action="create" params="['employee.id': employeeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'shift.label', default: 'Shift')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'timeOff', 'error')} ">
	<label for="timeOff">
		<g:message code="employee.timeOff.label" default="Time Off" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${employeeInstance?.timeOff?}" var="t">
    <li><g:link controller="timeOff" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="timeOff" action="create" params="['employee.id': employeeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'timeOff.label', default: 'TimeOff')])}</g:link>
</li>
</ul>


</div>

