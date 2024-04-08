//
//  EmptyCartViewController+TableView.swift
//  EasyCart
//
//  Created by Reuben Simphiwe Kuse on 2024/04/07.
//

import Foundation
import UIKit

extension EmptyCartViewController {
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100.0)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cart.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cartCell = tableView.dequeueReusableCell(withIdentifier: "ShoppingCartCellsID", for: indexPath) as! ShoppingCartCells
        
        return cartCell
    }
    
    
    
}
