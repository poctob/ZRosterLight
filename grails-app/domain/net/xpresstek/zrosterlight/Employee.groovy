package net.xpresstek.zrosterlight

class Employee {

    String name
    String address
    String phone
    boolean isActive
    String email
    String comment
    
    static hasMany = [
        positions : Position, 
        privileges : Privilege, 
        timeOff : TimeOff,
        clockEventTrans : ClockEventTrans,
        shift : Shift]
    static hasOne = [s3cre3t : S3cre3t]
}
