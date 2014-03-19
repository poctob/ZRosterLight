package net.xpresstek.zrosterlight

import org.springframework.transaction.annotation.Transactional

@Transactional(readOnly = true)
abstract class BaseController <ObjectType>{
    
    static allowedMethods = [
        save: "POST", 
        delete: "POST", 
        saveConfigurationAjax: "POST"
    ]
    
    def editFormName
    def dataTableName
    
    abstract count()
    abstract list(params)
    abstract get(identity)
    abstract delete(ObjectType instance)
    abstract saveConfigurationAjax(ObjectType instance)
    
    def create()
    {
        def instance = new ObjectType();
        render (template:editFormName,  
            model:[instance:instance])
    }
    
    def show(ObjectType instance) {
        respond instance
    }
    
    def renderConfigTable()
    {
        int lastpage = (int)(count()/10)
        lastpage*=10

        params.max = 10
        params.offset = lastpage
        params.action = "index"
        render (template:dataTableName, 
            model:[instanceList:list(params),
                instanceCount: count()] 
        )
    }
    
     def edit(int identity) {
        def instance = get(identity);
        if (instance == null) {
            notFound()
            return
        }
        
        render (template:editFormName,  
            model:[instance:instance])

    }
        
}
