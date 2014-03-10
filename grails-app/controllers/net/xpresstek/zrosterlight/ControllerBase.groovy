/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package net.xpresstek.zrosterlight

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)

/**
 *
 * @author Alex Pavlunenko <alexp at xpresstek.net>
 */
class ControllerBase <ObjectType> {
    
     static allowedMethods = [
        save: "POST", 
        delete: "POST", 
        saveConfigurationAjax: "POST"
    ]
    
    def dataTableName
    def editFormName
       
    
    
    @Transactional
    def saveConfigurationAjax(ObjectType instance)
    {
        if (instance == null) {
            notFound()
            return
        }
        
        instance.save flush:true
        
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
        def instance = ObjectType.get(identity);
        if (instance == null) {
            notFound()
            return
        }
        
        render (template: editFormName,  
            model:[instance:instance])

    }
    
    def create()
    {
       def instance = new ObjectType(params);
       render (template:editFormName,  
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

