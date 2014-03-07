package net.xpresstek.zrosterlight



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ConfigurationController {

    static allowedMethods = [
        save: "POST", 
        delete: "POST", 
        saveConfigurationAjax: "POST"
    ]

    def index(Integer max) {
        params.max = Math.min(max ?: 5, 100)
        render( view: "index",  
            model:[
                configurationInstanceList: Configuration.list(params),
                configurationInstanceCount: Configuration.count(),
                privilegeInstanceList: Privilege.list(params),
                privilegeInstanceCount: Privilege.count()
            ])        
       
        
    }
    
    @Transactional
    def saveConfigurationAjax(Configuration configurationInstance)
    {
        if (configurationInstance == null) {
            notFound()
            return
        }
        
        configurationInstance.save flush:true
        
        flash.message = "Item processed!"
        renderConfigTable();
        
    }
    
    def renderConfigTable()
    {
        int lastpage = (int)(Configuration.count()/10)
        lastpage*=10

        params.max = 10
        params.offset = lastpage
        params.action = "index"
        render (template:'dataTableConfig', 
            model:[configurationInstanceList:Configuration.list(params),
                configurationInstanceCount: Configuration.count()] 
        )
    }
    def edit(int identity) {
        def configurationInstance = Configuration.get(identity);
        if (configurationInstance == null) {
            notFound()
            return
        }
        
        render (template:'form', 
            model:[configurationInstance:configurationInstance] )
    }

    @Transactional
    def delete(int identity) {

        def configurationInstance = Configuration.get(identity);
        if (configurationInstance == null) {
            notFound()
            return
        }

        configurationInstance.delete flush:true
        flash.message = message(code: 'default.deleted.message', 
            args: [message(code: 'Configuration.label', 
                default: 'Configuration'), configurationInstance.name])
        renderConfigTable();
     
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
