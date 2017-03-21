//
//  PostTableViewCell.swift
//  instagram
//
//  Created by Suraj Upreti on 3/20/17.
//  Copyright © 2017 Suraj Upreti. All rights reserved.
//

import UIKit
import Parse

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var captionLab: UILabel!
    
    //postImg: UIImageView!
    //captionLab: UILabel!
    
    var post: PFObject? {
        didSet {
            print("this is image \((post?["image"])!)")
            getImage()
            postImg.image = self.postImg.image
            captionLab.text = post?["caption"] as? String
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //        captionLabel.text = "override func setSelected(_ selected: Bool, animated: Bool) super.setSelected(selected, animated: animated)"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func getImage() {
        if let imageFile = post?.value(forKey: "image") {
            //            let imageFile = imageFile as! PFFile
            (imageFile as! PFFile).getDataInBackground(block: { (imageData: Data?, error: Error?) in
                let image = UIImage(data: imageData!)
                if image != nil {
                    self.postImg.image = image
                }
            })
        }
    }


}
