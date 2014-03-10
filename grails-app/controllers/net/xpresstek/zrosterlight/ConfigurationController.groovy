package net.xpresstek.zrosterlight
import net.xpresstek.zrosterlight.ControllerBase


class ConfigurationController extends ControllerBase<Configuration>{
    
    ConfigurationController()
    {
        dataTableName = "dataTableConfig"
        editFormName ="editForm"
    }
    
    

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
    
}
