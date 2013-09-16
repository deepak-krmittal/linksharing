package org.ig

import org.springframework.dao.DataIntegrityViolationException

class UserController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def adminDash() {
        render("Welcome to admin Page")
    }

    def dashBoard(){
        def subscription = Subscription.createCriteria().list {
            projections{
                topic{
                    property("id")
                    property("name")
                    property("content")
                    property("visibility")
                }
                property("seriousness")
            }
            eq("subscriber",User.load(session.user.id))
        }
        [subs:subscription]

//        render ("Welcome to user page")
    }

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [userInstanceList: User.list(params), userInstanceTotal: User.count()]
    }

    def create() {
        [userInstance: new User(params)]
    }

    def save() {
        def userInstance = new User(params)
        if (!userInstance.save(flush: true)) {
            render(view: "create", model: [userInstance: userInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "show", id: userInstance.id)
    }

    def show(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        [userInstance: userInstance]
    }

    def edit(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        [userInstance: userInstance]
    }

    def update(Long id, Long version) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (userInstance.version > version) {
                userInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'user.label', default: 'User')] as Object[],
                          "Another user has updated this User while you were editing")
                render(view: "edit", model: [userInstance: userInstance])
                return
            }
        }

        userInstance.properties = params

        if (!userInstance.save(flush: true)) {
            render(view: "edit", model: [userInstance: userInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "show", id: userInstance.id)
    }

    def delete(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        try {
            userInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "show", id: id)
        }
    }
 // show all topics subscribed
    def all(){
        def subscription = Subscription.createCriteria().list {
            projections{
                topic{
                    property("name")
                    property("content")
                    property("visibility")
                }
                property("seriousness")
            }
            eq("subscriber",User.load(2))
        }
//        render(model: [abc:subscription])
        render subscription
    }

    def unread(){

    }

    def subscriber(){
        def subscription = Subscription.createCriteria().list(max: 15, offset: 0) {
            projections {
                topic{

                }
                ieq("visibility","public")
            }
        }
    }

    def exercise(){
        ReadingItem.createCriteria().list {

            eq("user_id",1)
        }
    }

    def highestSubs(){
        def l = Subscription.createCriteria().list(max:1,offset:0) {
            projections {
                topic{
                    property("name")
                }
                count("subscriber",'tc')

            }
            groupProperty("topic")
            order('tc','desc')

        }
        List l2 = l.get(0)
          render "Topic Name: "+l2.get(0)+"<br />Count: "+l2.get(1)
    }

    def forgetsend(){

        String email = params.emailforget

        User user = User.findWhere(email: email)
        if(user){
            try {
                sendMail {
                    to email
                    subject "Forget Password"
                    text "Your Password is ${user.password}"
                }

            } catch(Exception e) {
                render(e)

            }
            render("Your Password has sent to Your Email , Please check ")

        }else{
            render ("This email is not register for this application")
        }


    }

    def saveig() {
        def userInstance = new User(params)
        if (!userInstance.save(flush: true)) {
            render(view: "register", model: [userInstance: userInstance])
            return
        }  else{
            session.user=userInstance
            redirect(action: "show", id: userInstance.id)

        }
        //render ("User have successful register")
    }

    def register() {

    }

    def forget() {

    }


}
