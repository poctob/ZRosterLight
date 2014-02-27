
<%@ page import="net.xpresstek.zrosterlight.TimeOff" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'timeOff.label', default: 'TimeOff')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-timeOff" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-timeOff" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="timeOff.employee.label" default="Employee" /></th>
					
						<g:sortableColumn property="end" title="${message(code: 'timeOff.end.label', default: 'End')}" />
					
						<g:sortableColumn property="start" title="${message(code: 'timeOff.start.label', default: 'Start')}" />
					
						<th><g:message code="timeOff.timeOffStatus.label" default="Time Off Status" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${timeOffInstanceList}" status="i" var="timeOffInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${timeOffInstance.id}">${fieldValue(bean: timeOffInstance, field: "employee")}</g:link></td>
					
						<td><g:formatDate date="${timeOffInstance.end}" /></td>
					
						<td><g:formatDate date="${timeOffInstance.start}" /></td>
					
						<td>${fieldValue(bean: timeOffInstance, field: "timeOffStatus")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${timeOffInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
