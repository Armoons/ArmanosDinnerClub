//
//  ViewController.swift
//  ArmanosDinnerClub
//
//  Created by Stepanyan Arman  on 25.06.2021.
//

import UIKit

class OrderViewController: UIViewController {
    
    private let orderView = OrderView()
    
    
    override func loadView() {
        self.view = orderView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Заказать"
//        collectionView.dataSource = self
//        collectionView.delegate = self
    }
    
//    func update() {
//        UIView.transition(with: collectionView,
//                          duration: 0.35,
//                          options: .transitionCrossDissolve,
//                          animations: { self.collectionView.reloadData() })
//    }
}

//extension OrderViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return ProductsService.shared.allProducts().count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OrderedProductCell", for: indexPath) as! OrderedProductCell
//        let product = ProductsService.shared.allProducts()[indexPath.row]
//        cell.setupCell(product: product)
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let product = ProductsService.shared.allProducts()[indexPath.row]
//        let descriptionViewController = DescriptionViewController()
//        descriptionViewController.set(product: product)
//        present(descriptionViewController, animated: true)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: (view.frame.width - 48) / 2, height: 128)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return CGFloat(24)
//    }
//}
