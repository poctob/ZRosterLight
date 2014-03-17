<%@ page import="net.xpresstek.zrosterlight.Position" %>

<div id = "position-dialog-form" title="Position Dialog">           
    <g:formRemote url="[resource:positionInstance, action:'saveConfigurationAjax', controller: 'position']" 
        name="positionSaveForm"
        on404="alert('Error Saving Privilege!')" 
        update="dataTablePositionDiv"
        id="position-dialog-form-remote">
        <g:hiddenField name="version" value="${positionInstance?.version}" />
        <div class="fieldcontain ${hasErrors(bean: positionInstance, field: 'name', 'error')} ">
            <label for="name">
                <g:message code="position.name.label" default="Name" />

            </label>
            <g:textField name="name" value="${positionInstance?.name}"/>          
        </div>
        <div class="fieldcontain ${hasErrors(bean: positionInstance, field: 'comment', 'error')} ">
            <label for="comment">
                <g:message code="position.comment.label" default="Comment" />

            </label>
            <g:textArea name="comment" value="${positionInstance?.comment}"/>
        </div>
    </g:formRemote>          
</div>



