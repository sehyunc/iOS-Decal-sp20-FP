//
//  MainScreenViewController.swift
//  finalproject
//
//  Created by Taroob on 5/2/20.
//  Copyright © 2020 T. All rights reserved.
//

import UIKit
import Spartan

class MainScreenViewController: UIViewController {
    
    let dj0 = SpotifyDJ()
    
    var currentDJ: SpotifyDJ?
    
    var labels = [UILabel?]()
    var tracks = [UILabel?]()
    
    var artists = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        Spartan.authorizationToken = "BQCtiDtDIHQnAILbb68Ppr7i1YN1g3uN6Nauxdlb3HlSKXqEsWskYs8JOSF6lATCUw1lc8Bjxj3IafttD5B5C7S5amLRiQOr-9yeDnRl9lEN2At4ke2I2isMa3D9OikPveNsbLxA666EgzXilGRE4hkdzeqMJnYHvBoToRGQJsR8GGd90qx9HSVmLQ"
//        currentDJ = dj0
//        currentDJ!.topArtists()
        labels = [artist1, artist2, artist3, artist4, artist5]
        tracks = [track1, track2, track3, track4, track5]
//        print(labels)
//        artists = currentDJ!.getArtists()
//        updateArtists(artists: currentDJ!.topArtists())
        topArtists()
        topTracks()
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
    
    func topArtists() {
        _ = Spartan.getMyTopArtists(limit: 10, offset: 0, timeRange: .shortTerm, success: { (pagingObject) in
            let artists = pagingObject.items
            for e in 0..<self.labels.count {
                if let label = self.labels[e] {
                    label.text = artists![e].name
                }
            }
        }, failure: { (error) in
            print(Spartan.authorizationToken)
            print(error)
        })
    }
    
    @IBOutlet var track1: UILabel!
    @IBOutlet var track2: UILabel!
    @IBOutlet var track3: UILabel!
    @IBOutlet var track4: UILabel!
    @IBOutlet var track5: UILabel!
    
    func topTracks() {
       _ = Spartan.getMyTopTracks(limit: 10, offset: 0, timeRange: .shortTerm, success: { (pagingObject) in
            let t = pagingObject.items
            for e in 0..<self.tracks.count {
                if let label = self.tracks[e] {
                    label.text = t![e].name
                }
            }
              }, failure: { (error) in
                  print(Spartan.authorizationToken)
                  print(error)
              })
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
