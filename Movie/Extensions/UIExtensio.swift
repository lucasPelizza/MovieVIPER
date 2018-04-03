//
//  UIExtensio.swift
//  Movie
//
//  Created by Lucas Pelizza on 3/29/18.
//  Copyright © 2018 Lucas E Pelizza. All rights reserved.
//

import UIKit

//MARK: - UIViewController
extension UIViewController {
    
    func present(error: Error, animated: Bool = true, completion:(() -> Void)? = nil)  {
        present(title: "Error", message: error.localizedDescription, animated: animated, completion: completion)
    }
    
    func present(title: String , message: String, animated: Bool = true, completion:(() -> Void)? = nil)  {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) {(_) in
            self.dismiss(animated: false, completion: nil)
        }
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func dismissIfPresented(animated: Bool = true, completion:(() -> Void)? = nil) -> Bool {
        if let pVC = presentingViewController {
            pVC.dismiss(animated: animated, completion: completion)
            return true
        }
        return false
    }
}

func displayActivityIndicator() {
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
    debugPrint(#function)
}

func hideActivityIndicator() {
    debugPrint(#function)
    UIApplication.shared.isNetworkActivityIndicatorVisible = false
}
