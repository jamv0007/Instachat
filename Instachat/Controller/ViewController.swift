//
//  ViewController.swift
//  Instachat
//
//  Created by Jose Antonio on 8/10/23.
//

import UIKit

class ViewController: UIViewController {


    @IBAction func loginButton(_ sender: UIButton) {
    }
    @IBAction func registerButton(_ sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
}

extension UITextField{
    func applyTextFieldStyle(){
        //Basic texfield Setup
        self.borderStyle = .none
        self.backgroundColor = UIColor.systemGroupedBackground // Use anycolor that give you a 2d look.

        //To apply corner radius
        self.layer.cornerRadius = self.frame.size.height / 2

        //To apply border
        self.layer.borderWidth = 0.25
        self.layer.borderColor = UIColor.white.cgColor

        //To apply Shadow
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 3.0
        self.layer.shadowOffset = CGSize.zero // Use any CGSize
        self.layer.shadowColor = UIColor.gray.cgColor

        //To apply padding
        let paddingView : UIView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = UITextField.ViewMode.always
    }
}

