
<%@ page import="net.xpresstek.zrosterlight.Configuration" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'configuration.label', default: 'Configuration')}" />
  <title><g:message code="default.list.label" args="[entityName]" /></title>      
</head>
<body>
  <a href="#list-configuration" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

  <div class="nav" role="navigation">
    <g:link class="create" action="create"><g:message code="default.new.label" args="['']" /></g:link>
  </div>
  <div id="list-configuration" class="content scaffold-list" role="main">           
    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>
    <div id="dataTable">
      <g:render template="dataTableConfiguration"/>
    </div>

  </div>
  <div>
    <g:formRemote url="[resource:configurationInstance, action:'saveAjax']" 
                  update="dataTable"
                  name="createForm">
      <fieldset class="form">
        <g:render template="form"/>
      </fieldset>
      <fieldset class="buttons">
        <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
      </fieldset>
    </g:formRemote>
  </div>
</body>
</html>
