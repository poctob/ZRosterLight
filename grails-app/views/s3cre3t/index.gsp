
<%@ page import="net.xpresstek.zrosterlight.S3cre3t" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 's3cre3t.label', default: 'S3cre3t')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-s3cre3t" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-s3cre3t" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="s3cre3t.employee.label" default="Employee" /></th>
					
						<g:sortableColumn property="pass" title="${message(code: 's3cre3t.pass.label', default: 'Pass')}" />
					
						<g:sortableColumn property="salt" title="${message(code: 's3cre3t.salt.label', default: 'Salt')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${s3cre3tInstanceList}" status="i" var="s3cre3tInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${s3cre3tInstance.id}">${fieldValue(bean: s3cre3tInstance, field: "employee")}</g:link></td>
					
						<td>${fieldValue(bean: s3cre3tInstance, field: "pass")}</td>
					
						<td>${fieldValue(bean: s3cre3tInstance, field: "salt")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${s3cre3tInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
