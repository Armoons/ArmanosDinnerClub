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

extension OrderViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return orderedProduct.ProductsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OrderedProductCell", for: indexPath) as! OrderedProductCell
        return cell
    }
    
    
}
