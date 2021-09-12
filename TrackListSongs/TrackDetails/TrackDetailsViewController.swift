//
//  ViewController.swift
//  TrackListSongs
//
//  Created by Larisa on 29.08.2021.
//

import UIKit

class TrackDetailsViewController: UIViewController {
    
    @IBOutlet private weak var imageCover: UIImageView!
    @IBOutlet private weak var trackTitleLabel: UILabel!
    @IBOutlet private weak var favoriteButton: UIButton!
    
    var viewModel: TrackDetailsViewModelProtocol! 
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func toggleFavorite(_ sender: UIButton) {
        viewModel.favoriteButtonPressed()
    }
    
    func setStatusForFavoriteButton() {
        favoriteButton.tintColor = viewModel.isFavorite ? .red : .gray
    }
    
}

