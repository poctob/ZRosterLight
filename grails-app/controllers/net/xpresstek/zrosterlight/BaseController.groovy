package net.xpresstek.zrosterlight

import org.springframework.transaction.annotation.Transactional

@Transactional(readOnly = true)
abstract class BaseController <ObjectType>{
    
    static allowedMethods = [
        save: "POST", 
        delete: "POST", 
        saveConfigurationAjax: "POST"
    ]
    
    def dataTableName
    def editFormName
    
    abstract index();
    
    abstract ObjectType getNewObject()
    abstract ObjectType getByID(int id)
    abstract ObjectType castToObject(Object instance)
    
    def create()
    {
       def instance = getNewObject();
       render (template:editFormName,  
            model:[instance:instance])
    }
    
    @Transactional
    def saveConfigurationAjax(ObjectType instance)
    {
        def obj = castToObject(instance)
        if (obj == null) {
            notFound()
            return
        }
        
        obj.save flush:true
        
        flash.message = "Item processed!"
        renderTable();
        
    }       
    
    def renderTable()
    {
        int lastpage = (int)(ObjectType.count()/10)
        lastpage*=10

        params.max = 10
        params.offset = lastpage
        params.action = "index"
        render (template: dataTableName, 
            model:[instanceList:ObjectType.list(params),
                instanceCount: ObjectType.count()] 
        )
    }
    
    def edit(int identity) {
        def instance = getByID(identity);
        if (instance == null) {
            notFound()
            return
        }
        
        render (template: editFormName,  
            model:[instance:instance])

    }      
    

    @Transactional
    def delete(ObjectType instance) {

        if (instance == null) {
            notFound()
            return
        }

        instance.delete flush:true
        flash.message = message(code: 'default.deleted.message', 
            args: [message(code: 'ObjectType.label', 
                default: 'ObjectType'), instance.name])
        renderTable();
     
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'instance.label', default: 'ObjectType'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
