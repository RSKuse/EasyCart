//
//  CartStructModel.swift
//  EasyCart
//
//  Created by Reuben Simphiwe Kuse on 2024/04/07.
//

import Foundation
import UIKit

struct ShoppingCartModel {
    var products: [Product]
}

struct Product {
    let itemName: String
    let itemPrice: Double
    let itemImage: UIImage
    let storeName: String
}
