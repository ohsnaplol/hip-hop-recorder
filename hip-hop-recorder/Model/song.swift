//
//  song.swift
//  hip-hop-recorder
//
//  Created by Marcello Galvan on 7/19/18.
//  Copyright © 2018 Marcello Galvan. All rights reserved.
//

import Foundation
import AVFoundation

class Song {
    
    var title: String = ""
    var notes: String = ""
    var beatArtist: String = ""

    var beatTrackFile = AVAudioFile()
    let userVoice = AVAudioFormat()
    
    init() {
        let url: URL = Bundle.main.url(forResource: "21 Open Up (Instrumental) (Bonus)", withExtension: "mp3")!
        do {
            try setSong(url)
        } catch {
            print(error)
        }
        
    }
    
    func setSong(_ url: URL) throws  {
        beatTrackFile = try AVAudioFile(forReading: url)
    }
}


