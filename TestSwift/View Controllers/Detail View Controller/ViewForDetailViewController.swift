//
//  ViewForDetailViewController.swift
//  TestSwift
//
//  Created by Alexander on 1/6/16.
//  Copyright © 2016 iTechArt. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

class ViewForDetailViewController : UIView {
    
    var title:String!
    var email:String?
    var city:String?
    var street:String?
    var zipcode:String?
    var imageURL:String?
    
    private var titleLabel:UILabel!
    private var emailLabel:UILabel?
    private var cityLabel:UILabel?
    private var streetLabel:UILabel?
    private var zipcodeLabel:UILabel?
    private var imageView:UIImageView?
    
    override func layoutSubviews() {
        if (((title) != nil) && ((titleLabel) == nil)) {
            titleLabel = UILabel()
            createLabel(titleLabel, yPosition: 100, title: title)
        }
        if (((email) != nil) && ((emailLabel) == nil)) {
            emailLabel = UILabel()
            createLabel(emailLabel!, yPosition: titleLabel.frame.origin.y + titleLabel.frame.size.height+20, title: "Email: "+email!)
        }
        if (((city) != nil) && ((cityLabel) == nil)) {
            cityLabel = UILabel()
            createLabel(cityLabel!, yPosition: emailLabel!.frame.origin.y + emailLabel!.frame.size.height+20, title: "City: "+city!)
        }
        if (((street) != nil) && ((streetLabel) == nil)) {
            streetLabel = UILabel()
            createLabel(streetLabel!, yPosition: cityLabel!.frame.origin.y + cityLabel!.frame.size.height+20, title: "Street: "+street!)
        }
        if (((zipcode) != nil) && ((zipcodeLabel) == nil)) {
            zipcodeLabel = UILabel()
            createLabel(zipcodeLabel!, yPosition: streetLabel!.frame.origin.y + streetLabel!.frame.size.height+20, title: "Zipcode: "+zipcode!)
        }

        if (((imageURL) != nil) && ((imageView) == nil)) {
            imageView = UIImageView()
            imageView!.frame = CGRectMake(bounds.size.width/2-150, titleLabel!.frame.origin.y + titleLabel!.frame.size.height+20, 300, 300)
            let URL = NSURL(string: imageURL!)
            self.addSubview(imageView!)
            imageView?.af_setImageWithURL(URL!)
        }
        
    }
    
    func createLabel(label:UILabel, yPosition: CGFloat, title: String) {
        label.textAlignment = .Center
        label.lineBreakMode = .ByWordWrapping
        label.text = title
        label.numberOfLines = 0
        label.frame = CGRectMake(bounds.size.width/2-150, yPosition, 300, label.sizeThatFits(CGSizeMake(300, 100)).height)
        self.addSubview(label)
    }
}
