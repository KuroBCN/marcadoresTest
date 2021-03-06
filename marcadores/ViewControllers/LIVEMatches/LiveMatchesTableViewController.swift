//
//  SecondTabTableViewController.swift
//  marcadores
//
//  Created by Pereiro, Delfin on 18/06/16.
//  Copyright © 2016 Pereiro, Delfin. All rights reserved.
//

import UIKit

class LiveMatchesTableViewController: MatchesTableViewController {
    
    override func reloadData() {
        MatchDAO.getAllLiveMatches { (matches) in
            if let refresh = self.refreshControl where refresh.refreshing {
                self.refreshControl?.endRefreshing()
            }
            self.leagues = matches
            self.tableView.reloadData()
        }
    }
}
