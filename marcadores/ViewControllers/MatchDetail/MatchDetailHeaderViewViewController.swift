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

    @IBOutlet weak var homeTeamLogoImageView: UIImageView!
    @IBOutlet weak var visitorTeamLogoImageView: UIImageView!
    @IBOutlet weak var filterView: UIView!    
    @IBOutlet weak var teamsNamesContainerView: UIView!
    @IBOutlet weak var homeTeamNameLabel: UILabel!
    @IBOutlet weak var visitorTeamNameLabel: UILabel!
    
    @IBOutlet weak var containerViewConstraintHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.maximumContentHeight = 200.0
        self.minimumContentHeight = 64.0
        filterView.backgroundColor = UIColor.marcadoresGreen()
        filterView.alpha = 0.5
        
//        self.contentView.backgroundColor = [UIColor colorWithWhite:0.2 alpha:1];
//        if (kNavBar) {
//            self.minimumContentHeight = 64;
//        } else {
//            self.navigationTitleLabel.hidden = YES;
//        }
    }
    
    override func didChangeStretchFactor(stretchFactor: CGFloat) {
        var alpha = CGFloatInterpolate(stretchFactor, 1.0, 0.7)
        alpha = max(0, min(1, alpha));
        filterView.alpha = alpha
        
        var teamsNamesAlpha = CGFloatInterpolate(stretchFactor, 0.0, 1.0)
        teamsNamesAlpha = max(0, min(1, teamsNamesAlpha));
        teamsNamesContainerView.alpha = teamsNamesAlpha
        
        let containerHeight = CGFloatInterpolate(stretchFactor, 50.0, 80.0)
        containerViewConstraintHeight.constant = containerHeight
        self.layoutIfNeeded()
    }
    
    // MARK: - Public methods
    func configHeaderWithMatch ( match : Match){
        homeTeamLogoImageView.sd_setImageWithURL(NSURL(string: match.homeTeam.logoUrl))
        visitorTeamLogoImageView.sd_setImageWithURL(NSURL(string: match.visitorTeam.logoUrl))
        homeTeamNameLabel.text = match.homeTeam.name
        visitorTeamNameLabel.text = match.visitorTeam.name
    }
}
