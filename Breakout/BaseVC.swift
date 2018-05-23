//
//  MainViewController.swift
//  Pairs
//
//  Created by Ran Weiner on 5/21/18.
//  Copyright © 2018 Ran Weiner. All rights reserved.
//

import UIKit
import WebKit

class BaseVC: UIViewController {
    var urlStr = "" {
        didSet {
            if let _url = URL(string: self.urlStr) {
                let request = URLRequest(url: _url)//, cachePolicy: .reloadRevalidatingCacheData)
            
                webView.load(request)
            }
        }
    }
    var webView: WKWebView!
    var indicator: UIActivityIndicatorView!
    let configuration = WKWebViewConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        UIApplication.shared.statusBarView?.backgroundColor = UIColor.init(red: 0xFC/0xFF,
//                                                                           green: 0x55/0xFF,
//                                                                           blue: 0x20/0xFF,
//                                                                           alpha: 1.0)
      
        self.setupWebView()
        self.setupIndicator()
        
        self.urlStr = "https://lbdapp.tk/dfstar/description.html"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupIndicator()
    {
        indicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        view.addSubview(indicator)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

extension BaseVC: WKNavigationDelegate, WKUIDelegate
{
    func setupWebView() {
        configuration.allowsInlineMediaPlayback = true
        webView = WKWebView(frame: CGRect.zero, configuration: configuration)
        
        webView.navigationDelegate = self
        
        webView.uiDelegate = self
        
        self.view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            webView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
            webView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        } else {
            // Fallback on earlier versions
            self.edgesForExtendedLayout = []
            webView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        }
        
      
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("didStartProvisionalNavigation")
        
        indicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("didCommit")
        
        //        activityIndicatorView.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("didFinish")
        
        indicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("didFail, error: \(error.localizedDescription)")
        
        //        activityIndicatorView.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print("didFailProvisionalNavigation, error: \(error.localizedDescription)")
        
        //        activityIndicatorView.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        print("didReceiveServerRedirectForProvisionalNavigation")
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        if let url = navigationResponse.response.url {
            print("decidePolicyFor navigationResponse response url: \(url.absoluteString)")
            
            if url.absoluteString.hasSuffix("close.html") {
                webView.isHidden = true
            }
        }
        
        decisionHandler(WKNavigationResponsePolicy.allow)
    }
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        if let url = navigationAction.request.url {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
        return nil
    }
    
}

extension UIApplication {
    var statusBarView: UIView? {
        if responds(to: Selector(("statusBar"))) {
            return value(forKey: "statusBar") as? UIView
        }
        return nil
    }
}


