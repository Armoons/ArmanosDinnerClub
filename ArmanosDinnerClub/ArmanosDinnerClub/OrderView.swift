//
//  OrderView.swift
//  ArmanosDinnerClub
//
//  Created by Stepanyan Arman  on 20.12.2021.
//

import Foundation
import UIKit
import SnapKit

protocol OrderViewDelegate {
    func selectedProduct(product: Product)
}

class OrderView: UIView {
    
//    @IBOutlet weak var collectionView: UICollectionView!
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsVerticalScrollIndicator = false
        cv.register(UINib(nibName: "OrderedProductCell", bundle: nil), forCellWithReuseIdentifier: "OrderedProductCell")

//        cv.register(CatalogueCell.self, forCellWithReuseIdentifier: CellID.goodsCellID)
//        cv.backgroundColor = Colors.background
        return cv
    }()
    
    var delegate:OrderViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.backgroundColor = .red
//        self.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 0)
//        collectionView.register(UINib(nibName: "OrderedProductCell", bundle: nil), forCellWithReuseIdentifier: "OrderedProductCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.addSubview(collectionView)
        collectionView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
//    func update() {
//        UIView.transition(with: collectionView,
//                          duration: 0.35,
//                          options: .transitionCrossDissolve,
//                          animations: { self.collectionView.reloadData() })
//    }
}

extension OrderView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ProductsService.shared.allProducts().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OrderedProductCell", for: indexPath) as! OrderedProductCell
        let product = ProductsService.shared.allProducts()[indexPath.row]
        cell.setupCell(product: product)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = ProductsService.shared.allProducts()[indexPath.row]
        let descriptionViewController = DescriptionViewController()
        delegate?.selectedProduct(product: product)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.frame.width - 48) / 2, height: 128)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(24)
    }
}

extension OrderView: OrderViewControllerDelegateToView {
    func updateCollView() {
        collectionView.reloadData()
    }
}
