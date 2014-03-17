package net.xpresstek.zrosterlight



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TimeOffStatusController {

     static allowedMethods = [
        save: "POST", 
        delete: "POST", 
        saveConfigurationAjax: "POST"
    ]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TimeOffStatus.list(params), model:[timeOffStatusInstanceCount: TimeOffStatus.count()]
    }

    def show(TimeOffStatus timeOffStatusInstance) {
        respond timeOffStatusInstance
    }

    def create() {
        def timeOffStatus = new TimeOffStatus(params);
        render (template:'/configuration/editTimeOffStatusForm',  
            model:[timeOffStatus:timeOffStatus])
    }
    
     @Transactional
    def saveConfigurationAjax(TimeOffStatus timeOffStatus)
    {
        if (timeOffStatus == null) {
            notFound()
            return
        }
        
        timeOffStatus.save flush:true
        
        flash.message = "Item processed!"
        renderConfigTable();
        
    }
    
    def renderConfigTable()
    {
        int lastpage = (int)(TimeOffStatus.count()/10)
        lastpage*=10

        params.max = 10
        params.offset = lastpage
        params.action = "index"
        render (template:'/configuration/dataTableTimeOffStatus', 
            model:[timeOffStatusInstanceList:TimeOffStatus.list(params),
                timeOffStatusCount: TimeOffStatus.count()] 
        )
    }

    @Transactional
    def save(TimeOffStatus timeOffStatusInstance) {
        if (timeOffStatusInstance == null) {
            notFound()
            return
        }

        if (timeOffStatusInstance.hasErrors()) {
            respond timeOffStatusInstance.errors, view:'create'
            return
        }

        timeOffStatusInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'timeOffStatusInstance.label', default: 'TimeOffStatus'), timeOffStatusInstance.id])
                redirect timeOffStatusInstance
            }
            '*' { respond timeOffStatusInstance, [status: CREATED] }
        }
    }

    def edit(int identity) {
        def timeOffStatusInstance = TimeOffStatus.get(identity);
        if (timeOffStatusInstance == null) {
            notFound()
            return
        }
        
        render (template:'/configuration/editTimeOffStatusForm',  
            model:[timeOffStatusInstance:timeOffStatusInstance])

    }


    @Transactional
    def update(TimeOffStatus timeOffStatusInstance) {
        if (timeOffStatusInstance == null) {
            notFound()
            return
        }

        if (timeOffStatusInstance.hasErrors()) {
            respond timeOffStatusInstance.errors, view:'edit'
            return
        }

        timeOffStatusInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TimeOffStatus.label', default: 'TimeOffStatus'), timeOffStatusInstance.id])
                redirect timeOffStatusInstance
            }
            '*'{ respond timeOffStatusInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TimeOffStatus instance) {
        
        if (instance == null) {
            notFound()
            return
        }

        instance.delete flush:true
        flash.message = message(code: 'default.deleted.message', 
            args: [message(code: 'TimeOffStatus.label', 
                default: 'TimeOffStatus'), instance.name])
        renderConfigTable()
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'timeOffStatusInstance.label', default: 'TimeOffStatus'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
