//
//  CustomCellTableViewCell.swift
//  SampleJSONForPresentation
//
//  Created by MacStudent on 2019-03-18.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class CustomCellTableViewCell: UITableViewCell {

    @IBOutlet weak var titleText: UITextView!
    
    @IBOutlet weak var descText: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
