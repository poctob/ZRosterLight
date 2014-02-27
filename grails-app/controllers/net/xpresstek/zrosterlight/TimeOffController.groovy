package net.xpresstek.zrosterlight



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TimeOffController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TimeOff.list(params), model:[timeOffInstanceCount: TimeOff.count()]
    }

    def show(TimeOff timeOffInstance) {
        respond timeOffInstance
    }

    def create() {
        respond new TimeOff(params)
    }

    @Transactional
    def save(TimeOff timeOffInstance) {
        if (timeOffInstance == null) {
            notFound()
            return
        }

        if (timeOffInstance.hasErrors()) {
            respond timeOffInstance.errors, view:'create'
            return
        }

        timeOffInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'timeOffInstance.label', default: 'TimeOff'), timeOffInstance.id])
                redirect timeOffInstance
            }
            '*' { respond timeOffInstance, [status: CREATED] }
        }
    }

    def edit(TimeOff timeOffInstance) {
        respond timeOffInstance
    }

    @Transactional
    def update(TimeOff timeOffInstance) {
        if (timeOffInstance == null) {
            notFound()
            return
        }

        if (timeOffInstance.hasErrors()) {
            respond timeOffInstance.errors, view:'edit'
            return
        }

        timeOffInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TimeOff.label', default: 'TimeOff'), timeOffInstance.id])
                redirect timeOffInstance
            }
            '*'{ respond timeOffInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TimeOff timeOffInstance) {

        if (timeOffInstance == null) {
            notFound()
            return
        }

        timeOffInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TimeOff.label', default: 'TimeOff'), timeOffInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'timeOffInstance.label', default: 'TimeOff'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
