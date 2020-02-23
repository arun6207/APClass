//
//  BookShelfViewController.swift
//  AP Class
//
//  Created by Arun Amuri on 23/02/2020.
//  Copyright © 2020 Arun Amuri. All rights reserved.
//

import UIKit
import WebKit

class BookShelfViewController: UIViewController {

    @IBOutlet weak var largeActivityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var bookshelfWebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Bookshelf"
        bookshelfWebView.navigationDelegate = self
        if let url = URL(string: "https://bookshelf.vitalsource.com") {
             bookshelfWebView.load(URLRequest(url:url))
        }
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension BookShelfViewController: WKNavigationDelegate {
    // 1. Decides whether to allow or cancel a navigation.
//    public func webView(_ webView: WKWebView,
//                        decidePolicyFor navigationAction: WKNavigationAction,
//                        decisionHandler: @escaping (WKNavigationActionPolicy) -> Swift.Void) {
//        
//        print("navigationAction load:\(String(describing: navigationAction.request.url))")
//        
//    }
    
    // 2. Start loading web address
    func webView(_ webView: WKWebView,
                 didStartProvisionalNavigation navigation: WKNavigation!) {
        print("start load:\(String(describing: webView.url))")
        largeActivityIndicatorView.startAnimating()
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
        largeActivityIndicatorView.stopAnimating()
    }
    
}
