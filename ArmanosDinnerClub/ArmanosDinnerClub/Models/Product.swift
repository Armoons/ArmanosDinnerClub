//
//  OrderedProduct.swift
//  ArmanosDinnerClub
//
//  Created by Stepanyan Arman  on 27.06.2021.
//

import UIKit


struct Product {
    
    private static var separator = "@"
    
    var name: String
    var price: Int
    var type: ProductType
    
    init(name: String, price: Int, type: ProductType) {
        self.name = name
        self.price = price
        self.type = type
    }
    
    init?(string: String) {
        let parts = string.split(separator: Self.separator.first!)
        guard parts.count == 3 else { return nil }
        let name = String(parts[0])
        guard let price = Int(String(parts[1])) else { return nil }
        guard let type = ProductType(rawValue: String(parts[2])) else { return nil }
        self.init(name: name, price: price, type: type)
    }
    
    func toString() -> String {
        name + Self.separator + "\(price)" + Self.separator + type.rawValue
    }
}
