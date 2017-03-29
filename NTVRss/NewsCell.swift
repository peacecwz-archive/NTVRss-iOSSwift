//
//  NewsCell.swift
//  NTVRss
//
//  Created by Rahman Ünver on 29/03/2017.
//  Copyright © 2017 RahoApp. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell{
    
    @IBOutlet weak var lblNews: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
