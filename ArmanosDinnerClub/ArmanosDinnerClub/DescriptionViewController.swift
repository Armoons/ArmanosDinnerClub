//
//  DescriptionOfCell.swift
//  ArmanosDinnerClub
//
//  Created by Stepanyan Arman  on 30.06.2021.
//

import Foundation
import UIKit
import SnapKit


class DescriptionViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    private func initialize(){
        let nameOrderedLabel = UILabel()
        let iconOrdered = UIImageView()
        let descriptionOrderedLabel = UILabel()
        let priceOrderedLable = UILabel()
        let orderButton = ActionButton(title: "Заказать")
        view.backgroundColor = .white
        for i in [nameOrderedLabel, iconOrdered, descriptionOrderedLabel, priceOrderedLable, orderButton]{
            view.addSubview(i)
        }
        
        orderButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.bottomMargin.equalToSuperview().inset(22)
        }
        
        nameOrderedLabel.text = "Картоха"
        nameOrderedLabel.font = UIFont.boldSystemFont(ofSize: 24)
        nameOrderedLabel.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview().offset(-15)
            maker.topMargin.equalToSuperview().inset(40)
        }
        
        iconOrdered.image = UIImage(named: "image")
        iconOrdered.snp.makeConstraints { maker in
            maker.left.equalTo(nameOrderedLabel.snp.right).inset(-10)
            maker.topMargin.equalToSuperview().inset(35)
        }
        
        descriptionOrderedLabel.text = "Картофель Фри - это порция хрустящик, золотистых, обжаренных в растительном фритюре и слегка посоленных соломок отборного картофеля."
        descriptionOrderedLabel.numberOfLines = 0
        descriptionOrderedLabel.snp.makeConstraints { maker in
            maker.left.right.equalToSuperview().inset(26)
            maker.top.equalTo(nameOrderedLabel.snp.bottom).inset(-10)
        }
        
        priceOrderedLable.text = "54" + " рубля"
        priceOrderedLable.font = UIFont.boldSystemFont(ofSize: 24)
        priceOrderedLable.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(orderButton).inset(-45)
        }
        
        
    }
}
