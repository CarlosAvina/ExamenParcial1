//
//  CustomCellTableViewCell.swift
//  ExamenParcial1
//
//  Created by Juan Carlos Aviña Luna on 3/17/19.
//  Copyright © 2019 Juan Carlos Aviña Luna. All rights reserved.
//

import UIKit

class CustomCellTableViewCell: UITableViewCell {

    @IBOutlet var imgFoto: UIImageView!
    @IBOutlet var txtTitle: UILabel!
    @IBOutlet var txtDescription: UITextView!
    @IBOutlet var txtPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

class CustomCellTableViewController: UITableViewController {
    
    @IBAction func onLogout(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    var selectedIndexPath =  IndexPath()
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "custom_cell", for: indexPath) as! CustomCellTableViewCell
        
        let p = product.listProducts
        cell.imgFoto.image = UIImage(named: "portadamaria")
        cell.txtTitle.text = p[selectedIndexPath.row]["title"]
        cell.txtDescription.text = p[selectedIndexPath.row]["description"]
        cell.txtPrice.text = p[selectedIndexPath.row]["price"]
        
        return cell
    }
}
