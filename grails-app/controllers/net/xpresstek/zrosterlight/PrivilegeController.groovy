package net.xpresstek.zrosterlight



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PrivilegeController {

    static allowedMethods = [
        save: "POST", 
        delete: "POST", 
        saveConfigurationAjax: "POST"
    ]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Privilege.list(params), model:[privilegeInstanceCount: Privilege.count()]
    }
    
    @Transactional
    def saveConfigurationAjax(Privilege privilegeInstance)
    {
        if (privilegeInstance == null) {
            notFound()
            return
        }
        
        privilegeInstance.save flush:true
        
        flash.message = "Item processed!"
        renderConfigTable();
        
    }
    
    def renderConfigTable()
    {
        int lastpage = (int)(Privilege.count()/10)
        lastpage*=10

        params.max = 10
        params.offset = lastpage
        params.action = "index"
        render (template:'/configuration/dataTablePrivilege', 
            model:[privilegeInstanceList:Privilege.list(params),
                privilegeInstanceCount: Privilege.count()] 
        )
    }

    def show(Privilege privilegeInstance) {
        respond privilegeInstance
    }

    def create() {
        def privilegeInstance = new Privilege(params);
        render (template:'/configuration/editPrivilegeForm',  
            model:[privilegeInstance:privilegeInstance])
    }

    @Transactional
    def save(Privilege privilegeInstance) {
        if (privilegeInstance == null) {
            notFound()
            return
        }

        if (privilegeInstance.hasErrors()) {
            respond privilegeInstance.errors, view:'create'
            return
        }

        privilegeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'privilegeInstance.label', default: 'Privilege'), privilegeInstance.id])
                redirect privilegeInstance
            }
            '*' { respond privilegeInstance, [status: CREATED] }
        }
    }

    def edit(int identity) {
        def privilegeInstance = Privilege.get(identity);
        if (privilegeInstance == null) {
            notFound()
            return
        }
        
        render (template:'/configuration/editPrivilegeForm',  
            model:[privilegeInstance:privilegeInstance])

    }

    @Transactional
    def update(Privilege privilegeInstance) {
        if (privilegeInstance == null) {
            notFound()
            return
        }

        if (privilegeInstance.hasErrors()) {
            respond privilegeInstance.errors, view:'edit'
            return
        }

        privilegeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Privilege.label', default: 'Privilege'), privilegeInstance.id])
                redirect privilegeInstance
            }
            '*'{ respond privilegeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Privilege instance) {
        
        if (instance == null) {
            notFound()
            return
        }

        instance.delete flush:true
        flash.message = message(code: 'default.deleted.message', 
            args: [message(code: 'Privilege.label', 
                default: 'Privilege'), instance.name])
        renderConfigTable();     
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'privilegeInstance.label', default: 'Privilege'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
