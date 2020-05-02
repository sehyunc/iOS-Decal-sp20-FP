//
//  TableViewCell.swift
//  finalproject
//
//  Created by Taroob on 5/1/20.
//  Copyright © 2020 T. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!

    @IBOutlet var imageText: UIButton!
    
    @IBAction func imageButton(_ sender: UIButton) {
        if sender.tag == 0 {
            //configure recommendations here
        } else if sender.tag == 1 {
            //recommedations
        } else if sender.tag == 2 {
            //recommedations
        } else if sender.tag == 3 {
            //recommedations
        } else if sender.tag == 4 {
            //recommedations
        } else if sender.tag == 5 {
            //recommedations
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

