package net.xpresstek.zrosterlight

class Employee {

    String name
    String address
    String phone
    boolean isActive
    String email
    String comment
    String password
    String salt
    
    static hasMany = [
        positions : Position, 
        privileges : Privilege, 
        timeOff : TimeOff,
        clockEventTrans : ClockEventTrans,
        shift : Shift]
    
    static constraints = {
        address nullable : true
        phone nullable : true
        email email:true, nullable:true
        comment nullable : true
        positions nullable : true
        privileges nullable : true
        timeOff nullable : true
        clockEventTrans nullable : true
        shift nullable : true
        password nullable : true
        salt nullable : true
    }
}
