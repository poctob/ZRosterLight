<table>
    <thead>
        <tr>

            <g:sortableColumn property="address" title="${message(code: 'employee.address.label', default: 'Address')}" />

            <g:sortableColumn property="comment" title="${message(code: 'employee.comment.label', default: 'Comment')}" />

            <g:sortableColumn property="email" title="${message(code: 'employee.email.label', default: 'Email')}" />

            <g:sortableColumn property="isActive" title="${message(code: 'employee.isActive.label', default: 'Is Active')}" />

            <g:sortableColumn property="name" title="${message(code: 'employee.name.label', default: 'Name')}" />

            <g:sortableColumn property="phone" title="${message(code: 'employee.phone.label', default: 'Phone')}" />

        </tr>
    </thead>
    <tbody>
        <g:each in="${employeeInstanceList}" status="i" var="employeeInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show" id="${employeeInstance.id}">${fieldValue(bean: employeeInstance, field: "address")}</g:link></td>

                <td>${fieldValue(bean: employeeInstance, field: "comment")}</td>

                <td>${fieldValue(bean: employeeInstance, field: "email")}</td>

                <td><g:formatBoolean boolean="${employeeInstance.isActive}" /></td>

                <td>${fieldValue(bean: employeeInstance, field: "name")}</td>

                <td>${fieldValue(bean: employeeInstance, field: "phone")}</td>

            </tr>
        </g:each>
    </tbody>
</table>
<div class="pagination">
    <g:paginate total="${employeeInstanceCount ?: 0}" />
</div>
