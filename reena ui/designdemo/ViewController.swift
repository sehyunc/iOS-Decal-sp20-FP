//
//  ViewController.swift
//  designdemo
//
//  Created by Reena Yuan on 4/17/20.
//  Copyright © 2020 Reena Yuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
   
    
    @IBOutlet weak var artistTableVIew: UITableView!
    
    @IBOutlet weak var letsBeginButton: UIButton!

    @IBAction func letsBeginPressed(_ sender: UIButton) {
        //perform segue
    }
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        letsBeginButton.layer.borderColor = UIColor.white.cgColor
        letsBeginButton.layer.cornerRadius = 15
        letsBeginButton.layer.borderWidth = 8
        artistTableVIew.dataSource = self
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           <#code#>
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           //index is the row number, probably necessary for which artist to display, gett information from an array possibly
           let index = indexPath.row
           if let cell = tableView.dequeueReusableCell(withIdentifier: "artistCell") as? TableViewCell {
               cell.artistName.text = // insert image here
               cell.artistImage.image = // insert artist name here
               return cell
           } else {
               return UITableViewCell()
           }
       }


}

