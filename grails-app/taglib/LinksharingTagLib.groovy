import org.ig.ReadingItem
import org.ig.Subscription

class LinksharingTagLib {
      static namespace = "ls"
    def topTopics ={ attr,body->
        List result = Subscription.createCriteria().list() {
            projections {
                groupProperty("topic")
                count("topic","ct")
                property("topic")
            }
            order('ct','desc')
        }
//        println "Result -> ${result}"
        out << "<ul>"
        result.each { it->
            out <<  "<li><a href='/topic/show/${it.getAt(2)}'>${it.getAt(0)}(${it.getAt(1)})</a></li>"
        }
        out << "</ul>"
    }

    def topResource = {
        List result = ReadingItem.createCriteria().list(max: 20,offset: 0) {
            projections{
                groupProperty("resource")
                count("id","ct")
                resource{
                     property("title")
                    property("summary")
                    property("id")
                }
            }
            order("ct",'desc')
        }
        out << "<ul>"
        result.each {
//              List l = (List)it
            out<< "<li><a href='/resource/show/${it.getAt(4)}'>${it.getAt(2)}(${it.getAt(1)})</a></li>"
        }
        out <<"</ul>"
    }
}
