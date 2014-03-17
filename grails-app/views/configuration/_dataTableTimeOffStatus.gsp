<table>
    <thead>
        <tr>
            <g:sortableColumn property="name" title="${message(code: 'timeOffStatus.name.label', default: 'Name')}" />                 
            
             <th>Operations</th>
        </tr>
    </thead>
    <tbody>
        <g:each in="${timeOffStatusInstanceList}" status="i" var="timeOffStatusInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td>${fieldValue(bean: timeOffStatusInstance, field: "name")}</td>                                         
                <td>
                    <g:formRemote name="timeOffStatusRemoteForm"
                        url="[resource:timeOffStatusInstance, action:'delete', controller:'timeOffStatus']" 
                        method="POST"
                        update = "dataTableTimeOffStatusDiv">
                        <fieldset class="buttonsInLine">

                            <a href="#"
                            class="edit"                            
                            onclick="editTimeOffStatus(${timeOffStatusInstance.id});">
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
    <g:paginate total="${timeOffStatusInstanceCount ?: 0}"/>
</div>
