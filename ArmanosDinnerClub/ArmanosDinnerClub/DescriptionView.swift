//
//  DescriptionView.swift
//  ArmanosDinnerClub
//
//  Created by Stepanyan Arman  on 10.01.2022.
//

import Foundation
import UIKit

class DescriptionView : UIView {
    
    private let nameOrderedLabel = UILabel()
    private let iconOrdered = UIImageView()
    private let descriptionOrderedLabel = UILabel()
    private let priceOrderedLable = UILabel()
    private let orderButton = ActionButton(title: "Заказать")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.backgroundColor = .white
        for i in [nameOrderedLabel, iconOrdered, descriptionOrderedLabel, priceOrderedLable, orderButton]{
            self.addSubview(i)
        }
        
        orderButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.bottomMargin.equalToSuperview().inset(22)
        }
        
        nameOrderedLabel.font = UIFont.boldSystemFont(ofSize: 24)
        nameOrderedLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview().offset(-15)
            $0.topMargin.equalToSuperview().inset(40)
        }
        
        iconOrdered.image?.withTintColor(UIColor(named: "CoolGreen") ?? .black)
        iconOrdered.snp.makeConstraints {
            $0.left.equalTo(nameOrderedLabel.snp.right).inset(-10)
            $0.topMargin.equalToSuperview().inset(35)
        }
        
        descriptionOrderedLabel.numberOfLines = 0
        descriptionOrderedLabel.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(26)
            $0.top.equalTo(nameOrderedLabel.snp.bottom).inset(-10)
        }
        
        priceOrderedLable.font = UIFont.boldSystemFont(ofSize: 24)
        priceOrderedLable.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(orderButton).inset(-45)
        }
    }
    
    func set(product: Product){
        nameOrderedLabel.text = product.name
        iconOrdered.image = product.type.icon?.withTintColor(UIColor(named: "CoolGreen")!)
        descriptionOrderedLabel.text = product.description
        priceOrderedLable.text = String(product.price) + " рублей"
    }
    
}

extension DescriptionView: DescriptionViewControllerDelegate {
    func productForShow(product: Product) {
            nameOrderedLabel.text = product.name
            iconOrdered.image = product.type.icon?.withTintColor(UIColor(named: "CoolGreen")!)
            descriptionOrderedLabel.text = product.description
            priceOrderedLable.text = String(product.price) + " рублей"
    }
    
    
}
