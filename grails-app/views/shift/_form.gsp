<%@ page import="net.xpresstek.zrosterlight.Shift" %>



<div class="fieldcontain ${hasErrors(bean: shiftInstance, field: 'employee', 'error')} required">
	<label for="employee">
		<g:message code="shift.employee.label" default="Employee" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="employee" name="employee.id" from="${net.xpresstek.zrosterlight.Employee.list()}" optionKey="id" required="" value="${shiftInstance?.employee?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: shiftInstance, field: 'end', 'error')} required">
	<label for="end">
		<g:message code="shift.end.label" default="End" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="end" precision="day"  value="${shiftInstance?.end}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: shiftInstance, field: 'position', 'error')} required">
	<label for="position">
		<g:message code="shift.position.label" default="Position" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="position" name="position.id" from="${net.xpresstek.zrosterlight.Position.list()}" optionKey="id" required="" value="${shiftInstance?.position?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: shiftInstance, field: 'start', 'error')} required">
	<label for="start">
		<g:message code="shift.start.label" default="Start" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="start" precision="day"  value="${shiftInstance?.start}"  />

</div>

