//
//  PostCell.swift
//  blogs
//
//  Created by Md Omar Faruq on 7/23/22.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var dView: UIButton!
    @IBOutlet weak var body: UITextView!
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
