<%@ page import="net.xpresstek.zrosterlight.TimeOff" %>



<div class="fieldcontain ${hasErrors(bean: timeOffInstance, field: 'employee', 'error')} required">
	<label for="employee">
		<g:message code="timeOff.employee.label" default="Employee" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="employee" name="employee.id" from="${net.xpresstek.zrosterlight.Employee.list()}" optionKey="id" required="" value="${timeOffInstance?.employee?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: timeOffInstance, field: 'end', 'error')} required">
	<label for="end">
		<g:message code="timeOff.end.label" default="End" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="end" precision="day"  value="${timeOffInstance?.end}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: timeOffInstance, field: 'start', 'error')} required">
	<label for="start">
		<g:message code="timeOff.start.label" default="Start" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="start" precision="day"  value="${timeOffInstance?.start}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: timeOffInstance, field: 'timeOffStatus', 'error')} required">
	<label for="timeOffStatus">
		<g:message code="timeOff.timeOffStatus.label" default="Time Off Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="timeOffStatus" name="timeOffStatus.id" from="${net.xpresstek.zrosterlight.TimeOffStatus.list()}" optionKey="id" required="" value="${timeOffInstance?.timeOffStatus?.id}" class="many-to-one"/>

</div>

