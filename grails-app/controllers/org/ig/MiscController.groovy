package org.ig

class MiscController {

    def index() {}

    def sendInvite(){
        try{
            sendMail{
                to params.email
                subject "Invitation for the new topic"
                html "<body><a href='http://localhost:8080/linkSharingApplication/topic/show/${params.topic}'>Subscribe to this topic</a></body>"
            }
            flash.message='Invitation sent successfully'
        }catch(r){
            println r
            flash.message='Server side error'
        }
        redirect(controller: 'topic', action: 'show', params: ['id':params.topic])
    }
}
