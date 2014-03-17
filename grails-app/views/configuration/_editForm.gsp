<%@ page import="net.xpresstek.zrosterlight.Configuration" %>

<div id = "config-dialog-form" title="Configuration Dialog">           
    <g:formRemote url="[resource:configurationInstance, action:'saveConfigurationAjax']" 
        name="configurationSaveForm"
        on404="alert('Error Saving Configuration!')" 
        update="dataTableConfigDiv"
        id="config-dialog-form-remote">
        <g:hiddenField name="version" value="${configurationInstance?.version}" />
        <div class="fieldcontain ${hasErrors(bean: configurationInstance, field: 'name', 'error')} ">
            <label for="name">
                <g:message code="configuration.name.label" default="Name" />

            </label>
            <g:textField name="name" value="${configurationInstance?.name}"/>

        </div>

        <div class="fieldcontain ${hasErrors(bean: configurationInstance, field: 'value', 'error')} ">
            <label for="value">
                <g:message code="configuration.value.label" default="Value" />

            </label>
            <g:textField name="value" value="${configurationInstance?.value}"/>

        </div>         
    </g:formRemote>          
</div>



