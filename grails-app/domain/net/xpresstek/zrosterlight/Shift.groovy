package net.xpresstek.zrosterlight

class Shift {

    Date start
    Date end
    static belongsTo = [employee : Employee, position : Position]
}
