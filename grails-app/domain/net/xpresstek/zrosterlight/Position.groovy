package net.xpresstek.zrosterlight

class Position {

    String name
    String comment
    
    static hasMany = [shift : Shift]
    static constraints  = {
        comment (nullable:true)
    }
}
