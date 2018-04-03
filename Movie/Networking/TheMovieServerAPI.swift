//
//  TheMovieServerAPI.swift
//  Movie
//
//  Created by Lucas Pelizza on 3/28/18.
//  Copyright © 2018 Lucas E Pelizza. All rights reserved.
//

import Foundation
import Moya



enum TheMovieServerAPI {
    case basicQuery
    case retrieve(Movie.ObjectIdType)
    
    static let endpointClosure = { (target: TheMovieServerAPI) -> Endpoint<TheMovieServerAPI> in
        let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)

        return defaultEndpoint
    }
}

//MARK: - TargetType
extension TheMovieServerAPI: TargetType {
    
    var headers: [String : String]? {
        return nil
    }
    
    var baseURL: URL {
        return URL(string: "https://api.themoviedb.org/3")!
        
    }
    
    var path: String {
        switch self {
        case .retrieve(let objectID):
            return "/movie/\(objectID.description)"
        case .basicQuery:
            return "/movie/top_rated"
        }
    }
    
    var method: Moya.Method  {
        return .get
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .basicQuery:
            return ["api_key" : ""]
        default:
            return nil
        }
        
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .basicQuery:
            return .requestParameters(parameters: parameters ?? [:], encoding: parameterEncoding)
        default:
            return .requestPlain
        }
    }
    
    var parameterEncoding: Moya.ParameterEncoding {
        return URLEncoding.default
    }
}
