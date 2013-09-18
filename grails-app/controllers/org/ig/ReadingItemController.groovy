package org.ig

class ReadingItemController {

    def index() {}

    def editOrCreate(Long id){
        boolean isFavourite=false
        boolean isRead=false
        if(params.isFavourite){
            isFavourite=true
        }
        if(params.isRead){
            isRead=true
        }
        ReadingItem readingItem = ReadingItem.findByResourceAndUser(Resource.load(params.id),User.load(session.user.id))
        if(readingItem){
            readingItem.isFavourite=isFavourite
            readingItem.isRead=isRead
            readingItem.save()
        }else{
            readingItem = new ReadingItem(isFavourite: isFavourite, isRead: isRead, resource: Resource.load(params.id), user: User.load(session.user.id)).save()
        }
        flash.message="Reading Item added successfully"
        redirect(controller: 'resource', action: 'show', params: ['id':params.id])
    }
}
