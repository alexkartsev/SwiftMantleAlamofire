//
//  ViewController.swift
//  TestSwift
//
//  Created by Alexander on 12/22/15.
//  Copyright © 2015 iTechArt. All rights reserved.
//
import UIKit
import AlamofireImage

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
    let identifier = "Cell"
    var isPhoto = false
    var arrayOfUsers:[User]=[]
    var arrayOfPhotos:[Photo]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        if ((myTableView.indexPathForSelectedRow) != nil) {
            myTableView.deselectRowAtIndexPath(myTableView.indexPathForSelectedRow!, animated: true)
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (isPhoto) {
            return arrayOfPhotos.count;
        }
        else {
            return arrayOfUsers.count;
        }
    }
    

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier)
        if (!isPhoto) {
            if (cell != nil)
            {
                cell = UITableViewCell(style: UITableViewCellStyle.Subtitle,
                    reuseIdentifier: identifier)
            }
            let user:User=arrayOfUsers[indexPath.row]
            cell?.textLabel?.text = user.name
            cell?.detailTextLabel?.text = user.email
        }
        else {
            let photo:Photo=arrayOfPhotos[indexPath.row]
            cell?.textLabel?.text = photo.title
            cell?.imageView?.image = nil
            let URL = NSURL(string: photo.imageUrl)
            cell?.imageView!.af_setImageWithURL(URL!, placeholderImage: nil, filter: nil, imageTransition: .FlipFromLeft(0.2), completion: { response in
                cell?.setNeedsLayout()
            })
        }
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("DetailViewController") as! DetailViewController
        if (isPhoto) {
            vc.photo = arrayOfPhotos[indexPath.row]
        }
        else {
            vc.user = arrayOfUsers[indexPath.row]
        }
        self.navigationController?.pushViewController(vc, animated:true)
    }
}

