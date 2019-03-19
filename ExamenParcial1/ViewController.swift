//
//  ViewController.swift
//  ExamenParcial1
//
//  Created by Juan Carlos Aviña Luna on 3/16/19.
//  Copyright © 2019 Juan Carlos Aviña Luna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var imgLogo: UIImageView!
    @IBOutlet var txtUser: UITextField!
    @IBOutlet var txtPassword: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segue_entrar" {
            _ = segue.destination as! UINavigationController
        } else if segue.identifier == "segue_signup" {
            _ = segue.destination
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if identifier == "segue_entrar" {
            for (key, value) in users.listUsers {
                if txtUser.text == key && txtPassword.text == value {
                    return true
                }
            }
        } else if identifier == "segue_signup" {
            return true
        }
        
        let alert = UIAlertController(title: "Invalid user", message: "The user or password are incorrect", preferredStyle: .alert)
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
        
        return false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

