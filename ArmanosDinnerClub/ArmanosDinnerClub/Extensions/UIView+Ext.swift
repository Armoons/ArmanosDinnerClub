//
//  UIView+Ext.swift
//  ArmanosDinnerClub
//
//  Created by Stepanyan Arman  on 17.07.2021.
//
import Foundation
import UIKit
import SnapKit


public extension UIView {
    func makeShadow(){
        self.layer.cornerRadius = 12
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 8)
        self.layer.shadowRadius = 10.0
        self.layer.shadowOpacity = 0.08
        self.layer.masksToBounds = false
    }
    
    func textFieldSnp(equalTo: ConstraintRelatableTarget){
        self.snp.makeConstraints{
            $0.top.equalTo(equalTo).inset(-26)
            $0.leading.trailing.equalToSuperview().inset(26)
        }
    }
    
    func nameTextFieldSnp(equalTo: ConstraintRelatableTarget){
        self.snp.makeConstraints {
            $0.top.equalTo(equalTo).inset(26)
            $0.leading.trailing.equalToSuperview().inset(26)
        }
    }
}






