package org.ig

class Subscription {

    User subscriber
    Date dateCreated
    Date lastUpdated
    String seriousness
    Topic topic


    static constraints = {
        subscriber(unique: 'topic')
    }

    public String toString(){
        return topic.name
    }
}
