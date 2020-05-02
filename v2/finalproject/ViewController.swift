//
//  ViewController.swift
//  finalproject
//
//  Created by Taroob on 5/1/20.
//  Copyright © 2020 T. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let moods = ["Happy", "Sad", "Excited", "Chill", "Party", "Focus"]
    let moodImages = ["☀️", "🌧", "🌟", "🌙", "🔥", "🕯"]
    
    private func registerCell() {
        let cell = UINib(nibName: "TableViewCell",
                            bundle: nil)
        self.tableView.register(cell,
                            forCellReuseIdentifier: "CustomCell")
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as? TableViewCell else {
            return UITableViewCell()
        }
        
        cell.label.text = moods[indexPath.row]
        cell.imageText.tag = indexPath.row
        cell.imageText.setTitle(moodImages[indexPath.row], for: .normal)
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCell()
        // Do any additional setup after loading the view.
    }


}

