
<%@ page import="net.xpresstek.zrosterlight.ClockEventTrans" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'clockEventTrans.label', default: 'ClockEventTrans')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-clockEventTrans" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-clockEventTrans" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="clockEventTrans.clockEvent.label" default="Clock Event" /></th>
					
						<th><g:message code="clockEventTrans.clockOutReason.label" default="Clock Out Reason" /></th>
					
						<th><g:message code="clockEventTrans.employee.label" default="Employee" /></th>
					
						<g:sortableColumn property="timestamp" title="${message(code: 'clockEventTrans.timestamp.label', default: 'Timestamp')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${clockEventTransInstanceList}" status="i" var="clockEventTransInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${clockEventTransInstance.id}">${fieldValue(bean: clockEventTransInstance, field: "clockEvent")}</g:link></td>
					
						<td>${fieldValue(bean: clockEventTransInstance, field: "clockOutReason")}</td>
					
						<td>${fieldValue(bean: clockEventTransInstance, field: "employee")}</td>
					
						<td><g:formatDate date="${clockEventTransInstance.timestamp}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${clockEventTransInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
