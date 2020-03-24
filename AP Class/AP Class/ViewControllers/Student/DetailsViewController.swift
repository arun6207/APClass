//
//  DetailsViewController.swift
//  AP Class
//
//  Created by Arun Amuri on 24/03/2020.
//  Copyright © 2020 Arun Amuri. All rights reserved.
//

import UIKit
import WebKit
class DetailsViewController: UIViewController {

    @IBOutlet weak var largeActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var detailsWebView: WKWebView!
    var webUrlString: String?
    var selectedItemName: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = selectedItemName
        detailsWebView.navigationDelegate = self
        if let urlString = webUrlString, let url = URL(string: urlString) {
            detailsWebView.load(URLRequest(url:url))
        }
    }

}

extension DetailsViewController: WKNavigationDelegate {
    // 2. Start loading web address
    func webView(_ webView: WKWebView,
                 didStartProvisionalNavigation navigation: WKNavigation!) {
        print("start load:\(String(describing: webView.url))")
        largeActivityIndicator.startAnimating()
    }
    
    // 3. Fail while loading with an error
    func webView(_ webView: WKWebView,
                 didFail navigation: WKNavigation!,
                 withError error: Error) {
        print("fail with error: \(error.localizedDescription)")
    }
    
    // 4. WKWebView finish loading
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("finish loading")
        largeActivityIndicator.stopAnimating()
    }
    
}
