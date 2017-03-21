//
//  Post.swift
//  instagram
//
//  Created by Suraj Upreti on 3/20/17.
//  Copyright © 2017 Suraj Upreti. All rights reserved.
//

import UIKit
import Parse

class Post: NSObject {
    class func postUserImage(image: UIImage?, caption: String?, completion: PFBooleanResultBlock?) {
        // Create Parse object PFObject
        let post = PFObject(className: "Post")
        post["image"] = getPFFileFromImage(image: image)
        post["caption"] = caption
        post["composer"] = PFUser.current()
        post["likes_count"] = 0
        post["comment_count"] = 0
        
        post.saveInBackground(block: completion)
    }
    
    class func getPFFileFromImage(image: UIImage?) -> PFFile? {
        if let image = image {
            if let imageData = UIImagePNGRepresentation(image) {
                return PFFile(name: "image.png", data: imageData)
            }
        }
        return nil
    }
}
