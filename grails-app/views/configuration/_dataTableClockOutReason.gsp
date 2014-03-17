<table>
    <thead>
        <tr>
            <g:sortableColumn property="name" title="${message(code: 'clockOutReason.name.label', default: 'Name')}" />                          
             <th>Operations</th>
        </tr>
    </thead>
    <tbody>
        <g:each in="${clockOutReasonInstanceList}" status="i" var="clockOutReasonInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td>${fieldValue(bean: clockOutReasonInstance, field: "name")}</td>
                <td>
                    <g:formRemote name="clockOutReasonInstanceForm"
                        url="[resource:clockOutReasonInstance, action:'delete', controller:'clockOutReason']" 
                        method="POST"
                        update = "dataTableClockOutReasonDiv">
                        <fieldset class="buttonsInLine">

                            <a href="#"
                            class="edit"                            
                            onclick="editClockOutReason(${clockOutReasonInstance.id});">
                            <g:message code="default.button.edit.label" default="Edit" />
                            </a>

                            <g:actionSubmit 
                                class="delete" 
                                action="delete" 
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}" 
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" 
                                />
                        </fieldset>
                    </g:formRemote >
                </td>
            </tr>
        </g:each>
    </tbody>
</table>
<div class="pagination">
    <g:paginate total="${clockOutReasonInstanceCount ?: 0}"/>
</div>
