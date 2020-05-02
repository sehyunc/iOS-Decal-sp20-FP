//
//  SpotifyDJ.swift
//  SpotifyDJ
//
//  Created by Sehyun Chung on 5/2/20.
//  Copyright © 2020 Sehyun Chung. All rights reserved.
//

import Foundation
import Spartan

class SpotifyDJ {
    init() {
        //get new authtoken from:
        //https://developer.spotify.com/console/get-current-user-top-artists-and-tracks/
        Spartan.authorizationToken = "BQC2ttZVFvvryvBkoaKMOigN0CZiIq2zZzW-vDXU9qrVdF-FoQ06uj92e7yl0SDKsU0-NUL454prpwXerR456o7_ztkO8yQzPod8qLNy3Y1ZVS0NnACXaIb_r4Gh-kJywjK22-e78GraB_bIaZFKrpWXiPNHHXuvokZ5xoTrLnPfXvLZLXZc2Svwhw"
    }
    var trackDict = [String: String]()
    var artists = [String]()

    func topArtists() {
        _ = Spartan.getMyTopArtists(limit: 10, offset: 0, timeRange: .shortTerm, success: { (pagingObject) in
            self.saveArtists(artists: pagingObject.items)
        }, failure: { (error) in
            print(Spartan.authorizationToken)
            print(error)
        })
    }
    
    func saveArtists(artists: [Artist]) {
        for e in artists {
            self.artists.append(e.name)
        }
    }
    
    func saveTracks(tracks: [Track]) {
        for e in tracks {
            self.trackDict[e.name] = e.album.name
        }
    }
    
    func topTracks() {
       _ = Spartan.getMyTopTracks(limit: 10, offset: 0, timeRange: .shortTerm, success: { (pagingObject) in
                self.saveTracks(tracks: pagingObject.items)
              }, failure: { (error) in
                  print(Spartan.authorizationToken)
                  print(error)
              })
    }

}
