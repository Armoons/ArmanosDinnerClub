//
//  ProductType.swift
//  ArmanosDinnerClub
//
//  Created by Stepanyan Arman  on 24.07.2021.
//

import Foundation
import UIKit

enum ProductType: String, Equatable {
    case burger
    case chips
    case juice
    case dish
    
    var icon: UIImage? {
        UIImage(named: rawValue)
    }
}
