<table>
    <thead>
        <tr>
            <g:sortableColumn property="name" title="${message(code: 'privilege.name.label', default: 'Name')}" />            
        </tr>
    </thead>
    <tbody>
        <g:each in="${privilegeInstanceList}" status="i" var="privilegeInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link controller="privilege" action="show"
                    id="${privilegeInstance.id}">${fieldValue(bean: privilegeInstance, field: "name")}</g:link></td>
            </tr>
        </g:each>
    </tbody>
</table>
<div class="pagination">
    <g:paginate total="${privilegeInstanceCount ?: 0}"/>
</div>
