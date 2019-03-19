//
//  AddProductViewController.swift
//  ExamenParcial1
//
//  Created by Juan Carlos Aviña Luna on 3/17/19.
//  Copyright © 2019 Juan Carlos Aviña Luna. All rights reserved.
//

import UIKit

class AddProductViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var imgFoto: UIImageView!
    @IBOutlet var txtTitle: UITextField!
    @IBOutlet var txtDescription: UITextField!
    @IBOutlet var txtPrice: UITextField!
    
    @IBAction func onAdd(_ sender: Any) {
        let title = txtTitle.text
        let description = txtDescription.text
        let price = txtPrice.text
        
        let array = [
            "title": title,
            "description": description,
            "price": price,
            "infoImage": "portadamaria"
        ]
        
        product.listProducts.append(array as! [String : String])
        print(product.listProducts)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgFoto.image = UIImage(named: "portadamaria")
        
        self.txtTitle.delegate = self
        self.txtDescription.delegate = self
        self.txtPrice.delegate = self
        
        /*let imagePicker = UIImagePickerController()
        present(imagePicker, animated: true, completion: nil)
        imagePicker.delegate = self*/
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
    
    /*
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        imgFoto.image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage?
        dismiss(animated: true, completion: nil)
    }*/

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
