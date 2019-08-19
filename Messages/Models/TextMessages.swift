//
//  TextMessages.swift
//  Messages
//
//  Created by Ford Labs on 14/08/19.
//  Copyright © 2019 Ford Labs. All rights reserved.
//

import Foundation

//struct TextMessages{
//    var from: Bool
//    var to: Bool
//    var textMessages: String
//    var timeStamp: String
//}

class TextMessages: NSObject, NSCoding{
    
    var from: Bool
    var to: Bool
    var textMessages: String
    var timeOfTextMessage: String
    
    init(from: Bool, to: Bool, textMessages: String, timeOfTextMessage: String) {
        self.from = from
        self.to = to
        self.textMessages = textMessages
        self.timeOfTextMessage = timeOfTextMessage
    }
    
    // MARK: Types
    struct PropertyKey {
        static let from = "from"
        static let to = "to"
        static let textMessages = "textMessages"
        static let timeOfTextMessage = "timeOfTextMessage"
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(from, forKey: PropertyKey.from)
        aCoder.encode(to, forKey: PropertyKey.to)
        aCoder.encode(textMessages, forKey: PropertyKey.textMessages)
        aCoder.encode(timeOfTextMessage, forKey: PropertyKey.timeOfTextMessage)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        let from = aDecoder.decodeObject(forKey: PropertyKey.from)
        let to = aDecoder.decodeObject(forKey: PropertyKey.to)
        let textMessages = aDecoder.decodeObject(forKey: PropertyKey.textMessages)
        
        let timeOfTextMessage = aDecoder.decodeObject(forKey: PropertyKey.timeOfTextMessage)
        
        // Must call designated initializer.
        self.init(from: (from != nil), to: (to != nil), textMessages: textMessages as! String, timeOfTextMessage: timeOfTextMessage as! String)
    }
}
