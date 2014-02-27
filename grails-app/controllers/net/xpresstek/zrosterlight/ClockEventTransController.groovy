package net.xpresstek.zrosterlight



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ClockEventTransController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ClockEventTrans.list(params), model:[clockEventTransInstanceCount: ClockEventTrans.count()]
    }

    def show(ClockEventTrans clockEventTransInstance) {
        respond clockEventTransInstance
    }

    def create() {
        respond new ClockEventTrans(params)
    }

    @Transactional
    def save(ClockEventTrans clockEventTransInstance) {
        if (clockEventTransInstance == null) {
            notFound()
            return
        }

        if (clockEventTransInstance.hasErrors()) {
            respond clockEventTransInstance.errors, view:'create'
            return
        }

        clockEventTransInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'clockEventTransInstance.label', default: 'ClockEventTrans'), clockEventTransInstance.id])
                redirect clockEventTransInstance
            }
            '*' { respond clockEventTransInstance, [status: CREATED] }
        }
    }

    def edit(ClockEventTrans clockEventTransInstance) {
        respond clockEventTransInstance
    }

    @Transactional
    def update(ClockEventTrans clockEventTransInstance) {
        if (clockEventTransInstance == null) {
            notFound()
            return
        }

        if (clockEventTransInstance.hasErrors()) {
            respond clockEventTransInstance.errors, view:'edit'
            return
        }

        clockEventTransInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ClockEventTrans.label', default: 'ClockEventTrans'), clockEventTransInstance.id])
                redirect clockEventTransInstance
            }
            '*'{ respond clockEventTransInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ClockEventTrans clockEventTransInstance) {

        if (clockEventTransInstance == null) {
            notFound()
            return
        }

        clockEventTransInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ClockEventTrans.label', default: 'ClockEventTrans'), clockEventTransInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'clockEventTransInstance.label', default: 'ClockEventTrans'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
