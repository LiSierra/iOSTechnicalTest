//
//  BaseViewController.swift
//  Test App iOS
//
//  Created by Julia Liliana Sierra Rojas on 4/12/21.
//

import Foundation
import UIKit

// MARK: - Base class for viewcontroller
class BaseViewController: UIViewController {
    
    // MARK: - Function for show loading view
    /// - parameter active:  A Bool for start or stop  show loading view
    func loadingView(_ actived: Bool) {
        let alert = UIAlertController(title: nil, message: Constant.loadingMessage, preferredStyle: .alert)

        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = .medium
        loadingIndicator.startAnimating();

        alert.view.addSubview(loadingIndicator)
        if actived {
           present(alert, animated: true, completion: nil)
        } else {
           dismiss(animated: false, completion: nil)
        }
    }
    
    // MARK: - Function for show message
    func showSimpleAlert() {
        let alert = UIAlertController(title: Constant.alertTitle, message: Constant.alertMessage,
                                      preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: Constant.alertButton, style: UIAlertAction.Style.default, handler: { _ in
                //Action
            }))
            self.present(alert, animated: true, completion: nil)
        }
}
