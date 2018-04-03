//
//  NetworkMovieProtocol.swift
//  Movie
//
//  Created by Lucas Pelizza on 3/29/18.
//  Copyright © 2018 Lucas E Pelizza. All rights reserved.
//

import Foundation
import RxSwift

protocol NetworkMovieProtocol  {
    typealias OptMovieArraySequence = Observable<Page<Movie>>
    typealias OptMovieSequence = Observable<Movie>
    
    func accessAllMovies() -> OptMovieArraySequence
    func accessMovie(movieType: Movie.ObjectIdType) -> OptMovieSequence
}
