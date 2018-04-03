//
//  Page.swift
//  Movie
//
//  Created by Lucas Pelizza on 4/3/18.
//  Copyright © 2018 Lucas E Pelizza. All rights reserved.
//

import Mapper

struct Page<T>: Mappable where T:Mappable {
    let page: Int
    let totalResults: Float
    let totalPages: Int
    let results: [T]
    
    init(map: Mapper) throws {
        try page = map.from("page")
        try totalResults = map.from("total_results")
        try totalPages = map.from("total_pages")
        try results = map.from("results")
    }
}
