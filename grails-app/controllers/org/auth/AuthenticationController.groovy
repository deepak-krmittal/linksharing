package org.auth

import org.ig.User

class AuthenticationController {

    def index() { }

/*
    def auth() {
        render("Welcome ")
    }

    def loginhandler(){
        String uname = params.email
        String password = params.password

        User user = User.findWhere(email: uname, password: password)
        if(user != null){
            session.user = user
            session.isLogin = true
            if(user.email.equals("deepak.krmittal11@intelligrape.com")){
                session.isAdmin = true
                redirect(controller: 'user' , action: 'adminDash')
            } else{
                session.isAdmin = false
                redirect(controller: 'user' , action: 'dashBoard')
            }
        }  else{
            render ("Wrong username or password")
        }
    }
*/


    def logout() {
        session.invalidate()
        render(view: '../login')
    }
    def mailService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def auth() {
        render("Welcome ")
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

    def loginhandler(){
        String uname = params.emailig
        String password = params.passwordig

        User user = User.findWhere(email: uname, password: password)
        if(user != null){
            session.user = user
            session.isLogin = true
            if(user.email.equals("arpit.singhal@intelligrape.com")){
                session.isAdmin = true
                redirect(controller: 'user' , action: 'adminDash')
            } else{
                session.isAdmin = false
                redirect(controller: 'user' , action: 'dashBoard')
            }
        }  else{
            render ("Wrong username or password")
        }
    }

    def register() {

        render (view: "register")
    }

    def forget() {
        render (view: '/authentication/forget')
    }

    def adminDash() {
        render("Welcome to admin Page")
    }

    def dashBoard(){
        render ("Welcome to user page")
    }


}
