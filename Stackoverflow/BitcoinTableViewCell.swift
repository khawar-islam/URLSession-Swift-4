//
//  BitcoinTableViewCell.swift
//  Stackoverflow
//
//  Created by MacBook Pro on 30/12/2017.
//  Copyright © 2017 MacBook Pro. All rights reserved.
//

import UIKit

class BitcoinTableViewCell: UITableViewCell {

    @IBOutlet weak var labelSymbol: UILabel!
    @IBOutlet weak var labPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
