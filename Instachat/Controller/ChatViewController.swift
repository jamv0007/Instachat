//
//  ChatViewController.swift
//  Instachat
//
//  Created by Jose Antonio on 8/10/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ChatViewController: UIViewController {
    
    var messages: [MessageClass] = [MessageClass(sender: "paco@pacocorreo.com", body: "Hola que haces"),MessageClass(sender: "paco@pacocorreo.com", body: "Uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh"),MessageClass(sender: "paco@pacocorreo.com", body: "Welcome Stranger")]

    @IBOutlet weak var messagesTable: UITableView!
    @IBOutlet var textMessage: UITextField!
    
    let db = Firestore.firestore()
    
    @IBAction func sendMessage(_ sender: UIButton) {
        if let messageBody = textMessage.text, let messageSender = Auth.auth().currentUser?.email{
            db.collection(Constants.FStore.collectionName).addDocument(data:
            [Constants.FStore.senderField: messageSender,
             Constants.FStore.bodyField: messageBody,
             Constants.FStore.dateField: Date().timeIntervalSince1970]) { (error) in
                if let e = error{
                    print("Error al almacenar en Firestore: \(e)")
                }else{
                    DispatchQueue.main.async {
                        self.textMessage.text = ""
                    }
                    
                }
            }
            
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messagesTable.dataSource = self
        messagesTable.delegate = self
        navigationItem.hidesBackButton = true
        title = "Instachat ✉️"
        messagesTable.register(UINib(nibName: Constants.cellNibName, bundle: nil), forCellReuseIdentifier: Constants.cellIdentifier)
        
        loadMessages()
    }
    
    func loadMessages(){
        //Se cargan los mensajes de firestore, se crea un listener que escucha cada actualizacion y descarga los datos
        db.collection(Constants.FStore.collectionName).order(by: Constants.FStore.dateField).addSnapshotListener { query, error in
            self.messages = []
            if let e = error{
                print("Error al cargar mensajes: \(e)")
            }else{
                if let snapshotDocuments = query?.documents{
                    for i in snapshotDocuments{
                        let data = i.data()
                        if let sender = data[Constants.FStore.senderField] as? String, let body = data[Constants.FStore.bodyField] as? String{
                            self.messages.append(MessageClass(sender: sender, body: body))
                        }
                        
                        
                    }
                    
                    DispatchQueue.main.async {
                        self.messagesTable.reloadData()
                        let indexPath = IndexPath(row: self.messages.count-1, section: 0)
                        self.messagesTable.scrollToRow(at: indexPath, at: .top, animated: true)
                    }
                    
                }
            }
        }
    }
    

    @IBAction func logoutButton(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
        do{
            try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        }catch let signOutError as NSError{
            print("ErrorSignOut: \(signOutError)")
        }
    }
    
    
}

extension ChatViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.messageCellIdentifier, for: indexPath) as! MessageCell
        let message = messages[indexPath.row]
        
        cell.messageText.text = messages[indexPath.row].body
        
        if message.sender == Auth.auth().currentUser?.email{
            cell.messageOtherSenderImage.isHidden = true
            cell.messageSenderImage.isHidden = false
            cell.messageBubble.backgroundColor = UIColor(red: 148/255, green: 23/255, blue: 81/255, alpha: 1.0)
        }else{
            cell.messageOtherSenderImage.isHidden = false
            cell.messageSenderImage.isHidden = true
            cell.messageBubble.backgroundColor = UIColor(red: 255/255, green: 127/255, blue: 80/255, alpha: 1.0)
        }
        
        
        return cell
    }
    
    
}

extension ChatViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
