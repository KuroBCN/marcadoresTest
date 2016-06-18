//
//  MatchDetailTableViewController.swift
//  marcadores
//
//  Created by Pereiro, Delfin on 18/06/16.
//  Copyright © 2016 Pereiro, Delfin. All rights reserved.
//

import UIKit

class MatchDetailTableViewController: UITableViewController {

    var match : Match?
    var league : League?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.tableView.registerNib(UINib(nibName: String(MatchTableViewCell), bundle:nil), forCellReuseIdentifier: matchCellIdentifier)
        self.tableView.rowHeight = 80.0
        
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(MatchDetailTableViewController.reloadData), forControlEvents: UIControlEvents.ValueChanged)
        self.refreshControl = refreshControl
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Public methods
    func reloadData() {
        
        //        MatchDAO.getAllMatches { (matches) in
        self.refreshControl?.endRefreshing()
        //            self.leagues = matches
        self.tableView.reloadData()
        //        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let league = league{
            return league.matches.count
        }
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(matchCellIdentifier, forIndexPath: indexPath) as! MatchTableViewCell
        
        // Configure the cell...
        if let match = league?.matches[indexPath.row]{
            cell.configureCellWithMatch(match)
        }
        return cell
    }
}
