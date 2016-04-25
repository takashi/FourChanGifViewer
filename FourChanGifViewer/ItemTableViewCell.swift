//
//  ItemTableViewCell.swift
//  FourChanGifViewer
//
//  Created by takashi on 2016/04/25.
//  Copyright © 2016年 takashi. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        name.textAlignment = .Left
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }    
}
