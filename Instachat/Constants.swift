//
//  Constants.swift
//  Instachat
//
//  Created by Jose Antonio on 9/10/23.
//

import Foundation

struct Constants{
    static let segueRegisterToChat = "registerToChat"
    static let segueLoginToChat = "loginToChat"
    static let messageCellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let cellIdentifier = "ReusableCell"
    
    struct FStore{
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
