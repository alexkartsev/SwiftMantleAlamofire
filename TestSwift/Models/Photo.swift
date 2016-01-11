//
//  Photo.swift
//  TestSwift
//
//  Created by Alexander on 1/6/16.
//  Copyright © 2016 Alex Kartsev. All rights reserved.
//

import Foundation
import Mantle

class Photo : MTLModel, MTLJSONSerializing {
    var title: String!
    var imageUrl: String!
    static func JSONKeyPathsByPropertyKey() -> [NSObject : AnyObject]!
    {
        return ["title": "title",
            "imageUrl": "url"]
    }
}