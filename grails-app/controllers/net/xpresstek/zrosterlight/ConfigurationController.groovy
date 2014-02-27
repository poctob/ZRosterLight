package net.xpresstek.zrosterlight



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ConfigurationController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Configuration.list(params), model:[configurationInstanceCount: Configuration.count()]
    }

    def show(Configuration configurationInstance) {
        respond configurationInstance
    }

    def create() {
        respond new Configuration(params)
    }

    @Transactional
    def save(Configuration configurationInstance) {
        if (configurationInstance == null) {
            notFound()
            return
        }

        if (configurationInstance.hasErrors()) {
            respond configurationInstance.errors, view:'create'
            return
        }

        configurationInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'configurationInstance.label', default: 'Configuration'), configurationInstance.id])
                redirect configurationInstance
            }
            '*' { respond configurationInstance, [status: CREATED] }
        }
    }

    def edit(Configuration configurationInstance) {
        respond configurationInstance
    }

    @Transactional
    def update(Configuration configurationInstance) {
        if (configurationInstance == null) {
            notFound()
            return
        }

        if (configurationInstance.hasErrors()) {
            respond configurationInstance.errors, view:'edit'
            return
        }

        configurationInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Configuration.label', default: 'Configuration'), configurationInstance.id])
                redirect configurationInstance
            }
            '*'{ respond configurationInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Configuration configurationInstance) {

        if (configurationInstance == null) {
            notFound()
            return
        }

        configurationInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Configuration.label', default: 'Configuration'), configurationInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'configurationInstance.label', default: 'Configuration'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
