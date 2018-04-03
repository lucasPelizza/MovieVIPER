//
//  MovieFeedInteractorProtocol.swift
//  Movie
//
//  Created by Lucas Pelizza on 3/28/18.
//  Copyright © 2018 Lucas E Pelizza. All rights reserved.
//

import Foundation
import RxSwift

protocol MovieFeedInteractorProtocol {
    func getAllMovies() -> Observable<MovieModel>
}
