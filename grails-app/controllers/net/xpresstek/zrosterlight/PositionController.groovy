package net.xpresstek.zrosterlight



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PositionController {

     static allowedMethods = [
        save: "POST", 
        delete: "POST", 
        saveConfigurationAjax: "POST"
    ]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Position.list(params), model:[positionInstanceCount: Position.count()]
    }

    def show(Position positionInstance) {
        respond positionInstance
    }

    def create() {
       def positionInstance = new Position(params);
       render (template:'/configuration/editPositionForm',  
            model:[positionInstance:positionInstance])
    }
    
     @Transactional
    def saveConfigurationAjax(Position positionInstance)
    {
        if (positionInstance == null) {
            notFound()
            return
        }
        
        positionInstance.save flush:true
        
        flash.message = "Item processed!"
        renderConfigTable();
        
    }
    
    def renderConfigTable()
    {
        int lastpage = (int)(Position.count()/10)
        lastpage*=10

        params.max = 10
        params.offset = lastpage
        params.action = "index"
        render (template:'/configuration/dataTablePosition', 
            model:[positionInstanceList:Position.list(params),
                positionInstanceCount: Position.count()] 
        )
    }

    @Transactional
    def save(Position positionInstance) {
        if (positionInstance == null) {
            notFound()
            return
        }

        if (positionInstance.hasErrors()) {
            respond positionInstance.errors, view:'create'
            return
        }

        positionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'positionInstance.label', default: 'Position'), positionInstance.id])
                redirect positionInstance
            }
            '*' { respond positionInstance, [status: CREATED] }
        }
    }

     def edit(int identity) {
        def positionInstance = Position.get(identity);
        if (positionInstance == null) {
            notFound()
            return
        }
        
        render (template:'/configuration/editPositionForm',  
            model:[positionInstance:positionInstance])

    }

    @Transactional
    def update(Position positionInstance) {
        if (positionInstance == null) {
            notFound()
            return
        }

        if (positionInstance.hasErrors()) {
            respond positionInstance.errors, view:'edit'
            return
        }

        positionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Position.label', default: 'Position'), positionInstance.id])
                redirect positionInstance
            }
            '*'{ respond positionInstance, [status: OK] }
        }
    }

   @Transactional
    def delete(Position instance) {
        
        if (instance == null) {
            notFound()
            return
        }

        instance.delete flush:true
        flash.message = message(code: 'default.deleted.message', 
            args: [message(code: 'Position.label', 
                default: 'Position'), instance.name])
        renderConfigTable();     
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'positionInstance.label', default: 'Position'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
