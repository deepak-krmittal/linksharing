package linksharingapplication

class LoginFilters {

    def filters = {
        checkSession(controller: 'authentication', invert : true) {
            before = {

                    if(!session.user) {
//                        redirect(view : '/login')
//                        render "Login Mandatory"
                        redirect(controller: 'authentication', action: 'invalidLogin')
                    }
//                        render "Login mandatory"

            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
