//
//  StartViewController.swift
//  TestSwift
//
//  Created by Alexander on 1/5/16.
//  Copyright © 2016 Alex Kartsev. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD

class StartViewController: UIViewController {
    
    @IBAction func didPressUsersButton(sender: UIButton) {
        let loadingNotification = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        loadingNotification.mode = MBProgressHUDMode.Indeterminate
        loadingNotification.labelText = "Loading"
        ParseManager.sharedManager.getListOfUsersWithCompletionBlock { (array, error) -> Void in
            if ((error == nil)) {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
                vc.arrayOfUsers = array!
                MBProgressHUD.hideAllHUDsForView(self.view, animated: true)
                self.navigationController?.pushViewController(vc, animated:true)
            }
            else {
                print(error?.description)
            }
        }
    }
    
    @IBAction func didPressPhotosButton(sender: UIButton) {
        let loadingNotification = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        loadingNotification.mode = MBProgressHUDMode.Indeterminate
        loadingNotification.labelText = "Loading"
        ParseManager.sharedManager.getPhotosWithCompletionBlock { (array, error) -> Void in
            if ((error == nil)) {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
                vc.arrayOfPhotos = array!
                vc.isPhoto = true
                MBProgressHUD.hideAllHUDsForView(self.view, animated: true)
                self.navigationController?.pushViewController(vc, animated:true)
            }
            else {
                print(error?.description)
            }
        }
    }
    
}
