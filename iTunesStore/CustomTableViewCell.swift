//
//  CustomTableViewCell.swift
//  iTunesStore
//
//  Created by David Pedrosa on 10/06/14.
//  Copyright (c) 2014 David Pedrosa Bataller. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet var appName : UILabel
    @IBOutlet var appDescription : UILabel
    @IBOutlet var artistImage : UIImageView
    
    init(style: UITableViewCellStyle, reuseIdentifier: String) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Initialization code
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
