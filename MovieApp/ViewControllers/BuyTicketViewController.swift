//
//  BuyTicketViewController.swift
//  MovieApp
//
//  Created by Ipsi Patro on 17/03/2018.
//  Copyright © 2018 Ipsi Patro. All rights reserved.
//
import UIKit
import WebKit


class BuyTicketViewController : UIViewController,WKNavigationDelegate{
    
    @IBOutlet weak var webview: WKWebView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var movie:Movie?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.hidesWhenStopped = true
        webview.navigationDelegate = self
        if let movie = self.movie, let ticketURL = movie.ticket_url {
            if let url = URL(string: ticketURL) {
                let request = URLRequest(url: url)
                webview.load(request)
            }

        }
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // MARK: - WKNavigationDelegate
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activityIndicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
    // MARK: - Navigation
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)

    }
    
}
