package net.xpresstek.zrosterlight



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ClockOutReasonController {

      static allowedMethods = [
        save: "POST", 
        delete: "POST", 
        saveConfigurationAjax: "POST"
    ]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ClockOutReason.list(params), model:[clockOutReasonInstanceCount: ClockOutReason.count()]
    }

    def show(ClockOutReason clockOutReasonInstance) {
        respond clockOutReasonInstance
    }

     def create() {
        def clockOutReasonInstance = new ClockOutReason(params);
        render (template:'/configuration/editClockOutReasonForm',  
            model:[clockOutReasonInstance:clockOutReasonInstance])
    }
    
    @Transactional
    def saveConfigurationAjax(ClockOutReason clockOutReasonInstance)
    {
        if (clockOutReasonInstance == null) {
            notFound()
            return
        }
        
        clockOutReasonInstance.save flush:true
        
        flash.message = "Item processed!"
        renderConfigTable();
        
    }
    
    def renderConfigTable()
    {
        int lastpage = (int)(ClockOutReason.count()/10)
        lastpage*=10

        params.max = 10
        params.offset = lastpage
        params.action = "index"
        render (template:'/configuration/dataTableClockOutReason', 
            model:[clockOutReasonInstanceList:ClockOutReason.list(params),
                clockOutReasonCount: ClockOutReason.count()] 
        )
    }

    @Transactional
    def save(ClockOutReason clockOutReasonInstance) {
        if (clockOutReasonInstance == null) {
            notFound()
            return
        }

        if (clockOutReasonInstance.hasErrors()) {
            respond clockOutReasonInstance.errors, view:'create'
            return
        }

        clockOutReasonInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'clockOutReasonInstance.label', default: 'ClockOutReason'), clockOutReasonInstance.id])
                redirect clockOutReasonInstance
            }
            '*' { respond clockOutReasonInstance, [status: CREATED] }
        }
    }

     def edit(int identity) {
        def clockOutReasonInstance = ClockOutReason.get(identity);
        if (clockOutReasonInstance == null) {
            notFound()
            return
        }
        
        render (template:'/configuration/editClockOutReasonForm',  
            model:[clockOutReasonInstance:clockOutReasonInstance])

    }

    @Transactional
    def update(ClockOutReason clockOutReasonInstance) {
        if (clockOutReasonInstance == null) {
            notFound()
            return
        }

        if (clockOutReasonInstance.hasErrors()) {
            respond clockOutReasonInstance.errors, view:'edit'
            return
        }

        clockOutReasonInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ClockOutReason.label', default: 'ClockOutReason'), clockOutReasonInstance.id])
                redirect clockOutReasonInstance
            }
            '*'{ respond clockOutReasonInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ClockOutReason instance) {
        
        if (instance == null) {
            notFound()
            return
        }

        instance.delete flush:true
        flash.message = message(code: 'default.deleted.message', 
            args: [message(code: 'ClockOutReason.label', 
                default: 'ClockOutReason'), instance.name])
        renderConfigTable();     
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'clockOutReasonInstance.label', default: 'ClockOutReason'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
