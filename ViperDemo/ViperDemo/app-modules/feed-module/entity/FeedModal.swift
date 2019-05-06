//
//  FeedModal.swift
//  ViperDemo
//
//  Created by Raj Sharma on 06/05/19.
//  Copyright © 2019 Rheyansh. All rights reserved.
//

import UIKit
import ObjectMapper

class FeedModal: Mappable {
    
    internal var userId: String?
    internal var id: String?
    internal var title: String?
    internal var body: String?
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map){
        id <- map["id"]
        title <- map["title"]
        body <- map["body"]
        userId <- map["userId"]
    }
}
