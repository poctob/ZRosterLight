
<%@ page import="net.xpresstek.zrosterlight.Employee" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'employee.label', default: 'Employee')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>

        <script>
            function createEmployee()
            {
            <g:remoteFunction
                controller = "employee"
                onSuccess = "showDialog(false, '#employee-dialog-form')"             
                action = "create"
                update = "employee-dialog-form"        
            />
            }

            function editEmployee(identity)
            {
            <g:remoteFunction
                onSuccess = "showDialog(true, '#employee-dialog-form')"             
                action = "edit"
                update = "employee-dialog-form"
                params = "'identity='+identity"        
                />
            }   
        </script>
    </head>
    <body>
        <a href="#list-employee" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>

            </ul>
        </div>
        <g:render template="editForm"/> 
        <div id="list-employee" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>



        </div>
        <div> 
            <fieldset class="buttonsInLine">
                <a href="#"
                class="save"                            
                onclick="createEmployee();">
                <g:message code="default.button.create.label" default="New" />
                </a>                
            </fieldset>
            <div id="dataTableEmployeeDiv">
                <g:render template="dataTableEmployee"/>
            </div>
        </div>
    </body>
</html>
