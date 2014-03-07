<script>
    function deleteConfiguration(identity)
    {
    <g:remoteFunction
        controller = "configuration"
        action = "delete"
        update = "dataTableConfigDiv"
        params = "'identity='+identity"
        />
    }

    function editConfiguration(identity)
    {
    <g:remoteFunction
        controller = "configuration"
        onSuccess = "showDialog(true)"             
        action = "edit"
        update = "config-dialog-form"
        params = "'identity='+identity"        
        />
    }
    
   
</script>


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
                    <fieldset class="buttonsInLine">
                        <button class="edit" onclick="editConfiguration(${configurationInstance.id})">Edit</button>
                        <button class="delete" onclick="deleteConfiguration(${configurationInstance.id})">Delete</button>
                    </fieldset>


                </td>

            </tr>
        </g:each>
    </tbody>
</table>
<div class="pagination">
    <g:paginate total="${configurationInstanceCount ?: 0}"/>
</div>
