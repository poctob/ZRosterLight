<table>
    <thead>
        <tr>

            <g:sortableColumn property="name" title="${message(code: 'configuration.name.label', default: 'Name')}" />

            <g:sortableColumn property="value" title="${message(code: 'configuration.value.label', default: 'Value')}" />

        </tr>
    </thead>
    <tbody>
        <g:each in="${configurationInstanceList}" status="i" var="configurationInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                    id="${configurationInstance.id}">${fieldValue(bean: configurationInstance, field: "name")}</g:link></td>

                <td>${fieldValue(bean: configurationInstance, field: "value")}</td>

            </tr>
        </g:each>
    </tbody>
</table>
<div class="pagination">
    <g:paginate total="${configurationInstanceCount ?: 0}"/>
</div>
