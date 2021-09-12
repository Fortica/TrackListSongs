//
//  TrackCellTableView.swift
//  TrackListSongs
//
//  Created by Larisa on 11.09.2021.
//

import UIKit

class TrackTableViewCell: UITableViewCell {
    
    //var rowHeightCell: CGFloat!
    
    var viewModel: TrackCellViewModelProtocol! {
        didSet {
            var content = defaultContentConfiguration()
            content.text = viewModel.nameSong
            content.secondaryText = viewModel.artist
            content.image = UIImage(named: viewModel.image)
            content.imageProperties.cornerRadius = 100 / 2
            contentConfiguration = content
        }
    }

}
