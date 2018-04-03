//
//  MovieFeedInteractor.swift
//  Movie
//
//  Created by Lucas Pelizza on 3/28/18.
//  Copyright © 2018 Lucas E Pelizza. All rights reserved.
//

import Foundation
import RxSwift
import RxOptional

final class MovieFeedInteractor {
    let network: NetworkProtocol
    init(network: NetworkProtocol) {
        self.network = network
    }
}

//MARK: - MovieFeedInteractorProtocol
extension MovieFeedInteractor: MovieFeedInteractorProtocol {
    func getAllMovies() -> Observable<MovieModel> {
        let result = network.accessAllMovies()
        
        return result.flatMap { (item) -> Observable<MovieModel> in
            
            let wrappers = item.results.map{ Observable<MovieModel>.just(MovieModel(identifier: $0.identifier, posterPath: $0.posterPath, isAdult: $0.isAdult, overview: $0.overview, title: $0.title, backdropPath: $0.backdropPath, popularity: $0.popularity)) }

            let result = Observable<MovieModel>.concat(wrappers)

            return result
        }
        
    }
}
