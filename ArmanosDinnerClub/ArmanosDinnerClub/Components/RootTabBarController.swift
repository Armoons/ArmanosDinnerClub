//
//  wsdfsdv.swift
//  ArmanosDinnerClub
//
//  Created by Stepanyan Arman  on 27.07.2021.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewControllers = viewControllers ?? []
        
        let firstControllers = viewControllers
            .map { $0 as? UINavigationController }
            .compactMap { $0?.viewControllers.first }
        
        let orderViewController = firstControllers
            .compactMap { $0 as? OrderViewController }
            .first
        
        let cookViewController = firstControllers
            .compactMap { $0 as? CookViewController }
            .first
        
        if let orderViewController = orderViewController, let cookViewController = cookViewController {
            bindControllers(order: orderViewController, cook: cookViewController)
        }
    }
    
    private func bindControllers(order: OrderViewController, cook: CookViewController) {
        print(order, cook)
    }
}
