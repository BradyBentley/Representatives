//
//  RepresentativeTableViewCell.swift
//  RepresentativeProject
//
//  Created by Brady Bentley on 12/13/18.
//  Copyright © 2018 Brady. All rights reserved.
//

import UIKit

class RepresentativeTableViewCell: UITableViewCell {

    // MARK: - Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    var representative: Representative? {
        didSet{
            updateView()
            
        }
    }
    
    func updateView() {
        guard let representative = representative else { return }
        nameLabel.text = representative.name
        partyLabel.text = representative.party
        districtLabel.text = representative.district
        websiteLabel.text = representative.link
        phoneLabel.text = representative.phone
    }
    
}
