<%@ page import="net.xpresstek.zrosterlight.ClockEventTrans" %>



<div class="fieldcontain ${hasErrors(bean: clockEventTransInstance, field: 'clockEvent', 'error')} required">
	<label for="clockEvent">
		<g:message code="clockEventTrans.clockEvent.label" default="Clock Event" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="clockEvent" name="clockEvent.id" from="${net.xpresstek.zrosterlight.ClockEvent.list()}" optionKey="id" required="" value="${clockEventTransInstance?.clockEvent?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clockEventTransInstance, field: 'clockOutReason', 'error')} required">
	<label for="clockOutReason">
		<g:message code="clockEventTrans.clockOutReason.label" default="Clock Out Reason" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="clockOutReason" name="clockOutReason.id" from="${net.xpresstek.zrosterlight.ClockOutReason.list()}" optionKey="id" required="" value="${clockEventTransInstance?.clockOutReason?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clockEventTransInstance, field: 'employee', 'error')} required">
	<label for="employee">
		<g:message code="clockEventTrans.employee.label" default="Employee" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="employee" name="employee.id" from="${net.xpresstek.zrosterlight.Employee.list()}" optionKey="id" required="" value="${clockEventTransInstance?.employee?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clockEventTransInstance, field: 'timestamp', 'error')} required">
	<label for="timestamp">
		<g:message code="clockEventTrans.timestamp.label" default="Timestamp" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="timestamp" precision="day"  value="${clockEventTransInstance?.timestamp}"  />

</div>

