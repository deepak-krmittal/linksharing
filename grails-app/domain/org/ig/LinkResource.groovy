package org.ig

class LinkResource extends Resource{

    String url

    static constraints = {
        url(url: true)
    }
}
