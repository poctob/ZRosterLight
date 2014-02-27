
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
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            </ul>
        </div>


        <div id="accordion">
            <h3><g:message code="default.list.label" args="[entityName]" /></h3>
            <div>
                <div class="nav" role="navigation">
                    <g:link class="create" action="create"><g:message code="default.new.label" args="['']" /></g:link>
                    </div>
                    <div id="list-configuration" class="content scaffold-list" role="main">           
                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>

                    <table>
                        <thead>
                            <tr>

                                <g:sortableColumn property="name" title="${message(code: 'configuration.name.label', default: 'Name')}" />

                                <g:sortableColumn property="value" title="${message(code: 'configuration.value.label', default: 'Value')}" />

                            </tr>
                        </thead>
                        <tbody>
                            <g:each in="${configurationInstanceList}" status="i" var="configurationInstance">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                    <td><g:link action="show"
                                    id="${configurationInstance.id}">${fieldValue(bean: configurationInstance, field: "name")}</g:link></td>

                                    <td>${fieldValue(bean: configurationInstance, field: "value")}</td>

                                </tr>
                            </g:each>
                        </tbody>
                    </table>
                    <div class="pagination">
                        <g:paginate total="${configurationInstanceCount ?: 0}" />
                    </div>
                </div>
            </div>

            <h3>Configuration 2</h3>
            <div> test 2 </div>

        </div>
    </body>
</html>
