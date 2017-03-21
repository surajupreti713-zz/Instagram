//
//  Authentication.swift
//  instagram
//
//  Created by Suraj Upreti on 3/20/17.
//  Copyright © 2017 Suraj Upreti. All rights reserved.
//

import UIKit
import Parse

class Authentication: NSObject {
    class func logOut() {
        PFUser.logOutInBackground { (error: Error?) in
            if error == nil {
                User.currentUser = nil
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: User.userDidLogoutNotification), object: nil)
            }
            else {
                print("Error while logging out: \(error?.localizedDescription)")
            }
        }
    }
}
