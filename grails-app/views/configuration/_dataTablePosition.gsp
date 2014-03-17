<table>
    <thead>
        <tr>
            <g:sortableColumn property="name" title="${message(code: 'position.name.label', default: 'Name')}" />     
            <g:sortableColumn property="comment" title="${message(code: 'position.cvomment.label', default: 'Comment')}" /> 
            
             <th>Operations</th>
        </tr>
    </thead>
    <tbody>
        <g:each in="${positionInstanceList}" status="i" var="positionInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td>${fieldValue(bean: positionInstance, field: "name")}</td>
                <td>${fieldValue(bean: positionInstance, field: "comment")}</td>
                
               

                <td>
                    <g:formRemote name="positionRemoteForm"
                        url="[resource:positionInstance, action:'delete', controller:'position']" 
                        method="POST"
                        update = "dataTablePositionDiv">
                        <fieldset class="buttonsInLine">

                            <a href="#"
                            class="edit"                            
                            onclick="editPosition(${positionInstance.id});">
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
    <g:paginate total="${positionInstanceCount ?: 0}"/>
</div>
