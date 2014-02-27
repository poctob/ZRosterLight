package net.xpresstek.zrosterlight



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ClockEventController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ClockEvent.list(params), model:[clockEventInstanceCount: ClockEvent.count()]
    }

    def show(ClockEvent clockEventInstance) {
        respond clockEventInstance
    }

    def create() {
        respond new ClockEvent(params)
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

    def edit(ClockEvent clockEventInstance) {
        respond clockEventInstance
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
    def delete(ClockEvent clockEventInstance) {

        if (clockEventInstance == null) {
            notFound()
            return
        }

        clockEventInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ClockEvent.label', default: 'ClockEvent'), clockEventInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
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
