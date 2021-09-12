//
//  TrackCellViewModel.swift
//  TrackListSongs
//
//  Created by Larisa on 11.09.2021.
//

import Foundation

protocol TrackCellViewModelProtocol: AnyObject {
    var nameSong: String { get }
    var artist: String { get }
    var image: String { get }
    
    init(track: Track)
}

class TrackCellViewModel: TrackCellViewModelProtocol {
    var nameSong: String {
        track.song
    }
    
    var artist: String {
        track.artist
    }
    
    var image: String {
        track.title
    }
    
    private let track: Track
    
    required init(track: Track) {
        self.track = track
    }
}
