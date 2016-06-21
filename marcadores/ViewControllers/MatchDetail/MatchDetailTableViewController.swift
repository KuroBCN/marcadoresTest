//
//  MatchDetailTableViewController.swift
//  marcadores
//
//  Created by Pereiro, Delfin on 18/06/16.
//  Copyright © 2016 Pereiro, Delfin. All rights reserved.
//

import UIKit
import GSKStretchyHeaderView

class MatchDetailTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var match : Match?
    var league : League?
//    var header : UIView?
    @IBOutlet weak var detailHeaderView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var headerHeightConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.tableView.registerNib(UINib(nibName: String(MatchTableViewCell), bundle:nil), forCellReuseIdentifier: matchCellIdentifier)
        self.tableView.rowHeight = 80.0
        
        self.edgesForExtendedLayout = UIRectEdge.None
        
        configureTableHeader()
        
//        configurePullToRefresh()
        
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
    
    func loadTournamentMatches(){
        
        if let tournamentId = match?.tournamentId {
            MatchDAO.getAllMatchesFromTournament(tournamentId) { (matches) in
//                self.refreshControl?.endRefreshing()
                self.league = matches.first
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Private methods
    
    private func configureNavigationBar() {
        
        if let match =  self.match {
            let title = match.homeTeam.shortName+" - "+match.visitorTeam.shortName
            self.navigationItem.title = title            
        }
    }
    
    func configureTableHeader(){
   
        let nibview = NSBundle.mainBundle().loadNibNamed(String(MatchDetailHeaderViewViewController), owner: nil, options: nil)
        if let header = nibview.first as? MatchDetailHeaderViewViewController {
//            header.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
            header.configHeaderWithMatch(self.match!)
            header.isAccessibilityElement = false
//            self.tableView.tableHeaderView = header
            //            self.tableView.addSubview(header)
//            self.detailHeaderView = header
//            self.detailHeaderView.addSubview(header)
//            tableView.contentInset = UIEdgeInsetsMake(header.frame.height, 0, 0, 0)
        }
        
}
    
    private func configurePullToRefresh(){
//        let refreshControl = UIRefreshControl()
//        refreshControl.addTarget(self, action: #selector(MatchDetailTableViewController.loadTournamentMatches), forControlEvents: UIControlEvents.ValueChanged)
//        tab.refreshControl = refreshControl
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        print(offset)
        var avatarTransform = CATransform3DIdentity
        var headerTransform = CATransform3DIdentity
//        if let header = self.tableView.tableHeaderView {
            if offset > 0 {
//                let headerScaleFactor:CGFloat = -(offset) / header.bounds.height
//                let headerSizevariation = ((header.bounds.height * (1.0 + headerScaleFactor)) - header.bounds.height)/2.0
//                headerTransform = CATransform3DTranslate(headerTransform, 0, headerSizevariation, 0)
//                headerTransform = CATransform3DScale(headerTransform, 1.0 + headerScaleFactor, 1.0 + headerScaleFactor, 0)
//                header.layer.transform = headerTransform
//            } else {
                var offset_HeaderStop : CGFloat = 0.0
                var segmentViewOffset = detailHeaderView.frame.height - offset - offset_HeaderStop
                segmentViewOffset = offset
//                headerTransform = CATransform3DTranslate(headerTransform, 0, max(segmentViewOffset, -offset_HeaderStop), 0)
        
            
        
                let set = (200 - offset)
                if set > 64.0 {
                    print(detailHeaderView.frame.height)
                    headerHeightConstraint.constant = set
                    detailHeaderView.layoutIfNeeded()
                }
//                headerTransform = CATransform3DScale(headerTransform, 0,set, 0)
//                header.layer.transform = headerTransform
//                self.detailHeaderView.layer.transform = headerTransform
//            }
        }
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let league = league{
            return league.matches.count
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(matchCellIdentifier, forIndexPath: indexPath) as! MatchTableViewCell
        
        // Configure the cell...
        if let match = league?.matches[indexPath.row]{
            cell.configureCellWithMatch(match)
            cell.selectionStyle = .None
        }
        return cell
    }
}
