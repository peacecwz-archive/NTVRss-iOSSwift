//
//  NewsPage.swift
//  NTVRss
//
//  Created by Rahman Ünver on 29/03/2017.
//  Copyright © 2017 RahoApp. All rights reserved.
//

import UIKit

class NewsPage: UIViewController
{
    @IBOutlet weak var webView: UIWebView!
    
    var newsUrl = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.loadRequest(URLRequest(url:NSURL(string: newsUrl) as! URL))
    }
}
