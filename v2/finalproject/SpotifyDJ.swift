//
//  SpotifyDJ.swift
//  finalproject
//
//  Created by Sehyun Chung on 5/2/20.
//  Copyright © 2020 T. All rights reserved.
//

import Foundation
import Spartan

class SpotifyDJ {
    init() {
        //get new authtoken from:
        //https://developer.spotify.com/console/get-current-user-top-artists-and-tracks/
        Spartan.authorizationToken = "BQD5B_2ZA2YBZZ0Yk4dKCyvXijiKX3o2s2UvnxFWKtzdWb8VN1pyxYx-3bU11M0pMIcoYPadg6aZdVZJ5qcLo4elWLs_bxquM6PoLWrE39aAgNCPEww_Udl-uJZGl9fDxnVuDgl2VvR1fOdBuPrBXFXaXmDIPFVto-mQuPHwLL-LpGIehk5XE5tFqw"
    }
    
    public var trackDict = [String: String]()
    public var artists = [String]()
    


    func topArtists() -> [String] {
        var t = [String]()
        _ = Spartan.getMyTopArtists(limit: 10, offset: 0, timeRange: .shortTerm, success: { (pagingObject) in
            t = self.saveArtists(artists: pagingObject.items)
        }, failure: { (error) in
            print(Spartan.authorizationToken)
            print(error)
        })
        return t
    }
    
    func saveArtists(artists: [Artist]) -> [String] {
        var names = [String]()
        for e in artists {
            names.append(e.name)
        }
        print(names)
        return names
    }
    
    func getArtists() -> [String] {
        print("INSIDEE GETARTISTS")
        print(self.artists)
        for e in self.artists {
            print(e)
        }
        return artists
    }
    
    func saveTracks(tracks: [Track]) {
        for e in tracks {
            self.trackDict[e.name!] = e.album.name!
        }
    }
    
    func topTracks() {
       _ = Spartan.getMyTopTracks(limit: 10, offset: 0, timeRange: .shortTerm, success: { (pagingObject) in
                self.saveTracks(tracks: pagingObject.items)
//        for e in self.trackDict.keys {
//            print(e)
//        }
              }, failure: { (error) in
                  print(Spartan.authorizationToken)
                  print(error)
              })
    }

}
