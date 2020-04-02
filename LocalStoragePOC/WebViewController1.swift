//
//  WebViewController1.swift
//  LocalStoragePOC
//
//  Created by Ashish Rathore on 02/04/20.
//  Copyright © 2020 Microsoft. All rights reserved.
//

import UIKit
import WebKit

class WebViewController1: UIViewController {
    
    struct Constants {
        static let url = "https://www.google.com/"
    }
    
    var webView: WKWebView!
    let configuration = WKWebViewConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Present", style: .plain, target: self, action: #selector(presentWebViewController))
        
        configuration.processPool = WKProcessPoolManager.shared.sharedProcessPool
        
        webView = WKWebView(frame: .zero, configuration: configuration)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        webView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        webView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        loadPage()
    }
    
    @objc func loadPage() {
        guard let url = URL(string: Constants.url) else {
            return
        }
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    @objc func presentWebViewController() {
        let viewController = WebViewController2()
        let navController = UINavigationController(rootViewController: viewController)
        self.present(navController, animated: true, completion: nil)
    }
    
}

extension WebViewController1: WKUIDelegate {
    
}

extension WebViewController1: WKNavigationDelegate {
    
}
