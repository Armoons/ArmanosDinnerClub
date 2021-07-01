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
    let nameLabel = UILabel()
    let icon = UIImageView()
    let descriptionLabel = UILabel()
    let priceLable = UILabel()
    let orderButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        for i in [nameLabel, icon, descriptionLabel, priceLable,orderButton]{
            view.addSubview(i)
        }
        
        nameLabel.text = "Картоха"
        let widthOfName = nameLabel.bounds.size.width
        print(widthOfName)
        nameLabel.font = UIFont.boldSystemFont(ofSize: 24)
//        nameLabel.backgroundColor = .red
//        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview().offset(-15)
            maker.topMargin.equalToSuperview().inset(40)
//            maker.width.equalTo(nameLabel.frame.width)
        }
        
        icon.image = UIImage(named: "image")
        icon.snp.makeConstraints { maker in
            maker.left.equalTo(nameLabel.snp.right).inset(-10)
            maker.topMargin.equalToSuperview().inset(35)
        }
        
        descriptionLabel.text = "Картофель Фри - это порция хрустящик, золотистых, обжаренных в растительном фритюре и слегка посоленных соломок отборного картофеля."
        descriptionLabel.numberOfLines = 0
        descriptionLabel.snp.makeConstraints { maker in
            maker.left.right.equalToSuperview().inset(26)
            maker.top.equalTo(nameLabel.snp.bottom).inset(-10)
//            maker.bottom.equalTo(priceLable).inset(5)
        }
        
        priceLable.text = "54" + " рубля"
        priceLable.font = UIFont.boldSystemFont(ofSize: 24)
        priceLable.snp.makeConstraints { maker in
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

