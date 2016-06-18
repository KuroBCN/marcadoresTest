//
//  MatchesTableViewController.swift
//  marcadores
//
//  Created by Pereiro, Delfin on 18/06/16.
//  Copyright © 2016 Pereiro, Delfin. All rights reserved.
//

import UIKit

class MatchesTableViewController: UITableViewController {
    
    var leagues = [League]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        configurePullToRefresh()
        
        // Register cells
        self.tableView.registerNib(UINib(nibName: String(MatchTableViewCell), bundle:nil), forCellReuseIdentifier: matchCellIdentifier)
        
        self.tableView.rowHeight = 80.0
        
        reloadData()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Public methods
    func reloadData() {
        
        MatchDAO.getAllMatches { (matches) in
            self.refreshControl?.endRefreshing()
            self.leagues = matches
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Private methods
    
    private func configureNavigationBar() {
        self.navigationItem.title = "Matches"
    }
    
    private func configurePullToRefresh(){
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(MatchesTableViewController.reloadData), forControlEvents: UIControlEvents.ValueChanged)
        self.refreshControl = refreshControl
    }
    
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return leagues.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return leagues[section].matches.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return leagues[section].name
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(matchCellIdentifier, forIndexPath: indexPath) as! MatchTableViewCell
        
        // Configure the cell...
        let match = leagues[indexPath.section].matches[indexPath.row]
        cell.configureCellWithMatch(match)
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        let vc = MatchDetailTableViewController(nibName: String(MatchDetailTableViewController), bundle: nil)
//        let league = leagues[indexPath.section]
//        vc.league = league
//        vc.match = league.matches[indexPath.row]
//        self.navigationController?.pushViewController(vc, animated: true)
    }
}
