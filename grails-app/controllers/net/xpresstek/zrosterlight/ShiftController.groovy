package net.xpresstek.zrosterlight



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ShiftController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Shift.list(params), model:[shiftInstanceCount: Shift.count()]
    }

    def show(Shift shiftInstance) {
        respond shiftInstance
    }

    def create() {
        respond new Shift(params)
    }

    @Transactional
    def save(Shift shiftInstance) {
        if (shiftInstance == null) {
            notFound()
            return
        }

        if (shiftInstance.hasErrors()) {
            respond shiftInstance.errors, view:'create'
            return
        }

        shiftInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'shiftInstance.label', default: 'Shift'), shiftInstance.id])
                redirect shiftInstance
            }
            '*' { respond shiftInstance, [status: CREATED] }
        }
    }

    def edit(Shift shiftInstance) {
        respond shiftInstance
    }

    @Transactional
    def update(Shift shiftInstance) {
        if (shiftInstance == null) {
            notFound()
            return
        }

        if (shiftInstance.hasErrors()) {
            respond shiftInstance.errors, view:'edit'
            return
        }

        shiftInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Shift.label', default: 'Shift'), shiftInstance.id])
                redirect shiftInstance
            }
            '*'{ respond shiftInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Shift shiftInstance) {

        if (shiftInstance == null) {
            notFound()
            return
        }

        shiftInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Shift.label', default: 'Shift'), shiftInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'shiftInstance.label', default: 'Shift'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
