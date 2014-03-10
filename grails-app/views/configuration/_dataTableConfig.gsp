<table>
    <thead>
        <tr>

            <g:sortableColumn property="name" title="${message(code: 'configuration.name.label', default: 'Name')}" />

            <g:sortableColumn property="value" title="${message(code: 'configuration.value.label', default: 'Value')}" />

            <th>Operations</th>

        </tr>
    </thead>
    <tbody>
        <g:each in="${configurationInstanceList}" status="i" var="configurationInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td>${fieldValue(bean: configurationInstance, field: "name")}</td>

                <td>${fieldValue(bean: configurationInstance, field: "value")}</td>

                <td>
                    <g:formRemote name="configurationRemoteForm"
                        url="[resource:configurationInstance, action:'delete']" 
                        method="POST"
                        update = "dataTableConfigDiv">
                        <fieldset class="buttonsInLine">
                            
                            <a href="#"
                            class="edit"                            
                            onclick="editConfiguration(${configurationInstance.id});">
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
    <g:paginate total="${configurationInstanceCount ?: 0}"/>
</div>
