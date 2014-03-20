<table>
  <thead>
    <tr>
  <g:sortableColumn property="name" title="${message(code: 'employee.name.label', default: 'Name')}" />

  <g:sortableColumn property="address" title="${message(code: 'employee.address.label', default: 'Address')}" />

  <g:sortableColumn property="phone" title="${message(code: 'employee.phone.label', default: 'Phone')}" />

  <g:sortableColumn property="email" title="${message(code: 'employee.email.label', default: 'Email')}" />

  <g:sortableColumn property="comment" title="${message(code: 'employee.comment.label', default: 'Comment')}" />

  <g:sortableColumn property="isActive" title="${message(code: 'employee.isActive.label', default: 'Is Active')}" />
  
  <th>Operations</th>

</tr>
</thead>
<tbody>
<g:each in="${employeeInstanceList}" status="i" var="employeeInstance">
  <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

    <td>${fieldValue(bean: employeeInstance, field: "name")}</td>

    <td>${fieldValue(bean: employeeInstance, field: "address")}</td>

    <td>${fieldValue(bean: employeeInstance, field: "phone")}</td>

    <td>${fieldValue(bean: employeeInstance, field: "email")}</td>

    <td>${fieldValue(bean: employeeInstance, field: "comment")}</td>

    <td><g:formatBoolean boolean="${employeeInstance.isActive}" /></td>

  <td>
  <g:formRemote name="employeeRemoteForm"
                url="[resource:employeeInstance, action:'delete']" 
                method="POST"
                update = "dataTableEmployeeDiv">
    <fieldset class="buttonsInLine">

      <a href="#"
         class="edit"                            
         onclick="editEmployee(${employeeInstance.id});">
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
  <g:paginate total="${employeeInstanceCount ?: 0}" />
</div>
