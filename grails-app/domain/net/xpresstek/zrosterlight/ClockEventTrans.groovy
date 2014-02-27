package net.xpresstek.zrosterlight

class ClockEventTrans {

    Date timestamp
    ClockOutReason clockOutReason
    ClockEvent clockEvent
    static belongsTo = [employee : Employee]
}
