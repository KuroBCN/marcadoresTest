//
//  AllMatchesTableViewController.swift
//  marcadores
//
//  Created by Pereiro, Delfin on 18/06/16.
//  Copyright © 2016 Pereiro, Delfin. All rights reserved.
//

import UIKit

class AllMatchesTableViewController: MatchesTableViewController {
    
    override func reloadData() {
        MatchDAO.getAllMatches { (matches) in
            self.refreshControl?.endRefreshing()
            self.leagues = matches
            self.tableView.reloadData()
        }
    }
}
