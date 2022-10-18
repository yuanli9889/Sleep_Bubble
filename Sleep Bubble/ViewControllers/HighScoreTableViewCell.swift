//
//  HighScoreTableViewCell.swift
//  Sleep Bubble
//
//  Created by Yuan Li on 22/4/21.
//

import UIKit

class HighScoreTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
