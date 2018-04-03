//
//  UIViewExtension.swift
//  Movie
//
//  Created by Lucas Pelizza on 3/30/18.
//  Copyright © 2018 Lucas E Pelizza. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    struct Constants {
        static let activityIndicatorTag: Int = 354
    }
    
    func displayActivityIndicator() {
        
        var fView =  viewWithTag(Constants.activityIndicatorTag) as? UIActivityIndicatorView
        if fView == nil  {
            let aiView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
            aiView.translatesAutoresizingMaskIntoConstraints = false
            aiView.hidesWhenStopped = true
            aiView.color = UIColor.darkText
            aiView.tag = Constants.activityIndicatorTag
            aiView.contentMode = .center
            addSubview(aiView)
            aiView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            aiView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            fView = aiView
        }
        
        fView?.superview?.bringSubview(toFront: fView!)
        fView?.isHidden = false
        fView?.startAnimating()
    }
    
    func hideActivityIndicator() {
        guard let fView =  viewWithTag(Constants.activityIndicatorTag) as? UIActivityIndicatorView else {
            return
        }
        fView.stopAnimating()
    }
}
