//
//  MainTabBar.swift
//  ArmanosDinnerClub
//
//  Created by Stepanyan Arman  on 20.12.2021.
//

import Foundation
import UIKit

class MainTabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setupTabBar()
    }
    
    @available(iOS 15.0, *)
    private func updateTabBarAppearance() {
        let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()

        let barTintColor: UIColor = .white
        tabBarAppearance.backgroundColor = barTintColor

        self.tabBar.standardAppearance = tabBarAppearance
        self.tabBar.scrollEdgeAppearance = tabBarAppearance
    }
    
    func setupTabBar() {
        
        if #available(iOS 15.0, *) {
            updateTabBarAppearance()
        }

        self.definesPresentationContext = true
        guard let cookImage: UIImage = UIImage(named: "Cook") else { return }
        guard let dinnerImage: UIImage = UIImage(named: "Dinner") else { return }
        
        let cookController = createNavigationVC(vc: CookViewController(), itemImage: cookImage)
        let orderController = createNavigationVC(vc: OrderViewController(), itemImage: dinnerImage)
        
        viewControllers = [orderController, cookController]

        guard let items = tabBar.items else { return }
        
        for i in items {
            i.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        }
    }
}

extension UITabBarController {
    
    func createNavigationVC(vc: UIViewController, itemImage: UIImage) -> UINavigationController {
        let navigVC = UINavigationController(rootViewController: vc)
        navigVC.tabBarItem.image = itemImage
        return navigVC
    }
}


