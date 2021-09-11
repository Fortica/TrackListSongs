//
//  TrackListViewModel.swift
//  TrackListSongs
//
//  Created by Larisa on 11.09.2021.
//

import Foundation

protocol TrackListViewModelProtocol: AnyObject {
    var tracks: [Track] { get }
    func additionTracks(completion: @escaping() -> Void)
    func numberOfRows() -> Int
    func cellViewModel(at indexPath: IndexPath) -> TrackCellViewModelProtocol
//    func detailsViewModel(at indexPath: IndexPath) -> TrackDetailsViewModelProtocol
}

class TrackListViewModel: TrackListViewModelProtocol {
    
    var tracks: [Track] = []
    
    func additionTracks(completion: @escaping() -> Void) {
        self.tracks = Track.getTrackList()
        completion()
    }
    
    func numberOfRows() -> Int {
        tracks.count
    }
    
    
    func cellViewModel(at indexPath: IndexPath) -> TrackCellViewModelProtocol {
        let track = tracks[indexPath.row]
        return TrackCellViewModel(track: track)
    }
    
//    func detailsViewModel(at indexPath: IndexPath) -> TrackDetailsViewModelProtocol {
//        let track = tracks[indexPath.row]
//        return TrackDetailsViewModel(track: track)
//    }
}
