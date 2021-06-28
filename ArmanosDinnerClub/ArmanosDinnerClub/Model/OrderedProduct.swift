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
    var ProductsArray = [Product]()
    
    init() {
        setup()
    }
    func setup(){
        let p1 = Product(Name: "Бургер", Price: 130, Image: UIImage(named: "02.Cook")!)
        let p2 = Product(Name: "Картоха", Price: 54, Image: UIImage(named: "02.Cook")!)
        let p3 = Product(Name: "Твистер", Price: 175, Image: UIImage(named: "02.Cook")!)
        let p4 = Product(Name: "Бургер", Price: 130, Image: UIImage(named: "02.Cook")!)
        let p5 = Product(Name: "Картоха", Price: 54, Image: UIImage(named: "02.Cook")!)
        let p6 = Product(Name: "Твистер", Price: 175, Image: UIImage(named: "02.Cook")!)
        ProductsArray = [p1,p2,p3,p4,p5,p6]
    }
    
}
