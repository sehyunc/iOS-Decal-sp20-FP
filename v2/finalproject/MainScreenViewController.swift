//
//  MainScreenViewController.swift
//  finalproject
//
//  Created by Taroob on 5/2/20.
//  Copyright © 2020 T. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    let dj0 = SpotifyDJ()
    
    var currentDJ: SpotifyDJ?
    
    var labels = [UILabel?]()
    
    var artists = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        currentDJ = dj0
        currentDJ!.topArtists()
        labels = [artist1, artist2, artist3, artist4, artist5]
//        artists = currentDJ!.getArtists()
//        updateArtists(artists: artists)
    }
    
    @IBAction func goToMoods(_ sender: UIButton) {
        performSegue(withIdentifier: "toMood", sender: sender)
    }
    
    @IBAction func goToStats(_ sender: UIButton) {
        performSegue(withIdentifier: "toTopArtists", sender: sender)
    }
    
    @IBAction func viewSongs(_ sender: Any) {
        performSegue(withIdentifier: "toTopSongs", sender: sender)
    }
    

    @IBAction func viewSuggested(_ sender: Any) {
        performSegue(withIdentifier: "toPlaylists", sender: sender)
    }
    
    
    @IBAction func backToHome(_ sender: Any) {
        performSegue(withIdentifier: "goHome", sender: sender)
    }
    
    @IBOutlet var artist1: UILabel!
    
    @IBOutlet var artist2: UILabel!
    
    @IBOutlet var artist3: UILabel!
    
    @IBOutlet var artist4: UILabel!
    
    @IBOutlet var artist5: UILabel!
    
    func updateArtists(artists: [String]) {
        for e in 0..<self.labels.count {
            if let label = self.labels[e] {
                label.text = artists[e]
            }
//            self.labels[e].text = artists[e]
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
