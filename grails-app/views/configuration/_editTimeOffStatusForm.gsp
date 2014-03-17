<%@ page import="net.xpresstek.zrosterlight.TimeOffStatus" %>

<div id = "timeoffstatus-dialog-form" title="Time Off Status Dialog">           
    <g:formRemote url="[resource:timeOffStatusInstance, action:'saveConfigurationAjax', controller: 'timeOffStatus']" 
        name="timeOffStatusSaveForm"
        on404="alert('Error Saving TimeOffStatus!')" 
        update="dataTableTimeOffStatusDiv"
        id="timeoffstatus-dialog-form-remote">
        <g:hiddenField name="version" value="${timeOffStatusInstance?.version}" />
        <div class="fieldcontain ${hasErrors(bean: timeOffStatusInstance, field: 'name', 'error')} ">
            <label for="name">
                <g:message code="timeOffStatus.name.label" default="Name" />

            </label>
            <g:textField name="name" value="${timeOffStatusInstance?.name}"/>

        </div>
    </g:formRemote>          
</div>



