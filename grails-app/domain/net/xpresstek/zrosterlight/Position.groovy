package net.xpresstek.zrosterlight

class Position {

    String name
    String comment
    
    static hasMany = [shift : Shift]
}
