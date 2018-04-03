//
//  ErrorExtension.swift
//  Movie
//
//  Created by Lucas Pelizza on 3/30/18.
//  Copyright © 2018 Lucas E Pelizza. All rights reserved.
//

import Foundation

//MARK: - Error
extension Error {
    var isNetworkIssue: Bool {
        let nsError = self as NSError
        return nsError.isNetworkIssue
    }
}

//MARK: - NSError
extension NSError {
    var isNetworkIssue: Bool {
        get {
            return domain == (NSErrorDomain() as String) &&
                (code == NSURLErrorCannotFindHost ||
                    code == NSURLErrorCannotConnectToHost ||
                    code == NSURLErrorNotConnectedToInternet)
        }
    }
}
