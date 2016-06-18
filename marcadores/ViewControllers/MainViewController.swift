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
        let firstTab = MatchesTableViewController(nibName: String(MatchesTableViewController), bundle: nil)
        let nav = UINavigationController(rootViewController: firstTab)
        nav.tabBarItem = UITabBarItem(title: "All matches", image: UIImage.init(named: "first"), tag: 0)
        self.setViewControllers([nav], animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
