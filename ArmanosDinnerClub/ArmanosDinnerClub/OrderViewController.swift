//
//  ViewController.swift
//  ArmanosDinnerClub
//
//  Created by Stepanyan Arman  on 25.06.2021.
//

protocol OrderViewControllerDelegateToDescription{
    func selectedProduct(product: Product)
}

protocol OrderViewControllerDelegateToView{
    func updateCollView()
}

import UIKit

class OrderViewController: UIViewController {
    
    private let orderView = OrderView()
    private let descriptionVC = DescriptionViewController()
    private let cookVC = CookViewController()
    
    var delegateDescr: OrderViewControllerDelegateToDescription?
    var delegateView: OrderViewControllerDelegateToView?

    
    override func loadView() {
        self.view = orderView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        orderView.delegate = self
        delegateView = orderView
        self.delegateDescr = descriptionVC
        cookVC.delegate = self
        self.navigationItem.title = "Заказать"
//        self.navigationController?.navigationBar.barTintColor = .red
//        self.navigationController?.toolbar.tintColor = .red
//        collectionView.dataSource = self
//        collectionView.delegate = self
    }
    
//    func update() {
//        UIView.transition(with: collectionView,
//                          duration: 0.35,
//                          options: .transitionCrossDissolve,
//                          animations: {
//    self.collectionView.reloadData()
    
//    })
//    }
}

extension OrderViewController: OrderViewDelegate {
    func selectedProduct(product: Product) {
        present(descriptionVC, animated: true)
        delegateDescr?.selectedProduct(product: product)
    }
}

extension OrderViewController: CookViewControllerDelegate {
    func buttonPressed() {
        delegateView?.updateCollView()
    }
    
    
}

