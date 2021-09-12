//
//  TrackTableViewController.swift
//  TrackListSongs
//
//  Created by Larisa on 11.09.2021.
//

import UIKit

class TrackTableViewController: UITableViewController {

    private var viewModel: TrackListViewModelProtocol! {
        didSet {
            viewModel.additionTracks {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = TrackListViewModel()
        tableView.rowHeight = 80
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! TrackDetailsViewController
        detailVC.viewModel = sender as? TrackDetailsViewModelProtocol
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows()

    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "trackCell", for: indexPath) as! TrackTableViewCell
        cell.viewModel = viewModel.cellViewModel(at: indexPath)
        
        return cell
    }

    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            let detailsViewModel = viewModel.detailsViewModel(at: indexPath)
            performSegue(withIdentifier: "showDetails", sender: detailsViewModel)
    }
}
