//
//  MovieFeedViewInput.swift
//  Movie
//
//  Created by Lucas Pelizza on 3/28/18.
//  Copyright © 2018 Lucas E Pelizza. All rights reserved.
//

protocol MovieFeedViewInput: UICommuncationProtocol {
    func didReceiveItems(items: [MovieCellViewModel])
    func displayLoadingProgress()
    func hideLoadingProgress()
}
