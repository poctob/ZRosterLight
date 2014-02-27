package net.xpresstek.zrosterlight



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TimeOffStatusController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TimeOffStatus.list(params), model:[timeOffStatusInstanceCount: TimeOffStatus.count()]
    }

    def show(TimeOffStatus timeOffStatusInstance) {
        respond timeOffStatusInstance
    }

    def create() {
        respond new TimeOffStatus(params)
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

    def edit(TimeOffStatus timeOffStatusInstance) {
        respond timeOffStatusInstance
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
    def delete(TimeOffStatus timeOffStatusInstance) {

        if (timeOffStatusInstance == null) {
            notFound()
            return
        }

        timeOffStatusInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TimeOffStatus.label', default: 'TimeOffStatus'), timeOffStatusInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
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
