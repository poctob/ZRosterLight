
<%@ page import="net.xpresstek.zrosterlight.TimeOff" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'timeOff.label', default: 'TimeOff')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-timeOff" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-timeOff" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list timeOff">
			
				<g:if test="${timeOffInstance?.employee}">
				<li class="fieldcontain">
					<span id="employee-label" class="property-label"><g:message code="timeOff.employee.label" default="Employee" /></span>
					
						<span class="property-value" aria-labelledby="employee-label"><g:link controller="employee" action="show" id="${timeOffInstance?.employee?.id}">${timeOffInstance?.employee?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${timeOffInstance?.end}">
				<li class="fieldcontain">
					<span id="end-label" class="property-label"><g:message code="timeOff.end.label" default="End" /></span>
					
						<span class="property-value" aria-labelledby="end-label"><g:formatDate date="${timeOffInstance?.end}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${timeOffInstance?.start}">
				<li class="fieldcontain">
					<span id="start-label" class="property-label"><g:message code="timeOff.start.label" default="Start" /></span>
					
						<span class="property-value" aria-labelledby="start-label"><g:formatDate date="${timeOffInstance?.start}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${timeOffInstance?.timeOffStatus}">
				<li class="fieldcontain">
					<span id="timeOffStatus-label" class="property-label"><g:message code="timeOff.timeOffStatus.label" default="Time Off Status" /></span>
					
						<span class="property-value" aria-labelledby="timeOffStatus-label"><g:link controller="timeOffStatus" action="show" id="${timeOffInstance?.timeOffStatus?.id}">${timeOffInstance?.timeOffStatus?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:timeOffInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${timeOffInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
