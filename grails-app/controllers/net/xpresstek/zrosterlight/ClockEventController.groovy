package net.xpresstek.zrosterlight



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ClockEventController {

    static allowedMethods = [
        save: "POST", 
        delete: "POST", 
        saveConfigurationAjax: "POST"
    ]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ClockEvent.list(params), model:[clockEventInstanceCount: ClockEvent.count()]
    }

    def show(ClockEvent clockEventInstance) {
        respond clockEventInstance
    }

    def create() {
        def clockEventInstance = new ClockEvent(params);
        render (template:'/configuration/editClockEventForm',  
            model:[clockEventInstance:clockEventInstance])
    }
    
    @Transactional
    def saveConfigurationAjax(ClockEvent clockEventInstance)
    {
        if (clockEventInstance == null) {
            notFound()
            return
        }
        
        clockEventInstance.save flush:true
        
        flash.message = "Item processed!"
        renderConfigTable();
        
    }
    
    def renderConfigTable()
    {
        int lastpage = (int)(ClockEvent.count()/10)
        lastpage*=10

        params.max = 10
        params.offset = lastpage
        params.action = "index"
        render (template:'/configuration/dataTableClockEvent', 
            model:[clockEventInstanceList:ClockEvent.list(params),
                clockEventCount: ClockEvent.count()] 
        )
    }

    @Transactional
    def save(ClockEvent clockEventInstance) {
        if (clockEventInstance == null) {
            notFound()
            return
        }

        if (clockEventInstance.hasErrors()) {
            respond clockEventInstance.errors, view:'create'
            return
        }

        clockEventInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'clockEventInstance.label', default: 'ClockEvent'), clockEventInstance.id])
                redirect clockEventInstance
            }
            '*' { respond clockEventInstance, [status: CREATED] }
        }
    }

     def edit(int identity) {
        def clockEventInstance = ClockEvent.get(identity);
        if (clockEventInstance == null) {
            notFound()
            return
        }
        
        render (template:'/configuration/editClockEventForm',  
            model:[clockEventInstance:clockEventInstance])

    }

    @Transactional
    def update(ClockEvent clockEventInstance) {
        if (clockEventInstance == null) {
            notFound()
            return
        }

        if (clockEventInstance.hasErrors()) {
            respond clockEventInstance.errors, view:'edit'
            return
        }

        clockEventInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ClockEvent.label', default: 'ClockEvent'), clockEventInstance.id])
                redirect clockEventInstance
            }
            '*'{ respond clockEventInstance, [status: OK] }
        }
    }

   @Transactional
    def delete(ClockEvent instance) {
        
        if (instance == null) {
            notFound()
            return
        }

        instance.delete flush:true
        flash.message = message(code: 'default.deleted.message', 
            args: [message(code: 'ClockEvent.label', 
                default: 'ClockEvent'), instance.name])
        renderConfigTable();     
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'clockEventInstance.label', default: 'ClockEvent'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
