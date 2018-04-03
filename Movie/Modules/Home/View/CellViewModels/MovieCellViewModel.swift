//
//  MovieCellViewModel.swift
//  Movie
//
//  Created by Lucas Pelizza on 3/28/18.
//  Copyright © 2018 Lucas E Pelizza. All rights reserved.
//

import Foundation

public class MovieCellViewModel {
    
    let identifier: Int
    let title: String
    
    init(identifier: Int, title: String) {
        self.identifier = identifier
        self.title = title
    }
}
