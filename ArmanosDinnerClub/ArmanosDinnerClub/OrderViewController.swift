//
//  ViewController.swift
//  ArmanosDinnerClub
//
//  Created by Stepanyan Arman  on 25.06.2021.
//

import UIKit

class OrderViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var orderedProduct = Products()
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "OrderedProductCell", bundle: nil), forCellWithReuseIdentifier: "OrderedProductCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }


}

extension OrderViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return orderedProduct.productsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OrderedProductCell", for: indexPath) as! OrderedProductCell
        let product = orderedProduct.productsArray[indexPath.item]
        cell.setupCell(product: product)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = (UIScreen.main.bounds.size.width - 10) / 2
        return CGSize(width: 167, height: 128)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(24)
    }
    
    
}
