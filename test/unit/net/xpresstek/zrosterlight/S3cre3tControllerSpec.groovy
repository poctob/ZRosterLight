package net.xpresstek.zrosterlight



import grails.test.mixin.*
import spock.lang.*

@TestFor(S3cre3tController)
@Mock(S3cre3t)
class S3cre3tControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.s3cre3tInstanceList
            model.s3cre3tInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.s3cre3tInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            def s3cre3t = new S3cre3t()
            s3cre3t.validate()
            controller.save(s3cre3t)

        then:"The create view is rendered again with the correct model"
            model.s3cre3tInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            s3cre3t = new S3cre3t(params)

            controller.save(s3cre3t)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/s3cre3t/show/1'
            controller.flash.message != null
            S3cre3t.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def s3cre3t = new S3cre3t(params)
            controller.show(s3cre3t)

        then:"A model is populated containing the domain instance"
            model.s3cre3tInstance == s3cre3t
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def s3cre3t = new S3cre3t(params)
            controller.edit(s3cre3t)

        then:"A model is populated containing the domain instance"
            model.s3cre3tInstance == s3cre3t
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/s3cre3t/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def s3cre3t = new S3cre3t()
            s3cre3t.validate()
            controller.update(s3cre3t)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.s3cre3tInstance == s3cre3t

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            s3cre3t = new S3cre3t(params).save(flush: true)
            controller.update(s3cre3t)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/s3cre3t/show/$s3cre3t.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/s3cre3t/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def s3cre3t = new S3cre3t(params).save(flush: true)

        then:"It exists"
            S3cre3t.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(s3cre3t)

        then:"The instance is deleted"
            S3cre3t.count() == 0
            response.redirectedUrl == '/s3cre3t/index'
            flash.message != null
    }
}
