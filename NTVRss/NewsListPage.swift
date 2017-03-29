//
//  NewsListPage.swift
//  NTVRss
//
//  Created by Rahman Ünver on 29/03/2017.
//  Copyright © 2017 RahoApp. All rights reserved.
//

import UIKit
import SWXMLHash

class NewsListPage: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }

    
    @IBOutlet weak var newsTable: UITableView!
    
    var rssURL = ""
    var categoryName = ""
    
    var news = [XMLIndexer]()
    
    var newsDetailUrl = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.newsTable.dataSource = self
        self.newsTable.delegate = self
        getNews()
    }
    
    func getNews(){
        let task = URLSession.shared.dataTask(with: URL(string: rssURL)!){ data,response, error in
            guard error == nil else{
                print(error!)
                return
            }
            
            let xml = SWXMLHash.parse(data!)
            self.news = xml["feed"]["entry"].all
            
            DispatchQueue.main.async {
                self.newsTable.reloadData();
            }
        }
        
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newsItemCell = newsTable.dequeueReusableCell(withIdentifier: "newsCell")! as! NewsCell
        
        newsItemCell.lblNews.text = self.news[indexPath.row]["title"].element?.text!
        
        return newsItemCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.newsDetailUrl = self.news[indexPath.row]["link"].element!.attribute(by: "href")!.text
        
        performSegue(withIdentifier: "gotonewsdetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "gotonewsdetail"){
            let newsDetail = segue.destination as! NewsPage
            newsDetail.newsUrl = newsDetailUrl
        }
    }
}
