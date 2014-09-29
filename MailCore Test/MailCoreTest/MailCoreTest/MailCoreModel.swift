//
//  MailCoreModel.swift
//  MailCoreTest
//
//  Created by Kloud on 9/27/14.
//  Copyright (c) 2014 KevinKloud. All rights reserved.
//

import Foundation

class MailBox: NSObject {
    
    var masterViewController: ViewController
    var imapSession = MCOIMAPSession()
    var smtpSession = MCOSMTPSession()
    var archivedMessages = [MCOIMAPMessage]()
    var unreadMessages = [MCOIMAPMessage]()
    var savedMessages = [MCOIMAPMessage]()
    
    init (owner: ViewController) {
        masterViewController = owner
        super.init()
    }
    
    func login() {
        imapSession.hostname = "imap.gmail.com"
        imapSession.port = 993
        imapSession.username = "kevinkloudtest@gmail.com"
        imapSession.password = "k1e2v3i4n5"
        imapSession.connectionType = MCOConnectionType.TLS
    }
    
    func fetchMessages(){
        fetchUnreadMessages()
        fetchSavedMessages()
        fetchArchivedMessages()
    }
    
    func fetchUnreadMessages() {        
        let requestKind = MCOIMAPMessagesRequestKind.Headers | MCOIMAPMessagesRequestKind.Flags
        let folder = "INBOX"
        let uids = MCOIndexSet(range: MCORangeMake(1, UINT64_MAX))
        
        let fetchOperation = imapSession.fetchMessagesByUIDOperationWithFolder(folder, requestKind: requestKind, uids: uids)
        
        fetchOperation.start({error, fetchedMessages, vanishedMessages in
            if (error != nil) {
                println("Error downloading message headers: \(error)")
            } else {
                for item: AnyObject in fetchedMessages {
                    if (item as MCOIMAPMessage).flags != MCOMessageFlag.Seen {
                        self.unreadMessages.append(item as MCOIMAPMessage)
                    }
                }
                println("\(self.unreadMessages)")
            }
        })
    }
    
    func fetchSavedMessages() {
        let requestKind = MCOIMAPMessagesRequestKind.Headers | MCOIMAPMessagesRequestKind.Flags
        let folder = "INBOX"
        let uids = MCOIndexSet(range: MCORangeMake(1, UINT64_MAX))
        
        let fetchOperation = imapSession.fetchMessagesByUIDOperationWithFolder(folder, requestKind: requestKind, uids: uids)
        
        fetchOperation.start({error, fetchedMessages, vanishedMessages in
            if (error != nil) {
                println("Error downloading message headers: \(error)")
            } else {
                for item: AnyObject in fetchedMessages {
                    if (item as MCOIMAPMessage).flags == MCOMessageFlag.Seen {
                        self.savedMessages.append(item as MCOIMAPMessage)
                    }
                }
                println("\(self.savedMessages)")
            }
        })
    }
    
    func fetchArchivedMessages() {
        let requestKind = MCOIMAPMessagesRequestKind.Headers | MCOIMAPMessagesRequestKind.GmailLabels
        let folder = "[Gmail]/All Mail"
        let uids = MCOIndexSet(range: MCORangeMake(1, UINT64_MAX))
        
        let fetchOperation = imapSession.fetchMessagesByUIDOperationWithFolder(folder, requestKind: requestKind, uids: uids)
        
        fetchOperation.start({error, fetchedMessages, vanishedMessages in
            if (error != nil) {
                println("Error downloading message headers: \(error)")
            } else {
                for item: AnyObject in fetchedMessages {
                    var labels = (item as MCOIMAPMessage).gmailLabels as? [NSString]
                    if labels == nil {
                        labels = []
                    }
                    if !contains(labels!, "\\Inbox") {
                        self.archivedMessages.append(item as MCOIMAPMessage)
                    }
                }
                println("\(self.archivedMessages)")
            }
        })
    }
    
    func saveMessage(message: MCOIMAPMessage) {
        message.flags |= MCOMessageFlag.Seen
        
        let muid : UInt64 = UInt64(message.uid)
        
        let msgOperation = imapSession.storeFlagsOperationWithFolder("INBOX", uids: MCOIndexSet(index: muid), kind: MCOIMAPStoreFlagsRequestKind.Add, flags: message.flags)
        
        msgOperation.start({error in
            println("selected message flags \(message.flags) UID is \(message.uid)");
        })
    }
    
    func archiveMessage(message: MCOIMAPMessage) {
        let muid : UInt64 = UInt64(message.uid)
        
        let msgOp = imapSession.storeLabelsOperationWithFolder("[Gmail]/All Mail", uids: MCOIndexSet(index: muid), kind: MCOIMAPStoreFlagsRequestKind.Remove, labels: ["\\Inbox"])
        
        msgOp.start({error in
            println("selected message labels \(message.gmailLabels) UID is \(message.uid)");
        })
    }
    
    func fetchMessageBody(message: MCOIMAPMessage) {
        let requestKind = MCOIMAPMessagesRequestKind.Headers
        let folder = "[Gmail]/All Mail"
        let msgOp = imapSession.fetchMessageByUIDOperationWithFolder(folder, uid: message.uid)
        
        msgOp.start({error, data in
            //let msgParser = MCOMessageParser(data: data)
            //let msgHTMLBody : String = msgParser.htmlRenderingWithDelegate(nil)
            //println("\(msgHTMLBody)")
        })
    }
    
    func sendMessage(message: MCOIMAPMessage) {
    }
}