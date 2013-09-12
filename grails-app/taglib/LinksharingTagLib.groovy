

import org.ig.Subscription

class LinksharingTagLib {
      static namespace = "ls"
    def topTopics ={ attr,body->
        List result = Subscription.createCriteria().list() {
            projections {
                groupProperty("topic")
                count("topic","ct")
            }
            order('ct','desc')
        }
//        println "Result -> ${result}"
        out << "<ul>"
        result.each { it->
            out <<  "<li>${it.getAt(0)}(${it.getAt(1)})</li>"
        }
        out << "</ul>"
    }
}
