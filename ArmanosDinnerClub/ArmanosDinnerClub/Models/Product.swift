//
//  OrderedProduct.swift
//  ArmanosDinnerClub
//
//  Created by Stepanyan Arman  on 27.06.2021.
//

import UIKit

struct Product {
    var name: String
    var price: Int
    var image: UIImage
    var index: Int
}

class Products{
    var productsArray = [Product]()
    
    init() {
        setup()
    }
    
    func setup(){
        productsArray = [
            Product(name: "Бургер", price: 130, image: UIImage(named: "image")!, index: 1),
            Product(name: "Картоха", price: 54, image: UIImage(named: "image")!, index: 2),
            Product(name: "Твистер", price: 175, image: UIImage(named: "image")!, index: 3),
            Product(name: "Бургер", price: 130, image: UIImage(named: "image")!, index: 4),
            Product(name: "Картоха", price: 54, image: UIImage(named: "image")!, index: 5),
            Product(name: "Твистер", price: 175, image: UIImage(named: "image")!, index: 6),
            Product(name: "Бургер", price: 130, image: UIImage(named: "image")!, index: 7),
            Product(name: "Картоха", price: 54, image: UIImage(named: "image")!, index: 8),
            Product(name: "Твистер", price: 175, image: UIImage(named: "image")!, index: 9),
            Product(name: "Бургер", price: 130, image: UIImage(named: "image")!, index: 10),
            Product(name: "Картоха", price: 54, image: UIImage(named: "image")!, index: 11),
            Product(name: "Твистер", price: 175, image: UIImage(named: "image")!, index: 12)
        ]
    }
}
