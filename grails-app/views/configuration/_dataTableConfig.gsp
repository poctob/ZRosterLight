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

    <td><g:link action="show"
              id="${configurationInstance.id}">${fieldValue(bean: configurationInstance, field: "name")}</g:link></td>

  <td>${fieldValue(bean: configurationInstance, field: "value")}</td>

  <td>     

  <g:formRemote url="[resource:configurationInstance, action:'delete']" 
                name="configurationDeletingForm"
                on404="alert('Error Deleting Configuration!')" 
                update="dataTableConfigDiv"
                method="DELETE">
    <g:remoteLink action="updateConfigurationAjax"
                  method="PUT"
                  id="${configurationInstance.id}"
                  class="edit"
                  resource="${configurationInstance}"
                  update="create-configuration">
      <g:message code="default.button.edit.label" default="Edit" />
    </g:remoteLink>

    <g:submitButton name="delete" 
                    class="delete"                      
                    value="${message(code: 'default.button.delete.label', default: 'Delete')}" 
                    onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"
                    />
  </g:formRemote>

  </td>

  </tr>
</g:each>
</tbody>
</table>
<div class="pagination">
  <g:paginate total="${configurationInstanceCount ?: 0}"/>
</div>
