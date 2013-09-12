package org.ig

class User {

    String email
    String password
    String confirmPassword
    String firstName
    String lastName
    Date dateOfBirth
    String gender
    Date dateCreated
    Date lastUpdated
    String fullName

    String getConfirmPassword() {
        return confirmPassword
    }

    String getFullName(){
        return "${firstName} ${lastName}"
    }

    static constraints = {
        email(email: true , blank: false , unique: true)
        password(blank: false , maxSize: 20 , minSize: 4)
        firstName(blank: false , minSize: 2 , maxSize: 25)
        dateOfBirth(nullable: true)
    }

    static hasMany = [subscriptions: Subscription , topics: Topic]

    static transients = ['confirmPassword','fullName']


}
