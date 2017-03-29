//
//  ViewController.swift
//  NTVRss
//
//  Created by Rahman Ünver on 29/03/2017.
//  Copyright © 2017 RahoApp. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var categoryTable: UITableView!
    
    var categories = ["Gündem","Türkiye","Dünya","Ekonomi", "Spor","Yaşam","Sağlık","Teknoloji","Emlak","Sanat","Otomobil","Eğitim"]
    var categoryURLs = ["http://www.ntv.com.tr/gundem.rss","http://www.ntv.com.tr/turkiye.rss","http://www.ntv.com.tr/dunya.rss","http://www.ntv.com.tr/ekonomi.rss","http://www.ntv.com.tr/spor.rss","http://www.ntv.com.tr/yasam.rss","http://www.ntv.com.tr/saglik.rss","http://www.ntv.com.tr/teknoloji.rss","http://www.ntv.com.tr/emlak.rss","http://www.ntv.com.tr/sanat.rss","http://www.ntv.com.tr/otomobil.rss","http://www.ntv.com.tr/egitim.rss"]
    
    var categoryUrl = ""
    var categoryName = ""
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categories.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.categoryName = String(self.categories[indexPath.row])!
        self.categoryUrl = String(self.categoryURLs[indexPath.row])
        
        performSegue(withIdentifier: "gotonews", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellItem = categoryTable.dequeueReusableCell(withIdentifier: "cell") as? CateogryItemCell else { return UITableViewCell() }
        cellItem.title.text = self.categories[indexPath.row]
        return cellItem
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.categoryTable.dataSource = self
        self.categoryTable.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "gotonews"){
            let newsListPage = segue.destination as! NewsListPage
            newsListPage.rssURL = categoryUrl
            newsListPage.categoryName = categoryName
            newsListPage.title = categoryName
        }
    }
}

