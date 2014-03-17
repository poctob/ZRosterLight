
<%@ page import="net.xpresstek.zrosterlight.Configuration" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">             
        <g:set var="entityName" value="${message(code: 'configuration.label', default: 'Configuration')}" />
        <g:set var="privilegeName" value="${message(code: 'privilege.label', default: 'Privilege')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>     

        <script>
            function createConfiguration()
            {
            <g:remoteFunction
                controller = "configuration"
                onSuccess = "showDialog(false, '#config-dialog-form')"             
                action = "create"
                update = "config-dialog-form"        
            />
            }

            function editConfiguration(identity)
            {
            <g:remoteFunction
                onSuccess = "showDialog(true, '#config-dialog-form')"             
                action = "edit"
                update = "config-dialog-form"
                params = "'identity='+identity"        
                />
            }    

            function createPrivilege()
            {
            <g:remoteFunction
                controller = "privilege"
                onSuccess = "showDialog(false, '#privilege-dialog-form')"             
                action = "create"
                update = "privilege-dialog-form"        
            />
            }

            function editPrivilege(identity)
            {
            <g:remoteFunction
                controller = "privilege"
                onSuccess = "showDialog(true, '#privilege-dialog-form')"             
                action = "edit"
                update = "privilege-dialog-form"
                params = "'identity='+identity"        
                />
            }    

            function createPosition()
            {
            <g:remoteFunction
                controller = "position"
                onSuccess = "showDialog(false, '#position-dialog-form')"             
                action = "create"
                update = "position-dialog-form"        
            />
            }

            function editPosition(identity)
            {
            <g:remoteFunction
                controller = "position"
                onSuccess = "showDialog(true, '#position-dialog-form')"             
                action = "edit"
                update = "position-dialog-form"
                params = "'identity='+identity"        
                />
            }    

            function createClockEvent()
            {
            <g:remoteFunction
                controller = "clockEvent"
                onSuccess = "showDialog(false, '#clockevent-dialog-form')"             
                action = "create"
                update = "clockevent-dialog-form"        
            />
            }

            function editClockEvent(identity)
            {
            <g:remoteFunction
                controller = "clockEvent"
                onSuccess = "showDialog(true, '#clockevent-dialog-form')"             
                action = "edit"
                update = "clockevent-dialog-form"
                params = "'identity='+identity"        
                />
            }    

            function createClockOutReason()
            {
            <g:remoteFunction
                controller = "clockOutReason"
                onSuccess = "showDialog(false, '#clockoutreason-dialog-form')"             
                action = "create"
                update = "clockoutreason-dialog-form"        
            />
            }

            function editClockOutReason(identity)
            {
            <g:remoteFunction
                controller = "clockOutReason"
                onSuccess = "showDialog(true, '#clockoutreason-dialog-form')"             
                action = "edit"
                update = "clockoutreason-dialog-form"
                params = "'identity='+identity"        
                />
            }    

            function createTimeOffStatus()
            {
            <g:remoteFunction
                controller = "timeOffStatus"
                onSuccess = "showDialog(false, '#timeoffstatus-dialog-form')"             
                action = "create"
                update = "timeoffstatus-dialog-form"        
            />
            }

            function editTimeOffStatus(identity)
            {
            <g:remoteFunction
                controller = "timeOffStatus"
                onSuccess = "showDialog(true, '#timeoffstatus-dialog-form')"             
                action = "edit"
                update = "timeoffstatus-dialog-form"
                params = "'identity='+identity"        
                />
            }    
        </script>


    </head>
    <body>
        <a href="#list-configuration" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            </ul>
        </div>

        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>


        <g:render template="editForm"/>  
        <g:render template="editPrivilegeForm"/> 
        <g:render template="editPositionForm"/> 
        <g:render template="editClockEventForm"/> 
        <g:render template="editClockOutReasonForm"/> 
        <g:render template="editTimeOffStatusForm"/>


        <div id="accordion">
            <h3><g:message code="default.list.label" args="[entityName]" /></h3>                        

            <div>             
                <fieldset class="buttonsInLine">
                    <a href="#"
                    class="save"                            
                    onclick="createConfiguration();">
                    <g:message code="default.button.create.label" default="New" />
                    </a>                
                </fieldset>
                <div id="dataTableConfigDiv">
                    <g:render template="dataTableConfig"/>
                </div>

                <div id="create-configuration" role="main">

                    <g:hasErrors bean="${configurationInstance}">
                        <ul class="errors" role="alert">
                            <g:eachError bean="${configurationInstance}" var="error">
                                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                                </g:eachError>
                        </ul>
                    </g:hasErrors>

                </div>                             
            </div>
            <h3>Privileges</h3>
            <div> 
                <fieldset class="buttonsInLine">
                    <a href="#"
                    class="save"                            
                    onclick="createPrivilege();">
                    <g:message code="default.button.create.label" default="New" />
                    </a>                
                </fieldset>
                <div id="dataTablePrivilegeDiv">
                    <g:render template="dataTablePrivilege"/>
                </div>
            </div>

            <h3>Positions</h3>
            <div> 
                <fieldset class="buttonsInLine">
                    <a href="#"
                    class="save"                            
                    onclick="createPosition();">
                    <g:message code="default.button.create.label" default="New" />
                    </a>                
                </fieldset>
                <div id="dataTablePositionDiv">
                    <g:render template="dataTablePosition"/>
                </div>
            </div>

            <h3>Clock Events</h3>
            <div> 
                <fieldset class="buttonsInLine">
                    <a href="#"
                    class="save"                            
                    onclick="createClockEvent();">
                    <g:message code="default.button.create.label" default="New" />
                    </a>                
                </fieldset>
                <div id="dataTableClockEventDiv">
                    <g:render template="dataTableClockEvent"/>
                </div>
            </div>

            <h3>Clock Out Reasons</h3>
            <div> 
                <fieldset class="buttonsInLine">
                    <a href="#"
                    class="save"                            
                    onclick="createClockOutReason();">
                    <g:message code="default.button.create.label" default="New" />
                    </a>                
                </fieldset>
                <div id="dataTableClockOutReasonDiv">
                    <g:render template="dataTableClockOutReason"/>
                </div>
            </div>
            
             <h3>Time Off Status</h3>
            <div> 
                <fieldset class="buttonsInLine">
                    <a href="#"
                    class="save"                            
                    onclick="createTimeOffStatus();">
                    <g:message code="default.button.create.label" default="New" />
                    </a>                
                </fieldset>
                <div id="dataTableTimeOffStatusDiv">
                    <g:render template="dataTableTimeOffStatus"/>
                </div>
            </div>

        </div>
    </body>
</html>
