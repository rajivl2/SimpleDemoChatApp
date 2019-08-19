//
//  MessageViewModel.swift
//  Messages
//
//  Created by Ford Labs on 14/08/19.
//  Copyright © 2019 Ford Labs. All rights reserved.
//

import Foundation
import UIKit
import os.log

class MessageViewModel{
    
    private var users: [MessageContacts] = []
    
    func getMessagedetails() -> [MessageContacts] {
        
        let rajivMessages1 = TextMessages(from: true, to: false, textMessages: "Hi, How are you ?", timeOfTextMessage: "Wed, 14 Aug 2019 06:26:19")
        let rajivMessages2 = TextMessages(from: false, to: true, textMessages: "Hi, I am fine", timeOfTextMessage: "Wed, 14 Aug 2019 07:26:19")
        let rajivMessages3 = TextMessages(from: false, to: true, textMessages: "How are you?", timeOfTextMessage: "Wed, 14 Aug 2019 07:27:19")
        
        let rajiv = MessageContacts(contactName: "Rajiv", textMessages: [rajivMessages1,rajivMessages2,rajivMessages3])
        
        self.users.append(rajiv)
        
        let jonMessages1 = TextMessages(from: true, to: false, textMessages: "Hi, Are you coming today ?", timeOfTextMessage: "Tue, 14 Aug 2019 09:26:19")
        let jonMessages2 = TextMessages(from: false, to: true, textMessages: "Hi", timeOfTextMessage: "Tue, 13 Aug 2019 09:30:19")
        let jonMessages3 = TextMessages(from: false, to: true, textMessages: "Yes. I will be there !", timeOfTextMessage: "Tue, 13 Aug 2019 09:55:19")
        let jonMessages4 = TextMessages(from: false, to: true, textMessages: "Please read the article below for today's test.", timeOfTextMessage: "Tue, 13 Aug 2019 09:57:19")
        let jonMessages5 = TextMessages(from: false, to: true, textMessages: "Why do we use Coordinator? - Each independent FLOW should have its own coordinator. Each coordinator (generally) holds a Router class to control the presentation. Pushing view controllers from other view controllers prevents UIViewController classes from acting independently.", timeOfTextMessage: "Tue, 13 Aug 2019 09:55:19")
        let jonMessages6 = TextMessages(from: true, to: false, textMessages: "ok. Got it. Thanks for sharing.", timeOfTextMessage: "Tue, 13 Aug 2019 09:59:19")
        let jonMessages7 = TextMessages(from: false, to: true, textMessages: "You are welcome !", timeOfTextMessage: "Tue, 13 Aug 2019 10:05:19")
        let jonMessages8 = TextMessages(from: true, to: false, textMessages: "To add here - View controllers have a lot of responsibilities already! It's not just the massive view controller problem; it requires significant setup and dependency injection to properly test a view controller that holds multiple responsibilities.", timeOfTextMessage: "Tue, 13 Aug 2019 10:30:19")
        
        let jonMessages9 = TextMessages(from: false, to: true, textMessages: "Correct !", timeOfTextMessage: "Tue, 13 Aug 2019 10:55:19")
        
        let jon = MessageContacts(contactName: "Jon", textMessages: [jonMessages1,jonMessages2,jonMessages3,jonMessages4,jonMessages5,jonMessages6,jonMessages7,jonMessages8,jonMessages9])
        
        self.users.append(jon)
        
        let rishavMessages1 = TextMessages(from: true, to: false, textMessages: "Hi, Please call me once you home", timeOfTextMessage: "Sun, 12 Aug 2019 09:26:19")
        let rishavMessages2 = TextMessages(from: false, to: true, textMessages: "Ok Sure !", timeOfTextMessage: "Sun, 12 Aug 2019 11:26:19")
        
        let rishav = MessageContacts(contactName: "Rishav", textMessages: [rishavMessages1,rishavMessages2])
        
        self.users.append(rishav)
        
        
        let pritiMessages1 = TextMessages(from: true, to: false, textMessages: "Hello raj", timeOfTextMessage: "Sat, 11 Aug 2019 09:27:19")
        let pritiMessages2 = TextMessages(from: true, to: false, textMessages: "You home ?", timeOfTextMessage: "Sat, 11 Aug 2019 09:29:19")
        let pritiMessages3 = TextMessages(from: false, to: true, textMessages: "yes I am home", timeOfTextMessage: "Sun, 12 Aug 2019 06:26:19")
        let pritiMessages4 = TextMessages(from: true, to: false, textMessages: "Ok. Please call me", timeOfTextMessage: "Sun, 12 Aug 2019 06:27:19")
        
        let priti = MessageContacts(contactName: "Priti", textMessages: [pritiMessages1,pritiMessages2,pritiMessages3,pritiMessages4])
        
        self.users.append(priti)
        
        let kabyaMessages1 = TextMessages(from: true, to: false, textMessages: "Happy Birthday", timeOfTextMessage: "Fri, 10 Aug 2019 09:26:19")
        let kabyaMessages2 = TextMessages(from: true, to: false, textMessages: "wish you many many retruns of the day", timeOfTextMessage: "Fri, 10 Aug 2019 09:28:19")
        let kabyaMessages3 = TextMessages(from: false, to: true, textMessages: "Thank you", timeOfTextMessage: "Fri, 10 Aug 2019 09:29:19")
        
        let kabya = MessageContacts(contactName: "Kabya", textMessages: [kabyaMessages1,kabyaMessages2,kabyaMessages3])
        
        self.users.append(kabya)
        
        let jsonMessages1 = TextMessages(from: true, to: false, textMessages: "Hi", timeOfTextMessage: "Thu, 9 Aug 2019 09:26:19")
        let jsonMessages2 = TextMessages(from: true, to: false, textMessages: "Please bring your id. It will be usefull", timeOfTextMessage: "Thu, 09 Aug 2019 09:26:55")
        let jsonMessages3 = TextMessages(from: false, to: true, textMessages: "Ok", timeOfTextMessage: "Thu, 09 Aug 2019 09:26:59")
        
        let json = MessageContacts(contactName: "Json", textMessages: [jsonMessages1,jsonMessages2,jsonMessages3])
        
        self.users.append(json)
        
        let kaveriMessages1 = TextMessages(from: true, to: false, textMessages: "Hi, How are you ?", timeOfTextMessage: "Thu, 09 Aug 2019 07:26:19")
        let kaveriMessages2 = TextMessages(from: false, to: true, textMessages: "Hi, I am fine", timeOfTextMessage: "Thu, 09 Aug 2019 08:26:19")
        let kaveriMessages3 = TextMessages(from: false, to: true, textMessages: "How are you?", timeOfTextMessage: "Fri, 10 Aug 2019 09:26:19")
        
        let kaveri = MessageContacts(contactName: "Kaveri", textMessages: [kaveriMessages1,kaveriMessages2,kaveriMessages3])
        
        self.users.append(kaveri)
        
        let rahulMessages1 = TextMessages(from: true, to: false, textMessages: "Hi", timeOfTextMessage: "Wed, 08 Aug 2019 09:26:19")
        let rahulMessages2 = TextMessages(from: false, to: true, textMessages: "Hi", timeOfTextMessage: "Wed, 08 Aug 2019 10:26:19")
        let rahulMessages3 = TextMessages(from: false, to: true, textMessages: "Good Morning", timeOfTextMessage: "Thu, 09 Aug 2019 07:26:19")
        
        let rahul = MessageContacts(contactName: "Rahul", textMessages: [rahulMessages1,rahulMessages2,rahulMessages3])
        
        self.users.append(rahul)
        
        let abhishekMessages1 = TextMessages(from: true, to: false, textMessages: "Hi, How are you ?", timeOfTextMessage: "Sun, 05 Aug 2019 09:26:19")
        let abhishekMessages2 = TextMessages(from: false, to: true, textMessages: "Hi, I am fine", timeOfTextMessage: "Mon, 06 Aug 2019 09:26:19")
        let abhishekMessages3 = TextMessages(from: false, to: true, textMessages: "How are you?", timeOfTextMessage: "Mon, 06 Aug 2019 09:29:19")
        
        let abhishek = MessageContacts(contactName: "Abhishek", textMessages: [abhishekMessages1,abhishekMessages2,abhishekMessages3])
        
        self.users.append(abhishek)
        
        let daniMessages1 = TextMessages(from: true, to: false, textMessages: "Please do me a favor", timeOfTextMessage: "Wed, 01 Aug 2019 09:26:19")
        let daniMessages2 = TextMessages(from: false, to: true, textMessages: "Sure!, what is it?", timeOfTextMessage: "Wed, 01 Aug 2019 09:33:19")
        let daniMessages3 = TextMessages(from: true, to: false, textMessages: "Will you land me your car for today?", timeOfTextMessage: "Wed, 01 Aug 2019 09:36:19")
        let daniMessages4 = TextMessages(from: false, to: true, textMessages: "No i will be using it today.", timeOfTextMessage: "Wed, 01 Aug 2019 09:39:19")
        
        let dani = MessageContacts(contactName: "Dani", textMessages: [daniMessages1,daniMessages2,daniMessages3,daniMessages4])
        
        self.users.append(dani)
        
        return users
    }
    
    func addData(newMessage: MessageContacts){
        self.users = getMessagedetails()
        self.users.append(newMessage)
    }
    
    func saveMessages(messages: MessageContacts){
        //let isSuccessFulSave = NSKeyedArchiver.archiveRootObject(messages, toFile: MessageContacts.ArchiveURL.path)
        
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: messages, requiringSecureCoding: false)
            try data.write(to: MessageContacts.ArchiveURL)
        } catch {
            print("Couldn't write file")
        }
    }
    
    func loadMessages() -> [MessageContacts]?  {
        return NSKeyedUnarchiver.unarchiveObject(withFile: MessageContacts.ArchiveURL.path) as? [MessageContacts]
    }
    
}
