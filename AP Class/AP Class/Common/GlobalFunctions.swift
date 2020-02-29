//
//  GlobalFunctions.swift
//  AP Class
//
//  Created by Arun Amuri on 23/02/2020.
//  Copyright © 2020 Arun Amuri. All rights reserved.
//

import Foundation
import UIKit

let lightBlue = UIColor(red: 151/255.0, green: 201/255.0, blue: 245/255.0, alpha: 1.0)
let midLightBlue = UIColor(red: 113/255.0, green: 161/255.0, blue: 247/255.0, alpha: 1.0)
let midDarkBlue = UIColor(red: 79/255.0, green: 138/255.0, blue: 240/255.0, alpha: 1.0)
let darkBlue = UIColor(red: 65/255.0, green: 102/255.0, blue: 236/255.0, alpha: 1.0)
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
        let keyWindow = getKeyWindow() else { return }
    keyWindow.rootViewController = vc
}
func getKeyWindow() -> UIWindow? {
    UIApplication.shared.connectedScenes
        .filter({$0.activationState == .foregroundActive})
        .map({$0 as? UIWindowScene})
        .compactMap({$0})
        .first?.windows
        .filter({$0.isKeyWindow}).first
}
 
