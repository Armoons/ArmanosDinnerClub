//
//  OrderedProductCell.swift
//  ArmanosDinnerClub
//
//  Created by Stepanyan Arman  on 27.06.2021.
//

import UIKit

class OrderedProductCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 12
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3)//CGSizeMake(0, 2.0);
        self.layer.shadowRadius = 5.0
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect:self.bounds, cornerRadius:self.contentView.layer.cornerRadius).cgPath
        
    }
    
    func setupCell(product: Product){
        self.nameLabel.text = product.Name
        self.priceLabel.text = "\(product.Price) рублей"
        self.productImage.image = product.Image
    }

}
