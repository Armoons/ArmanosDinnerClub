//
//  ActionButton.swift
//  ArmanosDinnerClub
//
//  Created by Stepanyan Arman  on 24.07.2021.
//

import Foundation
import UIKit

class ActionButton: UIButton{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    convenience init(title: String) {
        self.init()
        self.setTitle(title, for: .normal)
    }
    
    private func setupUI(){
        self.layer.cornerRadius = 29
        self.backgroundColor = UIColor(red: 158/255, green: 177/255, blue: 185/255, alpha: 1)
        self.titleLabel?.font = self.titleLabel?.font.withSize(18)

        self.setTitleColor(.white, for: .normal)
        self.snp.makeConstraints {
            $0.width.equalTo(220)
            $0.height.equalTo(58)
        }
    }
}
