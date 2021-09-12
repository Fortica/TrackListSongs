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
    @IBOutlet weak var favoriteButton: UIButton!
    
    var viewModel: TrackDetailsViewModelProtocol! 
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func toggleFavorite(_ sender: UIButton) {
        viewModel.favoriteButtonPressed()
    }
    
    private func setupUI() {
        setStatusForFavoriteButton()
        viewModel.viewModelDidChange = { [weak self] viewModel in
            self?.setStatusForFavoriteButton()
        }
        trackTitleLabel.text = viewModel.title
        imageCover.image = UIImage(named: viewModel.title)
    }
    
    func setStatusForFavoriteButton() {
        favoriteButton.tintColor = viewModel.isFavorite ? .red : .gray
    }

}

