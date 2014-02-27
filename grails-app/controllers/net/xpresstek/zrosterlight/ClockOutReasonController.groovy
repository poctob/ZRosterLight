package net.xpresstek.zrosterlight



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ClockOutReasonController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ClockOutReason.list(params), model:[clockOutReasonInstanceCount: ClockOutReason.count()]
    }

    def show(ClockOutReason clockOutReasonInstance) {
        respond clockOutReasonInstance
    }

    def create() {
        respond new ClockOutReason(params)
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

    def edit(ClockOutReason clockOutReasonInstance) {
        respond clockOutReasonInstance
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
    def delete(ClockOutReason clockOutReasonInstance) {

        if (clockOutReasonInstance == null) {
            notFound()
            return
        }

        clockOutReasonInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ClockOutReason.label', default: 'ClockOutReason'), clockOutReasonInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
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
