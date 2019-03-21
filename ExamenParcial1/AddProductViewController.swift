//
//  AddProductViewController.swift
//  ExamenParcial1
//
//  Created by Juan Carlos Aviña Luna on 3/17/19.
//  Copyright © 2019 Juan Carlos Aviña Luna. All rights reserved.
//

import UIKit

class AddProductViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var imgFoto: UIImageView!
    @IBOutlet var txtTitle: UITextField!
    @IBOutlet var txtDescription: UITextField!
    @IBOutlet var txtPrice: UITextField!
    
    var imagen = UIImage(named: "portadamaria")
    
    @IBAction func onAdd(_ sender: Any) {
        let title = txtTitle.text
        let description = txtDescription.text
        let price = "$" + (txtPrice.text!)
        
        let array = [
            "title": title,
            "description": description,
            "price": price,
            "infoImage": title ?? "portadamaria"
        ]
        
        let imageData = imagen!.pngData()! as NSData
        UserDefaults.standard.set(imageData, forKey: title!)
        
        product.listProducts.append(array as! [String : String])
        print(product.listProducts)
        
        txtTitle.text = ""
        txtDescription.text = ""
        txtPrice.text = ""
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        imagen = info[UIImagePickerController.InfoKey.originalImage] as! UIImage?
        imgFoto.image = imagen
        
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let img = UIImagePickerController()
        present(img, animated: true, completion: nil)
        img.delegate = self
        
        self.txtTitle.delegate = self
        self.txtDescription.delegate = self
        self.txtPrice.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtTitle.resignFirstResponder()
        txtDescription.resignFirstResponder()
        txtPrice.resignFirstResponder()
        return true
    }
}
