<table>
    <thead>
        <tr>
            <g:sortableColumn property="name" title="${message(code: 'privilege.name.label', default: 'Name')}" />            
        </tr>
    </thead>
    <tbody>
        <g:each in="${privilegeInstanceList}" status="i" var="privilegeInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td>${fieldValue(bean: privilegeInstance, field: "name")}</td>
      
                
                   <td>
                    <g:formRemote name="privilegeRemoteForm"
                        url="[resource:privilegeInstance, action:'delete', controller:'privilege']" 
                        method="POST"
                        update = "dataTablePrivilegeDiv">
                        <fieldset class="buttonsInLine">
                            
                            <a href="#"
                            class="edit"                            
                            onclick="editPrivilege(${privilegeInstance.id});">
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
    <g:paginate total="${privilegeInstanceCount ?: 0}"/>
</div>
