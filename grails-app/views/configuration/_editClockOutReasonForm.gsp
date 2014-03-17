<%@ page import="net.xpresstek.zrosterlight.ClockOutReason" %>

<div id = "clockoutreason-dialog-form" title="Clock Out Reasons Dialog">           
    <g:formRemote url="[resource:clockOutReasonInstance, action:'saveConfigurationAjax', controller: 'clockOutReason']" 
        name="clockOutReasonSaveForm"
        on404="alert('Error Saving Item!')" 
        update="dataTableClockOutReasonDiv"
        id="clockoutreason-dialog-form-remote">
        <g:hiddenField name="version" value="${clockOutReasonInstance?.version}" />
        <div class="fieldcontain ${hasErrors(bean: clockOutReasonInstance, field: 'name', 'error')} ">
            <label for="name">
                <g:message code="clockOutReason.name.label" default="Name" />

            </label>
            <g:textField name="name" value="${clockOutReasonInstance?.name}"/>          
        </div>        
    </g:formRemote>          
</div>



