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
    
    var track: Track!
    var viewModel: TrackDetailsViewModelProtocol! {
        didSet {
            viewModel.viewModelDidChange = { [ weak self ] viewModel in
                self?.setStatusForFavoriteButton()
            }
            self.trackTitleLabel.text = viewModel.title
            self.imageCover.image = UIImage(named: viewModel.image)
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = TrackDetailsViewModel(track: track)
    }
    
    @IBAction func toggleFavorite(_ sender: UIButton) {
        viewModel.favoriteButtonPressed()
    }
    
    func setStatusForFavoriteButton() {
        favoriteButton.tintColor = viewModel.isFavorite ? .red : .gray
    }
    
}

