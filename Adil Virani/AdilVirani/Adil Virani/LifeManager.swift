//
//  LifeManager.swift
//  Adil Virani
//
//  Created by Adil  Virani on 4/24/15.
//  Copyright (c) 2015 Adil  Virani. All rights reserved.
//

import UIKit

class LifeManager: NSObject {
    var year: String?
    var title: String?
    var descriptionLife: String?
    var imageIcon: String?
    var newSkills: String?
    
    init(dictionary : NSDictionary) {
        super.init()

        self.year = dictionary.valueForKey("Year") as? String
        self.title = dictionary.valueForKey("Title") as? String
        self.descriptionLife = dictionary.valueForKey("Description") as? String
        self.imageIcon = dictionary.valueForKey("Icon") as? String
        self.newSkills = dictionary.valueForKey("newSkills") as? String
    }
}
