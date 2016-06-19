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
    }
    
    
    func configHeaderWithMatch ( match : Match){
        homeTeamLogoImageView.sd_setImageWithURL(NSURL(string: match.homeTeam.logoUrl))
        visitorTeamLogoImageView.sd_setImageWithURL(NSURL(string: match.visitorTeam.logoUrl))
    }
    
//    CGFloat alpha = CGFloatTranslateRange(stretchFactor, 0.2, 0.8, 0, 1);
//    alpha = MAX(0, MIN(1, alpha));
//    
//    self.userImage.alpha = alpha;
//    self.userNameLabel.alpha = alpha;
//    
//    if (kNavBar) {
//    self.backgroundImageView.alpha = alpha;
//    
//    CGFloat navTitleFactor = 0.4;
//    CGFloat navTitleAlpha = 0;
//    if (stretchFactor < navTitleFactor) {
//    navTitleAlpha = CGFloatTranslateRange(stretchFactor, 0, navTitleFactor, 1, 0);
//    }
//    self.navigationTitleLabel.alpha = navTitleAlpha;
//    }
}
