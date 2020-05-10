//
//  Store.swift
//  Local Media
//
//  Created by Robert Sandru on 5/10/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import UIKit

class Store: ObservableObject {
    
    @Published var tracks: [Track] = []
    
    init() {
        loadTracks()
    }
}

extension Store {
    
    func loadTracks() {
        print("Loading")
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let track1 = Track(context: context)
        track1.artist = "2Pac"
        track1.title = "Lil' Homies"
        track1.artwork = UIImage(named: "MockPac")?.pngData()
        
        let track2 = Track(context: context)
        track2.artist = "Johnny Cash"
        track2.title = "One"
        track2.artwork = UIImage(named: "MockJohnnyCash")?.pngData()
        
        let track3 = Track(context: context)
        track3.artist = "Metallica"
        track3.title = "The Day that Never Comes (remix)"
        
        let track4 = Track(context: context)
        track4.artist = "Manu Chao"
        track4.title = "Bongo Bong"
        track4.artwork = UIImage(named: "MockManuChao")?.pngData()
        
        let track5 = Track(context: context)
        track5.artist = "James Brown"
        track5.title = "Sex Machine"
        
        tracks.append(contentsOf: [track1, track2, track3, track4, track5])
    }
    
    func loadTracks(from urls: [URL]) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        for url in urls {
            if FileManager.default.fileExists(atPath: url.path) {
                let track = Track(context: context)
                track.fileName = url.lastPathComponent
                track.filePath = url.path
                tracks.append(track)
            }
        }
    }
    
    func loadTracks(from path: String) {
        
    }
}
