package org.ig

class DocumentResource extends  Resource{

    String fileName
    String contentType

    static constraints = {
        fileName(blank: false)
        contentType(blank: false)
    }
}
