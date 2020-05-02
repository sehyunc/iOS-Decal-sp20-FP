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
        Spartan.authorizationToken = "BQAJ2goMS5YkPA-7ngl2xGFgK3qDld_raknAG5VJG1fapmlhdNhuZvuIo4xTYShSF8PFyYHjoTrykgmwFfHYLQ-XbRNfd4H4M5x__xNeb_PV65l9UjFejUGzDRtquewn-ix3r2WqWdlPo5BEN9SmUfmhjcRa-mXwQkVAq8W-prsakWlYa4dTIG2WAw"
    }
    public static var loggingEnabled: Bool = true

    func topArtists() {
        
        _ = Spartan.getMyTopArtists(limit: 10, offset: 0, timeRange: .shortTerm, success: { (pagingObject) in
            var artists = pagingObject.items
            for e in artists! {
                print(e.name!)
            }
        }, failure: { (error) in
            print(Spartan.authorizationToken)
            print(error)
        })
    }
    
    func topTracks() {
        var trackDict = [String: String]()
        var tracks = [Track]()
        
        _ = Spartan.getMyTopTracks(limit: 10, offset: 0, timeRange: .shortTerm, success: { (pagingObject) in
            tracks = pagingObject.items

        }, failure: { (error) in
            print(Spartan.authorizationToken)
            print(error)
        })
        print("OUTSIDE CLOSURE")
        print(tracks)
        for e in tracks {
            print(e)
        }
        return
    }

}
