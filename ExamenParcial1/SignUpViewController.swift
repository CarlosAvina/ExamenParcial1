//
//  SignUpViewController.swift
//  ExamenParcial1
//
//  Created by Juan Carlos Aviña Luna on 3/16/19.
//  Copyright © 2019 Juan Carlos Aviña Luna. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet var txtUser: UITextField!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var txtConfirmPassword: UITextField!
    
    @IBAction func onCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onFinish(_ sender: Any) {
        
        guard txtUser.text != nil || txtPassword.text != nil || txtConfirmPassword.text != nil else {
            
            let alert = UIAlertController(title: "Error", message: "Fill all fields", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                case .default:
                    print("default")
                    
                case .cancel:
                    print("cancel")
                    
                case .destructive:
                    print("destructive")
                    
                    
                }}))
            self.present(alert, animated: true, completion: nil)
            
            return
        }
        
        if txtPassword.text != txtConfirmPassword.text {
            let alert = UIAlertController(title: "Error", message: "Write the same password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                case .default:
                    print("default")
                    
                case .cancel:
                    print("cancel")
                    
                case .destructive:
                    print("destructive")
                    
                    
                }}))
            self.present(alert, animated: true, completion: nil)
        } else {
            users.listUsers[txtUser.text!] = txtPassword.text
            
            let alert = UIAlertController(title: "Perfect!", message: "User created successfully", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                case .default:
                    print("default")
                    
                case .cancel:
                    print("cancel")
                    
                case .destructive:
                    print("destructive")
                    
                }}))
            self.present(alert, animated: true, completion: nil)
            
            print(users.listUsers)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
