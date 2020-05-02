//
//  SpotifyDJViewController.swift
//  finalproject
//
//  Created by Sehyun Chung on 5/2/20.
//  Copyright © 2020 T. All rights reserved.
//

import UIKit

class SpotifyDJViewController: UIViewController {
    
    let dj0 = SpotifyDJ()
    
    var currentDJ: SpotifyDJ?
    
    override func viewDidLoad() {
        currentDJ = dj0
        currentDJ?.topArtists()
        currentDJ?.topTracks()
    }
    
}
