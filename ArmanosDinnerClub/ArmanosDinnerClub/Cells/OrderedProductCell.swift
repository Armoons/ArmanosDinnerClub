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
        self.makeShadow()
        self.layer.shadowPath = UIBezierPath(roundedRect:self.bounds, cornerRadius:self.layer.cornerRadius).cgPath
        
    }
    
    func setupCell(product: Product){
        self.nameLabel.text = product.name
        self.priceLabel.text = "\(product.price) рублей"
        self.productImage.image = product.image
    }

}


