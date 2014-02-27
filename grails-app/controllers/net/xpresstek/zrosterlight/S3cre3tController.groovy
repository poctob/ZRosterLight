package net.xpresstek.zrosterlight



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class S3cre3tController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond S3cre3t.list(params), model:[s3cre3tInstanceCount: S3cre3t.count()]
    }

    def show(S3cre3t s3cre3tInstance) {
        respond s3cre3tInstance
    }

    def create() {
        respond new S3cre3t(params)
    }

    @Transactional
    def save(S3cre3t s3cre3tInstance) {
        if (s3cre3tInstance == null) {
            notFound()
            return
        }

        if (s3cre3tInstance.hasErrors()) {
            respond s3cre3tInstance.errors, view:'create'
            return
        }

        s3cre3tInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 's3cre3tInstance.label', default: 'S3cre3t'), s3cre3tInstance.id])
                redirect s3cre3tInstance
            }
            '*' { respond s3cre3tInstance, [status: CREATED] }
        }
    }

    def edit(S3cre3t s3cre3tInstance) {
        respond s3cre3tInstance
    }

    @Transactional
    def update(S3cre3t s3cre3tInstance) {
        if (s3cre3tInstance == null) {
            notFound()
            return
        }

        if (s3cre3tInstance.hasErrors()) {
            respond s3cre3tInstance.errors, view:'edit'
            return
        }

        s3cre3tInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'S3cre3t.label', default: 'S3cre3t'), s3cre3tInstance.id])
                redirect s3cre3tInstance
            }
            '*'{ respond s3cre3tInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(S3cre3t s3cre3tInstance) {

        if (s3cre3tInstance == null) {
            notFound()
            return
        }

        s3cre3tInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'S3cre3t.label', default: 'S3cre3t'), s3cre3tInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 's3cre3tInstance.label', default: 'S3cre3t'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
