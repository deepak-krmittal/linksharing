package org.ig

class ReadingItem {

    boolean isFavourite
    boolean isRead
    //User user
//    Resource resource

    static belongsTo = [resource : Resource , user : User]

    static constraints = {
        user(unique: 'resource')
    }
}
