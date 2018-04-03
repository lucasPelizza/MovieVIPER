//
//  MovieModel.swift
//  Movie
//
//  Created by Lucas Pelizza on 3/29/18.
//  Copyright © 2018 Lucas E Pelizza. All rights reserved.
//

struct MovieModel {
    let identifier: Movie.ObjectIdType
    let posterPath: String
    let isAdult: Bool
    let overview: String
    let title: String
    let backdropPath: String
    let popularity: Float
    
    init(identifier: Movie.ObjectIdType, posterPath: String, isAdult: Bool, overview: String, title: String, backdropPath: String, popularity: Float) {
        self.identifier = identifier
        self.posterPath = posterPath
        self.isAdult = isAdult
        self.overview = overview
        self.title = title
        self.backdropPath = backdropPath
        self.popularity = popularity
    }
}
