//
//  MainViewController.swift
//  marcadores
//
//  Created by Pereiro, Delfin on 18/06/16.
//  Copyright © 2016 Pereiro, Delfin. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let firstTab = AllMatchesTableViewController(nibName: String(MatchesTableViewController), bundle: nil)
        let nav = UINavigationController(rootViewController: firstTab)
        nav.tabBarItem = UITabBarItem(title: "All matches", image: UIImage.init(named: "firstTab"), tag: 0)
        
        let secondTab = LiveMatchesTableViewController(nibName: String(MatchesTableViewController), bundle: nil)
        let nav2 = UINavigationController(rootViewController: secondTab)
        nav2.tabBarItem = UITabBarItem(title: "LIVE", image: UIImage.init(named: "secondTab"), tag: 1)
        
        let thirdTab = FinishedMatchesTableViewController(nibName: String(MatchesTableViewController), bundle: nil)
        let nav3 = UINavigationController(rootViewController: thirdTab)
        nav3.tabBarItem = UITabBarItem(title: "Finished", image: UIImage.init(named: "thirdTab"), tag: 2)
        
        self.setViewControllers([nav,nav2,nav3], animated: false)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
