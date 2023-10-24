//
//  LoginViewController.swift
//  Instachat
//
//  Created by Jose Antonio on 8/10/23.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.applyTextFieldStyle()
        passwordTextField.applyTextFieldStyle()
    }


    @IBAction func sendData(_ sender: UIButton) {
        if let email = emailTextField.text, let pass = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: pass){ [weak self] authResult, error in
                if let e = error{
                    print(e)
                }else{
                    self!.performSegue(withIdentifier: Constants.segueLoginToChat, sender: self)
                }
            }
        }
    }
}
