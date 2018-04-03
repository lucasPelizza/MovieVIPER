//
//  NetworkManager.swift
//  Movie
//
//  Created by Lucas Pelizza on 3/29/18.
//  Copyright © 2018 Lucas E Pelizza. All rights reserved.
//

import Foundation
import Moya
import Moya_ModelMapper
import RxOptional
import RxSwift
import Mapper

final class NetworkManager {
    let provider = MoyaProvider<TheMovieServerAPI>(endpointClosure: TheMovieServerAPI.endpointClosure)
}

//MARK: - NetworkMovieProtocol's implementation
extension NetworkManager: NetworkMovieProtocol {
    internal func accessMovie(movieType: Movie.ObjectIdType) -> NetworkProtocol.OptMovieSequence {
        return  provider.rx.request(TheMovieServerAPI.retrieve(movieType))
            .asObservable()
            .map(to: Movie.self)
            .share()
    }
    
    func accessAllMovies() -> NetworkProtocol.OptMovieArraySequence {
        return  provider.rx.request(TheMovieServerAPI.basicQuery)
            .asObservable()
            .map(to: Page.self)
            .share()
    }
}

//MARK: - NetworkProtocol
extension NetworkManager: NetworkProtocol {}

