
<%@ page import="net.xpresstek.zrosterlight.ClockEventTrans" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'clockEventTrans.label', default: 'ClockEventTrans')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-clockEventTrans" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-clockEventTrans" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list clockEventTrans">
			
				<g:if test="${clockEventTransInstance?.clockEvent}">
				<li class="fieldcontain">
					<span id="clockEvent-label" class="property-label"><g:message code="clockEventTrans.clockEvent.label" default="Clock Event" /></span>
					
						<span class="property-value" aria-labelledby="clockEvent-label"><g:link controller="clockEvent" action="show" id="${clockEventTransInstance?.clockEvent?.id}">${clockEventTransInstance?.clockEvent?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${clockEventTransInstance?.clockOutReason}">
				<li class="fieldcontain">
					<span id="clockOutReason-label" class="property-label"><g:message code="clockEventTrans.clockOutReason.label" default="Clock Out Reason" /></span>
					
						<span class="property-value" aria-labelledby="clockOutReason-label"><g:link controller="clockOutReason" action="show" id="${clockEventTransInstance?.clockOutReason?.id}">${clockEventTransInstance?.clockOutReason?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${clockEventTransInstance?.employee}">
				<li class="fieldcontain">
					<span id="employee-label" class="property-label"><g:message code="clockEventTrans.employee.label" default="Employee" /></span>
					
						<span class="property-value" aria-labelledby="employee-label"><g:link controller="employee" action="show" id="${clockEventTransInstance?.employee?.id}">${clockEventTransInstance?.employee?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${clockEventTransInstance?.timestamp}">
				<li class="fieldcontain">
					<span id="timestamp-label" class="property-label"><g:message code="clockEventTrans.timestamp.label" default="Timestamp" /></span>
					
						<span class="property-value" aria-labelledby="timestamp-label"><g:formatDate date="${clockEventTransInstance?.timestamp}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:clockEventTransInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${clockEventTransInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
