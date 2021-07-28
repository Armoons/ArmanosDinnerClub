//
//  OrderedProduct.swift
//  ArmanosDinnerClub
//
//  Created by Stepanyan Arman  on 27.06.2021.
//

import UIKit



class Products{
    var productsArray = [Product]()
    
    init() {
        setup()
    }
    
    func setup(){
        productsArray = [
            Product(name: "Бургер", price: 130, image: UIImage(named: "image")),
            Product(name: "Картоха", price: 54, image: UIImage(named: "image")),
            Product(name: "Твистер", price: 175, image: UIImage(named: "image")),
//            Product(name: "Бургер", price: 130, image: UIImage(named: "image")),
//            Product(name: "Картоха", price: 54, image: UIImage(named: "image")),
//            Product(name: "Твистер", price: 175, image: UIImage(named: "image")),
//            Product(name: "Бургер", price: 130, image: UIImage(named: "image")),
//            Product(name: "Картоха", price: 54, image: UIImage(named: "image")),
//            Product(name: "Твистер", price: 75, image: UIImage(named: "image")),
//            Product(name: "Бургер", price: 130, image: UIImage(named: "image")),
//            Product(name: "Картоха", price: 54, image: UIImage(named: "image")),
//            Product(name: "Твистер", price: 75, image: UIImage(named: "image"))
        ]
    }
    
    func addProduct(){
        
    }
}
