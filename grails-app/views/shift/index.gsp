
<%@ page import="net.xpresstek.zrosterlight.Shift" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'shift.label', default: 'Shift')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-shift" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-shift" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="shift.employee.label" default="Employee" /></th>
					
						<g:sortableColumn property="end" title="${message(code: 'shift.end.label', default: 'End')}" />
					
						<th><g:message code="shift.position.label" default="Position" /></th>
					
						<g:sortableColumn property="start" title="${message(code: 'shift.start.label', default: 'Start')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${shiftInstanceList}" status="i" var="shiftInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${shiftInstance.id}">${fieldValue(bean: shiftInstance, field: "employee")}</g:link></td>
					
						<td><g:formatDate date="${shiftInstance.end}" /></td>
					
						<td>${fieldValue(bean: shiftInstance, field: "position")}</td>
					
						<td><g:formatDate date="${shiftInstance.start}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${shiftInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
