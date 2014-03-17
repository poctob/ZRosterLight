<table>
    <thead>
        <tr>
            <g:sortableColumn property="name" title="${message(code: 'clockEvent.name.label', default: 'Name')}" />     
            <g:sortableColumn property="description" title="${message(code: 'clockEvent.description.label', default: 'Description')}" /> 
            
             <th>Operations</th>
        </tr>
    </thead>
    <tbody>
        <g:each in="${clockEventInstanceList}" status="i" var="clockEventInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td>${fieldValue(bean: clockEventInstance, field: "name")}</td>
                <td>${fieldValue(bean: clockEventInstance, field: "description")}</td>
                
               

                <td>
                    <g:formRemote name="clockEventInstanceForm"
                        url="[resource:clockEventInstance, action:'delete', controller:'clockEvent']" 
                        method="POST"
                        update = "dataTableClockEventDiv">
                        <fieldset class="buttonsInLine">

                            <a href="#"
                            class="edit"                            
                            onclick="editClockEvent(${clockEventInstance.id});">
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
    <g:paginate total="${clockEventInstanceCount ?: 0}"/>
</div>
