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
                privilegeInstanceCount: Privilege.count(),
                positionInstanceList: Position.list(params),
                positionInstanceCount: Position.count(),
                clockEventInstanceList: ClockEvent.list(params),
                clockEventInstanceCount: ClockEvent.count(),
                clockOutReasonInstanceList: ClockOutReason.list(params),
                clockOutReasonInstanceCount: ClockOutReason.count(),
                timeOffStatusInstanceList: TimeOffStatus.list(params),
                timeOffStatusInstanceCount: TimeOffStatus.count()
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
        
        render (template:'editForm',  
            model:[configurationInstance:configurationInstance])

    }
    
    def create()
    {
       def configurationInstance = new Configuration(params);
       render (template:'editForm',  
            model:[configurationInstance:configurationInstance])
    }
    

    @Transactional
    def delete(Configuration instance) {

        // def configurationInstance = Configuration.get(identity);
        if (instance == null) {
            notFound()
            return
        }

        instance.delete flush:true
        flash.message = message(code: 'default.deleted.message', 
            args: [message(code: 'Configuration.label', 
                default: 'Configuration'), instance.name])
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
