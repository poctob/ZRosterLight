
<%@ page import="net.xpresstek.zrosterlight.Employee" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'employee.label', default: 'Employee')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-employee" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-employee" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list employee">
			
				<g:if test="${employeeInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="employee.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${employeeInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.clockEventTrans}">
				<li class="fieldcontain">
					<span id="clockEventTrans-label" class="property-label"><g:message code="employee.clockEventTrans.label" default="Clock Event Trans" /></span>
					
						<g:each in="${employeeInstance.clockEventTrans}" var="c">
						<span class="property-value" aria-labelledby="clockEventTrans-label"><g:link controller="clockEventTrans" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.comment}">
				<li class="fieldcontain">
					<span id="comment-label" class="property-label"><g:message code="employee.comment.label" default="Comment" /></span>
					
						<span class="property-value" aria-labelledby="comment-label"><g:fieldValue bean="${employeeInstance}" field="comment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="employee.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${employeeInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.isActive}">
				<li class="fieldcontain">
					<span id="isActive-label" class="property-label"><g:message code="employee.isActive.label" default="Is Active" /></span>
					
						<span class="property-value" aria-labelledby="isActive-label"><g:formatBoolean boolean="${employeeInstance?.isActive}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="employee.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${employeeInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.phone}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label"><g:message code="employee.phone.label" default="Phone" /></span>
					
						<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${employeeInstance}" field="phone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.positions}">
				<li class="fieldcontain">
					<span id="positions-label" class="property-label"><g:message code="employee.positions.label" default="Positions" /></span>
					
						<g:each in="${employeeInstance.positions}" var="p">
						<span class="property-value" aria-labelledby="positions-label"><g:link controller="position" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.privileges}">
				<li class="fieldcontain">
					<span id="privileges-label" class="property-label"><g:message code="employee.privileges.label" default="Privileges" /></span>
					
						<g:each in="${employeeInstance.privileges}" var="p">
						<span class="property-value" aria-labelledby="privileges-label"><g:link controller="privilege" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.s3cre3t}">
				<li class="fieldcontain">
					<span id="s3cre3t-label" class="property-label"><g:message code="employee.s3cre3t.label" default="S3cre3t" /></span>
					
						<span class="property-value" aria-labelledby="s3cre3t-label"><g:link controller="s3cre3t" action="show" id="${employeeInstance?.s3cre3t?.id}">${employeeInstance?.s3cre3t?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.shift}">
				<li class="fieldcontain">
					<span id="shift-label" class="property-label"><g:message code="employee.shift.label" default="Shift" /></span>
					
						<g:each in="${employeeInstance.shift}" var="s">
						<span class="property-value" aria-labelledby="shift-label"><g:link controller="shift" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.timeOff}">
				<li class="fieldcontain">
					<span id="timeOff-label" class="property-label"><g:message code="employee.timeOff.label" default="Time Off" /></span>
					
						<g:each in="${employeeInstance.timeOff}" var="t">
						<span class="property-value" aria-labelledby="timeOff-label"><g:link controller="timeOff" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:employeeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${employeeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
