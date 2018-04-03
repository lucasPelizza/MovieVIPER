//
//  UIComunicationProtocol.swift
//  Movie
//
//  Created by Lucas Pelizza on 3/30/18.
//  Copyright © 2018 Lucas E Pelizza. All rights reserved.
//

import Foundation
import Moya

protocol UICommuncationProtocol: class {
    func dismiss()
    func present(error: Swift.Error)
    func hideLoadingProgress()
    func displayLoadingProgress()
}

//MARK: - NetworkUICommuncationProtocol for UIViewController
extension UICommuncationProtocol  where Self: UIViewController {
    func present(error: Swift.Error) {
        var fError = error
        if let mError = error as? MoyaError {
            switch mError {
            case .underlying(let uError):
                fError = uError.0
                break
            default:
                break
            }
        }
        
        if fError.isNetworkIssue {
            present(title: "Error", message: NSLocalizedString("Can't access remote computer", comment: ""))
        }
        else {
            present(error: fError,animated: true, completion:nil)
        }
    }
    func dismiss() {
        _ = dismissIfPresented()
    }
}

