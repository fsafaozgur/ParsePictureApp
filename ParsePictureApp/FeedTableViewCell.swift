//
//  FeedTableViewCell.swift
//  ParsePictureApp
//
//  Created by Safa on 8.09.2023.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    

    

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var commentLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
