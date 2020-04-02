//
//  WebViewController2.swift
//  LocalStoragePOC
//
//  Created by Ashish Rathore on 02/04/20.
//  Copyright © 2020 Microsoft. All rights reserved.
//

import UIKit
import WebKit

class WebViewController2: UIViewController {
    
    struct Constants {
//        static let url = "https://www.google.com/"
//        static let url = "https://images.google.com/"
        static let url = "https://www.github.com/"
    }
    
    var webView: WKWebView!
    let configuration = WKWebViewConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .done, target: self, action: #selector(done))
        
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
    
    @objc func done() {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension WebViewController2: WKUIDelegate {
    
}

extension WebViewController2: WKNavigationDelegate {
    
}
