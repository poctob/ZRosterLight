<%@ page import="net.xpresstek.zrosterlight.Employee" %>

<div id = "employee-dialog-form" title="Employee Dialog">           
  <g:formRemote url="[resource:employeeInstance, action:'save']" 
                name="employeeSaveForm"
                on404="alert('Error Saving Employee!')" 
                update="dataTableEmployeeDiv"
                id="employee-dialog-form-remote">
    <g:hiddenField name="version" value="${employeeInstance?.version}" />
    <div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'name', 'error')} required">
      <label for="name">
        <g:message code="employee.name.label" default="Name" />
        <span class="required-indicator">*</span>

      </label>
      <g:textField name="name" value="${employeeInstance?.name}"/>

    </div>

    <div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'address', 'error')} ">
      <label for="address">
        <g:message code="employee.address.label" default="Address" />

      </label>
      <g:textArea name="address" value="${employeeInstance?.address}"/>

    </div>   

    <div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'phone', 'error')} ">
      <label for="phone">
        <g:message code="employee.phone.label" default="Phone" />

      </label>
      <g:textField name="phone" value="${employeeInstance?.phone}"/>

    </div>   

    <div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'email', 'error')} ">
      <label for="email">
        <g:message code="employee.email.label" default="Email" />

      </label>
      <g:textField name="email" value="${employeeInstance?.email}"/>

    </div>  
    <div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'isActive', 'error')} ">
      <label for="isActive">
        <g:message code="employee.isActive.label" default="Is Active" />

      </label>
      <g:checkBox name="isActive" value="${employeeInstance?.isActive}" />

    </div>

    <div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'positions', 'error')} ">
      <label for="positions">
        <g:message code="employee.positions.label" default="Positions" />

      </label>
      <g:select name="positions" 
                from="${net.xpresstek.zrosterlight.Position.list()}" 
                multiple="multiple" 
                optionKey="id" 
                optionValue="name"
                size="5" 
                value="${employeeInstance?.positions*.id}" 
                class="many-to-many"/>

    </div>

    <div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'privileges', 'error')} ">
      <label for="privileges">
        <g:message code="employee.privileges.label" default="Privileges" />

      </label>
      <g:select name="privileges" 
                from="${net.xpresstek.zrosterlight.Privilege.list()}" 
                multiple="multiple" 
                optionKey="id" 
                optionValue="name"
                size="5" 
                value="${employeeInstance?.privileges*.id}" class="many-to-many"/>

    </div>

    <div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'comment', 'error')} ">
      <label for="comment">
        <g:message code="employee.comment.label" default="Comment" />

      </label>
      <g:textArea name="comment" value="${employeeInstance?.comment}"/>

    </div>   

    <div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'password', 'error')} required">
      <label for="password">
        <g:message code="employee.password.label" default="Password" />
        <span class="required-indicator">*</span>
      </label>
      <g:passwordField name="password"/>        
    </div>

  </g:formRemote>          
</div>



