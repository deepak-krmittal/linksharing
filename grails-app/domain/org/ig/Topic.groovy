package org.ig

class Topic {

    String name
    User owner
    String visibility
    String content

    static mapping = {
        content type: "text"
    }

    static constraints = {
        name(blank: false , unique: true)
    }

    static hasMany = [subscriptions : Subscription , resources : Resource]

    public String toString(){
        return name
    }
}
