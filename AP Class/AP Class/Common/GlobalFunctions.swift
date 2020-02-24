//
//  GlobalFunctions.swift
//  AP Class
//
//  Created by Arun Amuri on 23/02/2020.
//  Copyright © 2020 Arun Amuri. All rights reserved.
//

import Foundation
import UIKit

func instantiateViewController<T>(named viewControllerName: String, fromStoryboard storyboardName: String, withType: T.Type) -> T? {
    return UIStoryboard(
        name: storyboardName,
        bundle: Bundle.main).instantiateViewController(withIdentifier: viewControllerName) as? T
}

func showErrorAlert(message: String, viewController: UIViewController) {
    let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
    
    alertController.addAction(okAction)
    viewController.present(alertController, animated: true, completion: nil)
    
}

func initiateStoryBoard(name: String) {
    let storyBoard = UIStoryboard(name: name, bundle: nil)
    guard
        let vc = storyBoard.instantiateInitialViewController(),
        let keyWindow = UIApplication.shared.connectedScenes
                        .filter({$0.activationState == .foregroundActive})
                        .map({$0 as? UIWindowScene})
                        .compactMap({$0})
                        .first?.windows
                        .filter({$0.isKeyWindow}).first else { return }
    keyWindow.rootViewController = vc
}
