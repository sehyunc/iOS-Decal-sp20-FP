//
//  TableViewCell.swift
//  designdemo
//
//  Created by Reena Yuan on 5/1/20.
//  Copyright © 2020 Reena Yuan. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    //table view cell for artists only, need to make another table view class for other views, such as albums or something

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var artistImage: UIImageView!
    
    @IBOutlet weak var artistName: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
