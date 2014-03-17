<%@ page import="net.xpresstek.zrosterlight.ClockEvent" %>

<div id = "clockevent-dialog-form" title="Clock Events Dialog">           
    <g:formRemote url="[resource:clockEventInstance, action:'saveConfigurationAjax', controller: 'clockEvent']" 
        name="clockEventSaveForm"
        on404="alert('Error Saving Item!')" 
        update="dataTableClockEventDiv"
        id="clockevent-dialog-form-remote">
        <g:hiddenField name="version" value="${clockEventInstance?.version}" />
        <div class="fieldcontain ${hasErrors(bean: clockEventInstance, field: 'name', 'error')} ">
            <label for="name">
                <g:message code="clockEvent.name.label" default="Name" />

            </label>
            <g:textField name="name" value="${clockEventInstance?.name}"/>          
        </div>
        <div class="fieldcontain ${hasErrors(bean: clockEventInstance, field: 'description', 'error')} ">
            <label for="description">
                <g:message code="clockEvent.description.label" default="Description" />

            </label>
            <g:textArea name="description" value="${clockEventInstance?.description}"/>
        </div>
    </g:formRemote>          
</div>



