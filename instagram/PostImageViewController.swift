//
//  PostImageViewController.swift
//  instagram
//
//  Created by Suraj Upreti on 3/20/17.
//  Copyright © 2017 Suraj Upreti. All rights reserved.
//

import UIKit
import MBProgressHUD

class PostImageViewController: UIViewController {
    
    @IBOutlet weak var postImgLabel: UIImageView!
    @IBOutlet weak var captionTextField: UITextView!
    
    var image: UIImage?
    var caption: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.postImgLabel.image = image
        self.captionTextField.clearsOnInsertion = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonClicked(_ sender: Any) {
        let alertController = UIAlertController(title: "Alert!", message: "Are you sure you want to exit", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (_) in
            self.dismiss(animated: true, completion: nil)
        }))
        alertController.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)

    }
    
    @IBAction func doneButtonClicked(_ sender: Any) {
        self.caption = captionTextField.text
        MBProgressHUD.showAdded(to: self.view, animated: true)
        Post.postUserImage(image: image, caption: caption) { (success: Bool, error: Error?) in
            if success {
                MBProgressHUD.hide(for: self.view, animated: true)
                self.dismiss(animated: true, completion: nil)
            }
            else {
                print("error while saving photo: \(error)")
                let alertController = UIAlertController(title: "Error", message: "error occured while posting image", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    

}
