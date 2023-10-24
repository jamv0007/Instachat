//
//  RegisterViewController.swift
//  Instachat
//
//  Created by Jose Antonio on 8/10/23.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailField.applyTextFieldStyle()
        passwordField.applyTextFieldStyle()
    }
    
    
    @IBAction func sendData(_ sender: UIButton) {
        //Se crea la auntentificacion con usuario con firebase
        Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!){ authresult, error in
            if let e = error{
                print(e)
            }else{
                //Ir al chat
                self.performSegue(withIdentifier: Constants.segueRegisterToChat, sender: self)
            }
        }
    }
    
 

}
