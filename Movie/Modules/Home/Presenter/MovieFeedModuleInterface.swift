//
//  MovieFeedModuleInterface.swift
//  Movie
//
//  Created by Lucas Pelizza on 3/28/18.
//  Copyright © 2018 Lucas E Pelizza. All rights reserved.
//

import Foundation
import RxSwift

protocol MovieFeedModuleInterface: class {
    func displayMovies()
    func didSelectItemAtIndex(index: Int)
    func setVC(vc: MovieFeedViewInput)
    var itemsSequence: Observable<[MovieCellViewModel]> {get}
}
