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
}

class CustomCellTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        
        self.refreshControl = pullToRefreshControl
        pullToRefreshControl.addTarget(self, action: #selector(refreshTable), for: .valueChanged)
    }
    
    let pullToRefreshControl = UIRefreshControl()
    
    @objc func refreshTable() {
        self.tableView.reloadData()
        pullToRefreshControl.endRefreshing()
    }
    
    @IBAction func onLogout(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    var selectedIndexPath =  IndexPath()
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "custom_cell", for: indexPath) as! CustomCellTableViewCell
        
        let p = product.listProducts
        if (indexPath.row == 0) || (indexPath.row == 1) || (indexPath.row == 2) {
            cell.imgFoto.image = UIImage(named: p[indexPath.row]["infoImage"]!)
        } else {
            let data = UserDefaults.standard.object(forKey: p[indexPath.row]["title"]!)
            cell.imgFoto.image = UIImage(data: data as! Data)
        }
        
        cell.txtTitle.text = p[indexPath.row]["title"]
        cell.txtDescription.text = p[indexPath.row]["description"]
        cell.txtPrice.text = p[indexPath.row]["price"]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return  40
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return product.listProducts.count
    }
}
