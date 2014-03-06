
<%@ page import="net.xpresstek.zrosterlight.Configuration" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'configuration.label', default: 'Configuration')}" />
        <g:set var="privilegeName" value="${message(code: 'privilege.label', default: 'Privilege')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>      
    </head>
    <body>
        <a href="#list-configuration" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            </ul>
        </div>

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

        <div id="accordion">
            <h3><g:message code="default.list.label" args="[entityName]" /></h3>
            <div>
                <div id="list-configuration" class="content scaffold-list" role="main">           
                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>

                    <div id="dataTableConfigDiv">
                        <g:render template="dataTableConfig"/>
                    </div>
                </div>


                <div id="create-configuration" role="main">

                    <g:hasErrors bean="${configurationInstance}">
                        <ul class="errors" role="alert">
                            <g:eachError bean="${configurationInstance}" var="error">
                                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                                </g:eachError>
                        </ul>
                    </g:hasErrors>
                    <g:formRemote url="[resource:configurationInstance, action:'saveConfigurationAjax']" 
                        name="configurationSaveForm"
                        on404="alert('Error Saving Configuration!')" 
                        update="dataTableConfigDiv">
                        <fieldset class="form">
                            <g:render template="form"/>
                        </fieldset>
                        <fieldset class="buttons">
                            <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                        </fieldset>
                    </g:formRemote>
                </div>
            </div>

            <h3>Privileges</h3>
            <div id="dataTablePrivilegeDiv">
                <g:render template="dataTablePrivilege"/>
            </div>

        </div>
    </body>
</html>
