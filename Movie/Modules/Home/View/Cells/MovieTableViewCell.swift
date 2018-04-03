//
//  MovieTableViewCell.swift
//  Movie
//
//  Created by Lucas Pelizza on 3/28/18.
//  Copyright © 2018 Lucas E Pelizza. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    static let identifier = "MovieTableViewCell"
    
    @IBOutlet weak var lblTitle: UILabel!
    
    var viewModel: MovieCellViewModel?
    {
        didSet {
            bindViewModel()
        }
    }
    
    func configure(viewModel: MovieCellViewModel) {
        self.viewModel = viewModel
    }
    
    private func bindViewModel() {
        guard let viewModel = viewModel else { return }
        lblTitle.text = viewModel.title
        //TODO: link the label with the property of the viewModel
    }
}
