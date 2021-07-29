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
    var description: String
    
    init(name: String, price: Int, type: ProductType, description: String) {
        self.name = name
        self.price = price
        self.type = type
        self.description = description
    }
    
    init?(string: String) {
        let parts = string.split(separator: Self.separator.first!)
        guard parts.count == 4 else { return nil }
        let name = String(parts[0])
        guard let price = Int(String(parts[1])) else { return nil }
        guard let type = ProductType(rawValue: String(parts[2])) else { return nil }
        let description = String(parts[3])
        self.init(name: name, price: price, type: type, description: description)
    }
    
    func toString() -> String {
        name + Self.separator + "\(price)" + Self.separator + type.rawValue + Self.separator + description
    }
}
