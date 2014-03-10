<%@ page import="net.xpresstek.zrosterlight.Privilege" %>

<div id = "privilege-dialog-form" title="Privilege Dialog">           
    <g:formRemote url="[resource:privilegeInstance, action:'saveConfigurationAjax', controller: 'privilege']" 
        name="privilegeSaveForm"
        on404="alert('Error Saving Privilege!')" 
        update="dataTablePrivilegeDiv"
        id="privilege-dialog-form-remote">
        <g:hiddenField name="version" value="${privilegeInstance?.version}" />
        <div class="fieldcontain ${hasErrors(bean: privilegeInstance, field: 'name', 'error')} ">
            <label for="name">
                <g:message code="privilege.name.label" default="Name" />

            </label>
            <g:textField name="name" value="${privilegeInstance?.name}"/>

        </div>
    </g:formRemote>          
</div>



