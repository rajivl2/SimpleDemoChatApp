//
//  MessageContacts.swift
//  Messages
//
//  Created by Ford Labs on 14/08/19.
//  Copyright © 2019 Ford Labs. All rights reserved.
//

import Foundation
import UIKit
import os.log

//struct MessageContacts{
//    var contactName: String
//    var textMessages: [TextMessages]
//}

class MessageContacts: NSObject, NSCoding {
    
    var contactName: String
    var textMessages: [TextMessages]
    
    // MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("messages")
    
    init(contactName: String,textMessages: [TextMessages]) {
        self.contactName = contactName
        self.textMessages = textMessages
    }
    
    // MARK: Types
    struct PropertyKey {
        static let contactName = "contactName"
        static let textMessages = "textMessages"
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(contactName, forKey: PropertyKey.contactName)
        aCoder.encode(textMessages, forKey: PropertyKey.textMessages)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let contactName = aDecoder.decodeObject(forKey: PropertyKey.contactName) as? String else {
            os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: .debug)
            return nil
        }
        // Because photo is an optional property of Meal, just use conditional cast.
        guard let textMessages = aDecoder.decodeObject(forKey: PropertyKey.textMessages) as? [TextMessages] else {
            os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        // Must call designated initializer.
        self.init(contactName: contactName, textMessages: textMessages)
    }
}
