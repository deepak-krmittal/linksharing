package org.ig

class Resource {

    String title
    String summary
    Date dateCreated
    Date lastUpdated
//    User resourceOwner

    static belongsTo = [topic : Topic, owner:User]

    static mapping = {
       // tablePerHierarchy(false)
        summary type: 'text'
    }



    static constraints = {
        title(unique: true)
        summary(maxSize: 1024)
    }

    static hasMany = [readingItems : ReadingItem]
}
