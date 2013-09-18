package org.ig

import org.springframework.dao.DataIntegrityViolationException

class SubscriptionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [subscriptionInstanceList: Subscription.list(params), subscriptionInstanceTotal: Subscription.count()]
    }

    def create() {
        [subscriptionInstance: new Subscription(params)]
    }

    def save() {
        def subscriptionInstance = new Subscription(params)
        if (!subscriptionInstance.save(flush: true)) {
            render(view: "create", model: [subscriptionInstance: subscriptionInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'subscription.label', default: 'Subscription'), subscriptionInstance.id])
        redirect(action: "show", id: subscriptionInstance.id)
    }

    def show(Long id) {
        def subscriptionInstance = Subscription.get(id)
        if (!subscriptionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subscription.label', default: 'Subscription'), id])
            redirect(action: "list")
            return
        }

        [subscriptionInstance: subscriptionInstance]
    }

    def edit(Long id) {
        def subscriptionInstance = Subscription.get(id)
        if (!subscriptionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subscription.label', default: 'Subscription'), id])
            redirect(action: "list")
            return
        }

        [subscriptionInstance: subscriptionInstance]
    }

    def update(Long id, Long version) {
        def subscriptionInstance = Subscription.get(id)
        if (!subscriptionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subscription.label', default: 'Subscription'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (subscriptionInstance.version > version) {
                subscriptionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'subscription.label', default: 'Subscription')] as Object[],
                          "Another user has updated this Subscription while you were editing")
                render(view: "edit", model: [subscriptionInstance: subscriptionInstance])
                return
            }
        }

        subscriptionInstance.properties = params

        if (!subscriptionInstance.save(flush: true)) {
            render(view: "edit", model: [subscriptionInstance: subscriptionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'subscription.label', default: 'Subscription'), subscriptionInstance.id])
        redirect(action: "show", id: subscriptionInstance.id)
    }

    def delete(Long id) {
        def subscriptionInstance = Subscription.get(id)
        if (!subscriptionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subscription.label', default: 'Subscription'), id])
            redirect(action: "list")
            return
        }

        try {
            subscriptionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'subscription.label', default: 'Subscription'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'subscription.label', default: 'Subscription'), id])
            redirect(action: "show", id: id)
        }
    }

    def subscriber(){
//        render "deepak------------------>>> "+params
        Subscription s = new Subscription(seriousness: params.seriousness,subscriber: User.load(session.user.id),topic: Topic.load(params.topic))
//        s.subscriber=User.load(session.user.id)
        println "deepak---------"+s.validate()
        s.save(failOnError: true)
        List<Resource> res = Resource.findAllByTopic(Topic.load(params.topic))
        ReadingItem readingItem
        res.each {
            readingItem = new ReadingItem(isFavourite: false, isRead: false,resource: Resource.load(it.id),user: User.load(session.user.id))
            readingItem.save(failOnError: true)
        }
        ReadingItem
        redirect(controller: 'user', action: 'dashBoard')
    }

    def unsubscribe(){
//        render "-------->"+params.unSubId
        Subscription s = Subscription.load(params.unSubId)
        s.delete(flush: true)
        redirect(controller: 'user',action: 'dashBoard')
    }
}
