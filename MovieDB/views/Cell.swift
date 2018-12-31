//
//  Cell.swift
//  MovieDB
//
//  Created by Carlos on 12/29/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {

    @IBOutlet weak var actor: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
