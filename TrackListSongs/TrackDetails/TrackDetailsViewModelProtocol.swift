//
//  TrackDetailsViewModelProtocol.swift
//  TrackListSongs
//
//  Created by Larisa on 30.08.2021.
//


protocol TrackDetailsViewModelProtocol: AnyObject {
    var title: String { get }
    var image: String { get }
    var isFavorite: Bool { get }
    var viewModelDidChange: ((TrackDetailsViewModelProtocol) -> Void)? { get set }
    init(track: Track)
    func favoriteButtonPressed()
}

class TrackDetailsViewModel: TrackDetailsViewModelProtocol {
    
    var title: String {
        track.title
    }
    
    var image: String {
        track.title
    }
    
    var viewModelDidChange: ((TrackDetailsViewModelProtocol) -> Void)?
    
    var isFavorite: Bool {
        get {
            DataManager.shared.getFavoriteStatus(for: track.title)
        } set {
            DataManager.shared.setFavoriteStatus(for: track.title, with: newValue)
            viewModelDidChange?(self)
        }
    }
    
    private let track: Track
    
    required init(track: Track) {
        self.track = track
    }
    
    func favoriteButtonPressed() {
        isFavorite.toggle()
    }
}
