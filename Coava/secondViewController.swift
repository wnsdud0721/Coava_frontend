//
//  secondViewController.swift
//  Coava
//
//  Created by Junyoung_Hong on 2023/05/29.
//

import UIKit
import WebKit

class secondViewController: UIViewController {

    @IBOutlet var webViewGroup: UIView!
    
    private var webView: WKWebView!
    
    var search: String!
    var url: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let preferences = WKPreferences()
        preferences.javaScriptCanOpenWindowsAutomatically = true
        
        let preference = WKWebpagePreferences()
        preference.allowsContentJavaScript = true
                
        let contentController = WKUserContentController()
        contentController.add(self, name: "bridge")
                
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        configuration.userContentController = contentController
                
        webView = WKWebView(frame: self.view.bounds, configuration: configuration)
                
        var components = URLComponents(string: url)!
        components.queryItems = [ URLQueryItem(name: "query", value: search) ]
                
        let request = URLRequest(url: components.url!)
        
        webView.uiDelegate = self
        webView.navigationDelegate = self
        webViewGroup.addSubview(webView)
        setAutoLayout(from: webView, to: webViewGroup)
        webView.load(request)
                
        webView.alpha = 0
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
            self.webView.alpha = 1
        }) { _ in
                    
        }
    }
    
    public func setAutoLayout(from: UIView, to: UIView) {
            
            from.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.init(item: from, attribute: .leading, relatedBy: .equal, toItem: to, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
            NSLayoutConstraint.init(item: from, attribute: .trailing, relatedBy: .equal, toItem: to, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
            NSLayoutConstraint.init(item: from, attribute: .top, relatedBy: .equal, toItem: to, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
            NSLayoutConstraint.init(item: from, attribute: .bottom, relatedBy: .equal, toItem: to, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
            view.layoutIfNeeded()
        }
    
}

extension secondViewController: WKNavigationDelegate {
    
    public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        print("\(navigationAction.request.url?.absoluteString ?? "")" )
        
        decisionHandler(.allow)
    }
}

extension secondViewController: WKUIDelegate {
    
    public func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        
    }
}

extension secondViewController: WKScriptMessageHandler {
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
        print(message.name)
    }
}
