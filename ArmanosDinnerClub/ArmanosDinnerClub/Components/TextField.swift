//
//  TextField.swift
//  ArmanosDinnerClub
//
//  Created by Stepanyan Arman  on 24.07.2021.
//

import Foundation
import UIKit

class TextField: UITextField{
    // placeholder position
    @IBInspectable var insetX: CGFloat = 0 {
        didSet {
            layoutIfNeeded()
        }
    }
    @IBInspectable var insetY: CGFloat = 0{
        didSet {
            layoutIfNeeded()
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.makeShadow()
        self.insetX = 16
        self.snp.makeConstraints{$0.height.equalTo(60)}
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: insetX , dy: insetY)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: insetX , dy: insetY)
    }
}
