//
//  User.swift
//  TestSwift
//
//  Created by Alexander on 1/5/16.
//  Copyright © 2016 iTechArt. All rights reserved.
//

import Foundation
import Mantle

class User : MTLModel, MTLJSONSerializing {
    var name:String?
    var email: String?
    var city: String?
    var street: String?
    var zipcode: String?
    //var address:[String: String] = [String:String]()
    static func JSONKeyPathsByPropertyKey() -> [NSObject : AnyObject]!
    {
        return ["name": "name",
            "city": "address.city",
            "street": "address.street",
            "zipcode": "address.zipcode",
            "email": "email"]
    }
}