package net.xpresstek.zrosterlight



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EmployeeController {

    static allowedMethods = [
        save: "POST", 
        delete: "POST"
    ]

    def index(Integer max) {
        params.max = Math.min(max ?: 5, 100)
        render( view: "index",  
            model:[
                employeeInstanceList: Employee.list(params),
                employeeInstanceCount: Employee.count(),
            ])           
    }
    
    @Transactional
    def save(Employee employeeInstance)
    {
        if (employeeInstance == null) {
            notFound()
            return
        }
        
        employeeInstance.save flush:true
        
        flash.message = "Item processed!"
        renderTable();
        
    }
    
    def renderTable()
    {
        int lastpage = (int)(Employee.count()/10)
        lastpage*=10

        params.max = 10
        params.offset = lastpage
        params.action = "index"
        render (template:'dataTableEmployee', 
            model:[employeeInstanceList:Employee.list(params),
                employeeInstanceCount: Employee.count()] 
        )
    }

    def create()
    {
        def employeeInstance = new Employee(params)
        render (template:'editForm',  
            model:[employeeInstance:employeeInstance])
    }
    
    def edit(int identity) {
        def employeeInstance = Employee.get(identity);
        if (employeeInstance == null) {
            notFound()
            return
        }
        
        render (template:'editForm',  
            model:[employeeInstance:employeeInstance])

    }
   
    @Transactional
    def delete(Employee instance) {
        
        if (instance == null) {
            notFound()
            return
        }

        instance.delete flush:true
        flash.message = message(code: 'default.deleted.message', 
            args: [message(code: 'Employee.label', 
                default: 'Employee'), instance.name])
        renderTable();
     
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'employeeInstance.label', default: 'Employee'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
