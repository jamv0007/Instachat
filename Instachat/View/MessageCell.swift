//
//  MessageCell.swift
//  Instachat
//
//  Created by Jose Antonio on 10/10/23.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet var messageBubble: UIView!
    @IBOutlet var messageText: UILabel!
    @IBOutlet var messageSenderImage: UIImageView!
    @IBOutlet var messageOtherSenderImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        messageBubble.layer.cornerRadius = messageBubble.frame.height / 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
