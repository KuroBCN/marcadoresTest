//
//  MatchDetailHeaderViewViewController.swift
//  marcadores
//
//  Created by Pereiro, Delfin on 18/06/16.
//  Copyright © 2016 Pereiro, Delfin. All rights reserved.
//

import UIKit
import GSKStretchyHeaderView

class MatchDetailHeaderViewViewController: GSKStretchyHeaderView {

    private let maxFilterAlpha : CGFloat = 0.8
    private let maxContainerHeight : CGFloat = 80.0
    private let minContainerHeight : CGFloat = 50.0
    
    @IBOutlet weak var homeTeamLogoImageView: UIImageView!
    @IBOutlet weak var visitorTeamLogoImageView: UIImageView!
    @IBOutlet weak var filterView: UIView!    
    @IBOutlet weak var teamsNamesContainerView: UIView!
    @IBOutlet weak var homeTeamNameLabel: UILabel!
    @IBOutlet weak var visitorTeamNameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var containerViewConstraintHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.maximumContentHeight = 136.0
        self.minimumContentHeight = 64.0
        filterView.backgroundColor = UIColor.marcadoresGreen()
        filterView.alpha = maxFilterAlpha
        statusLabel.alpha = 0.6
    }
    
    override func didChangeStretchFactor(stretchFactor: CGFloat) {
        var alpha = CGFloatInterpolate(stretchFactor, 1.0, maxFilterAlpha)
        alpha = max(maxFilterAlpha, min(1, alpha));
        filterView.alpha = alpha
        
        var teamsNamesAlpha = CGFloatInterpolate(stretchFactor, 0.0, 1.0)
        teamsNamesAlpha = max(0, min(1, teamsNamesAlpha));
        teamsNamesContainerView.alpha = teamsNamesAlpha
        
        var containerHeight = CGFloatInterpolate(stretchFactor, minContainerHeight, maxContainerHeight)
        containerHeight = max(minContainerHeight, min(maxContainerHeight, containerHeight))
        containerViewConstraintHeight.constant = containerHeight
        self.layoutIfNeeded()
    }
    
    // MARK: - Public methods
    func configHeaderWithMatch ( match : Match){
        homeTeamLogoImageView.sd_setImageWithURL(NSURL(string: match.homeTeam.logoUrl))
        visitorTeamLogoImageView.sd_setImageWithURL(NSURL(string: match.visitorTeam.logoUrl))
        homeTeamNameLabel.text = match.homeTeam.name
        visitorTeamNameLabel.text = match.visitorTeam.name
        statusLabel.text = match.statusShortDesc
    }
}
