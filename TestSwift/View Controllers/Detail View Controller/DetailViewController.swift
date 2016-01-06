//
//  DetailViewController.swift
//  TestSwift
//
//  Created by Alexander on 1/6/16.
//  Copyright © 2016 iTechArt. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController : UIViewController {
    var photo:Photo?
    var user:User?
    @IBOutlet weak var detailView: ViewForDetailViewController!
    
    override func viewDidLoad() {
        if ((user) != nil) {
            detailView.title = user!.name
            detailView.email = user?.email
            detailView.city = user?.city
            detailView.street = user?.street
            detailView.zipcode = user?.zipcode
        }
        else if ((photo) != nil) {
            detailView.title = photo!.title
            detailView.imageURL = photo?.imageUrl
        }
    }
}
