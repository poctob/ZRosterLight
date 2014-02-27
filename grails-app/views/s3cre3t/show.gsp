
<%@ page import="net.xpresstek.zrosterlight.S3cre3t" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 's3cre3t.label', default: 'S3cre3t')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-s3cre3t" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-s3cre3t" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list s3cre3t">
			
				<g:if test="${s3cre3tInstance?.employee}">
				<li class="fieldcontain">
					<span id="employee-label" class="property-label"><g:message code="s3cre3t.employee.label" default="Employee" /></span>
					
						<span class="property-value" aria-labelledby="employee-label"><g:link controller="employee" action="show" id="${s3cre3tInstance?.employee?.id}">${s3cre3tInstance?.employee?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${s3cre3tInstance?.pass}">
				<li class="fieldcontain">
					<span id="pass-label" class="property-label"><g:message code="s3cre3t.pass.label" default="Pass" /></span>
					
						<span class="property-value" aria-labelledby="pass-label"><g:fieldValue bean="${s3cre3tInstance}" field="pass"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${s3cre3tInstance?.salt}">
				<li class="fieldcontain">
					<span id="salt-label" class="property-label"><g:message code="s3cre3t.salt.label" default="Salt" /></span>
					
						<span class="property-value" aria-labelledby="salt-label"><g:fieldValue bean="${s3cre3tInstance}" field="salt"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:s3cre3tInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${s3cre3tInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
