//
//  HeaderDescription.swift
//  Adil Virani
//
//  Created by Adil  Virani on 4/24/15.
//  Copyright (c) 2015 Adil  Virani. All rights reserved.
//

import UIKit

class HeaderDescription: UIView {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileAge: UILabel!

    class func instanceFromNib() -> HeaderDescription {
        return NSBundle.mainBundle().loadNibNamed("headerDescription", owner: self, options: nil)[0] as! HeaderDescription
    }
}
