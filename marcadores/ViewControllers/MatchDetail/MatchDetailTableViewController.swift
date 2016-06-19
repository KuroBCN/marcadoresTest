//
//  MatchDetailTableViewController.swift
//  marcadores
//
//  Created by Pereiro, Delfin on 18/06/16.
//  Copyright © 2016 Pereiro, Delfin. All rights reserved.
//

import UIKit
import GSKStretchyHeaderView

class MatchDetailTableViewController: UITableViewController {

    var match : Match?
    var league : League?
    var header : GSKStretchyHeaderView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.tableView.registerNib(UINib(nibName: String(MatchTableViewCell), bundle:nil), forCellReuseIdentifier: matchCellIdentifier)
        self.tableView.rowHeight = 80.0
        
        let nibview = NSBundle.mainBundle().loadNibNamed(String(MatchDetailHeaderViewViewController), owner: nil, options: nil)        
        if let header = nibview.first as? MatchDetailHeaderViewViewController {
            header.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
            header.configHeaderWithMatch(self.match!)
            self.tableView.addSubview(header)
        }
        
        configurePullToRefresh()
        
        loadTournamentMatches()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
    }
    
    // MARK: - Public methods
    func reloadData() {
        
        //        MatchDAO.getAllMatches { (matches) in
        self.refreshControl?.endRefreshing()
        //            self.leagues = matches
        self.tableView.reloadData()
        //        }
    }
    
    // MARK: - Private methodsx
    
    private func configureNavigationBar() {
        
        if let match =  self.match {
            let title = match.homeTeam.shortName+" - "+match.visitorTeam.shortName
            self.navigationItem.title = title            
        }
    }
    
    private func configurePullToRefresh(){
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(MatchesTableViewController.reloadData), forControlEvents: UIControlEvents.ValueChanged)
        self.refreshControl = refreshControl
    }
    
    private func loadTournamentMatches(){
        
        if let tournamentId = match?.tournamentId {
            MatchDAO.getAllMatchesFromTournament(tournamentId) { (matches) in
                self.refreshControl?.endRefreshing()
                self.league = matches.first
                self.tableView.reloadData()
            }
        }
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
            cell.selectionStyle = .None
        }
        return cell
    }
}
