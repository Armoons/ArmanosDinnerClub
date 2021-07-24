//
//  ProductType.swift
//  ArmanosDinnerClub
//
//  Created by Stepanyan Arman  on 24.07.2021.
//

import Foundation
import UIKit

enum ProductType: Equatable {
    case burger
    case chips
    case juice
    case dish
    
    var icon: UIImage? {
        switch self {
        case .burger:
            return UIImage(named: "burger")
        case .chips:
            return UIImage(named: "chips")
        case .juice:
            return UIImage(named: "juice")
        case .dish:
            return UIImage(named: "dish")
        }
    }
}
