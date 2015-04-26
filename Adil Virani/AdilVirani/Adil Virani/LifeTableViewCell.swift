//
//  LifeTableViewCell.swift
//  Adil Virani
//
//  Created by Adil  Virani on 4/24/15.
//  Copyright (c) 2015 Adil  Virani. All rights reserved.
//

import UIKit

class LifeTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionLife: UILabel!
    @IBOutlet weak var labelButton: UILabel!
    @IBOutlet weak var viewButton: UIView!
    @IBOutlet weak var arrowDown: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}