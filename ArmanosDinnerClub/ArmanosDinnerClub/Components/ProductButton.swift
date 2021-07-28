//
//  ProductButton.swift
//  ArmanosDinnerClub
//
//  Created by Stepanyan Arman  on 24.07.2021.
//

import Foundation
import UIKit

class ProductButton: UIButton{
    
    private(set) var type: ProductType = .burger
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupUI()
    }
    
    convenience init(type: ProductType) {
        self.init()
        self.type = type
        set(image: type.icon, color: "CoolRed")
    }
    
    private func setupUI() {
        makeShadow()
        snp.makeConstraints {
            $0.height.width.equalTo(84)
        }
    }
    
    func set(image: UIImage?, color: String){
        self.setImage(image, for: .normal)
        self.setImage(image?.withRenderingMode(.alwaysTemplate), for: .selected)
        self.tintColor = UIColor(named: color)
    }
}
