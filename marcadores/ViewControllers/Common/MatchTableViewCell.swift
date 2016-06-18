//
//  MatchTableViewCell.swift
//  marcadores
//
//  Created by Pereiro, Delfin on 18/06/16.
//  Copyright © 2016 Pereiro, Delfin. All rights reserved.
//

import UIKit
import SDWebImage

class MatchTableViewCell: UITableViewCell {

    @IBOutlet weak var homeTeamLogoImageView: UIImageView!
    @IBOutlet weak var visitorTeamLogoImageView: UIImageView!
    @IBOutlet weak var homeTeamNameLabel: UILabel!
    @IBOutlet weak var visitorTeamNameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureCellWithMatch( match : Match ){
        
        homeTeamLogoImageView.sd_setImageWithURL(NSURL(string: match.homeTeam.logoUrl))
        visitorTeamLogoImageView.sd_setImageWithURL(NSURL(string: match.visitorTeam.logoUrl))
        homeTeamNameLabel.text = match.homeTeam.name
        visitorTeamNameLabel.text = match.visitorTeam.name
        
        var score = "-"
        if match.statusShortDesc != "NS" {
            score = match.homeTeam.result! + " - " + match.visitorTeam.result!
        }
        
        scoreLabel.text = score
    }
}
