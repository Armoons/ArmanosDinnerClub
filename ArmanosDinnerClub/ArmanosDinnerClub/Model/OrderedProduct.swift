//
//  OrderedProduct.swift
//  ArmanosDinnerClub
//
//  Created by Stepanyan Arman  on 27.06.2021.
//

import UIKit

struct Product {
    var Name: String
    var Price: Int
    var Image: UIImage
}
class Products{
    var productsArray = [Product]()
    var image = UIImage(named: "02.Cook")
    
    init() {
        setup()
    }
    func setup(){
        image?.withTintColor(.green)
        let p1 = Product(Name: "Бургер", Price: 130, Image: UIImage(named: "image")!)
        let p2 = Product(Name: "Картоха", Price: 54, Image: UIImage(named: "image")!)
        let p3 = Product(Name: "Твистер", Price: 175, Image: UIImage(named: "image")!)
        let p4 = Product(Name: "Бургер", Price: 130, Image: UIImage(named: "image")!)
        let p5 = Product(Name: "Картоха", Price: 54, Image: UIImage(named: "image")!)
        let p6 = Product(Name: "Твистер", Price: 175, Image: UIImage(named: "image")!)
        let p7 = Product(Name: "Бургер", Price: 130, Image: UIImage(named: "image")!)
        let p8 = Product(Name: "Картоха", Price: 54, Image: UIImage(named: "image")!)
        let p9 = Product(Name: "Твистер", Price: 175, Image: UIImage(named: "image")!)
        let p10 = Product(Name: "Бургер", Price: 130, Image: UIImage(named: "image")!)
        let p11 = Product(Name: "Картоха", Price: 54, Image: UIImage(named: "image")!)
        let p12 = Product(Name: "Твистер", Price: 175, Image: UIImage(named: "image")!)
        productsArray = [p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12]
    }
    
}
