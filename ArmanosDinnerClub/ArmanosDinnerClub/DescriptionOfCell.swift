//
//  DescriptionOfCell.swift
//  ArmanosDinnerClub
//
//  Created by Stepanyan Arman  on 30.06.2021.
//

import Foundation
import UIKit
import SnapKit

struct viewInfo {
    let nameLabel: String
    let icon: UIImage
    let descriptionLabel: String
    let priceLable: String
    let index: Int
}



class Description: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    private func initialize(){
        let nameOrderedLabel = UILabel()
        let iconOrdered = UIImageView()
        let descriptionOrderedLabel = UILabel()
        let priceOrderedLable = UILabel()
        let orderButton = UIButton()
        view.backgroundColor = .white
        for i in [nameOrderedLabel, iconOrdered, descriptionOrderedLabel, priceOrderedLable, orderButton]{
            view.addSubview(i)
        }
        nameOrderedLabel.text = "Картоха"
        nameOrderedLabel.font = UIFont.boldSystemFont(ofSize: 24)
//        nameLabel.backgroundColor = .red
//        nameLabel.adjustsFontSizeToFitWidth = true
        nameOrderedLabel.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview().offset(-15)
            maker.topMargin.equalToSuperview().inset(40)
//            maker.width.equalTo(nameLabel.frame.width)
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
//            maker.bottom.equalTo(priceLable).inset(5)
        }
        
        priceOrderedLable.text = "54" + " рубля"
        priceOrderedLable.font = UIFont.boldSystemFont(ofSize: 24)
        priceOrderedLable.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(orderButton).inset(-45)
        }
        
        orderButton.layer.cornerRadius = 29
        orderButton.backgroundColor = UIColor(red: 158/255, green: 177/255, blue: 185/255, alpha: 1)
        orderButton.titleLabel?.font = orderButton.titleLabel?.font.withSize(18)
        orderButton.setTitle("Заказать", for: .normal)
        orderButton.setTitleColor(.white, for: .normal)
        orderButton.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.bottomMargin.equalToSuperview().inset(36)
            maker.width.equalTo(220)
            maker.height.equalTo(58)
        }
    }
    
}

