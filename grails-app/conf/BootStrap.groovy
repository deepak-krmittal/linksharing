import org.ig.*

class BootStrap {

    def init = { servletContext ->

        new User(email:'deepak.krmittal@intelligrape.com',gender: 'Male',firstName: 'Deepak',lastName: 'Mittal',dateOfBirth: new Date(),password: '12345').save()

        10.times {
            new User(email:"dkmittal22${it}@gmail.com",gender: 'Male',firstName: "Deepak",lastName: "Mittal",dob: new Date(),password: '12345').save()
        }


        int value=1

        10.times {


            User user = User.get(value)

            Topic topic= new  Topic(name: "Topic${value}",owner : user,visibility: 'Public',content:"content${value}")

            topic.save()


            value++
        }
        value = 1

        9.times {
            new Subscription(subscriber:User.get(value) ,seriousness: 'casual',topic: Topic.get(value)).save()
            value++

        }


        new Subscription(subscriber:User.get(1) ,seriousness: 'casual',topic: Topic.get(2)).save()
        value=1
        10.times {
            new DocumentResource(title: "resouceTitle${value}",summary: "resourceSummary${value}" , owner: User.get(value),topic: Topic.get(value),fileName: "file${value}",contentType: "pdf").save()
            value++
        }
        value = 1

        10.times {
            new ReadingItem(isFavourite: true,isRead: true,users :User.get(value),resource: Resource.get(value) ).save()
            value++
        }




    }
    def destroy = {
    }
}

//import org.ig.User
//import org.ig.Topic
//import org.ig.Subscription
//import org.ig.Resource
//import org.ig.LinkResource
//
//class BootStrap {
//
//    def init = { servletContext ->
//        User u1 = new User(email:'deepak.krmittal@intelligrape.com',gender: 'Male',firstName: 'Deepak',lastName: 'Mittal',dateOfBirth: new Date(),password: '12345')
//            u1.save()
//        User u2 = new User(email:'dkmittal22@gmail.com',gender: 'Male',firstName: 'Deepak',lastName: 'Mittal',dob: new Date(),password: '12345')
//            u2.save()
//        Topic t1=new Topic(name: 'deepak topic1', owner: u1, visibility: 'public', content: 'deepak topic1')
//        t1.save()
//        Topic t2=new Topic(name: 'deepak topic 11', owner: u2, visibility: 'public', content: 'deepak topic 12')
//        t2.save()
//        Subscription s1=new Subscription(topic: t1, subscriber: u1, seriousness: 'SERIOUS')
//        s1.save()
//        Subscription s2=new Subscription(topic: t2, subscriber: u2, seriousness: 'SERIOUS')
//        s2.save()
//        Subscription s3=new Subscription(topic: t1, subscriber: u2, seriousness: 'SERIOUS')
//        s3.save()
////        LinkResource lr
////        10.times {
////            lr = new LinkResource(title: "LR ${it}", summary: "summary ${it}", owner: u1, topic: t1, url: "http://www.google.com/${it}")
////            lr.save(failOnError: true)
////        }
//    }
//    def destroy = {
//    }
//}


