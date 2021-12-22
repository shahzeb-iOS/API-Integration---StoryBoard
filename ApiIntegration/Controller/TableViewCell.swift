//
//  TableViewCell.swift
//  ApiIntegration
//
//  Created by Shahzaib khan on 15/11/2021.
//  Copyright © 2021 Shahzaib khan. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var images:UIImageView!
    @IBOutlet weak var name:UILabel!
    @IBOutlet weak var id:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
