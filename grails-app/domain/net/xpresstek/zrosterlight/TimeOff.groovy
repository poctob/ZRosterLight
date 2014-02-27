package net.xpresstek.zrosterlight

class TimeOff {

   Date start
   Date end
   TimeOffStatus timeOffStatus
   static belongsTo = [employee : Employee]
}
