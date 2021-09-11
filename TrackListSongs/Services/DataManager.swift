//
//  DataManager.swift
//  TrackListSongs
//
//  Created by Larisa on 30.08.2021.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    private let userDefaults = UserDefaults()
    
    private init() {}
    
    func setFavoriteStatus(for title: String, with status: Bool) {
        userDefaults.set(status, forKey: title)
    }
    
    func getFavoriteStatus(for title: String) -> Bool {
        userDefaults.bool(forKey: title)
    }
}
