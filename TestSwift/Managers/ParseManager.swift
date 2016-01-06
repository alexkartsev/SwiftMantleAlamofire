//
//  ParseManager.swift
//  TestSwift
//
//  Created by Alexander on 1/5/16.
//  Copyright © 2016 iTechArt. All rights reserved.
//

import Foundation
//import AFNetworking
import Mantle
import Alamofire

class ParseManager {
    let requestURL = "http://jsonplaceholder.typicode.com/"
    static let sharedManager = ParseManager()
    
    //AFNetworking
    //var sessionManager = AFHTTPSessionManager()
    
    func getListOfUsersWithCompletionBlock(completion: (array: [User]?, error: NSError?) -> Void) {
        Alamofire.request(.GET, requestURL+"users")
            .responseJSON(completionHandler: { response in
                let list = try? MTLJSONAdapter.modelsOfClass(User.self, fromJSONArray: response.result.value as! [User])
                completion(array: list as? [User], error: response.result.error)
                })
        
        //AFNetworking
//        sessionManager.GET(requestURL+"users", parameters: nil, progress: nil, success: { (task:NSURLSessionDataTask, object:AnyObject?) -> Void in
//                let list = try? MTLJSONAdapter.modelsOfClass(User.self, fromJSONArray: object! as! [User])
//                completion(array: list as? [User], error: nil)
//            }) { (task:NSURLSessionDataTask?, error:NSError) -> Void in
//                completion(array: nil, error: error)
//        }
    }
    
    func getPhotosWithCompletionBlock(completion: (array: [Photo]?, error: NSError?) -> Void) {
        Alamofire.request(.GET, requestURL+"photos")
            .responseJSON(completionHandler: { response in
                let list = try? MTLJSONAdapter.modelsOfClass(Photo.self, fromJSONArray: response.result.value as! [Photo])
                completion(array: list as? [Photo], error: response.result.error)
            })
        //AFNetworking
//        sessionManager.GET(requestURL+"photos", parameters: nil, progress: nil, success: { (task:NSURLSessionDataTask, object:AnyObject?) -> Void in
//            let list = try? MTLJSONAdapter.modelsOfClass(Photo.self, fromJSONArray: object! as! [Photo])
//            completion(array: list as? [Photo], error: nil)
//            }) { (task:NSURLSessionDataTask?, error:NSError) -> Void in
//                completion(array: nil, error: error)
//        }
    }
}
