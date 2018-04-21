//
//  StudentCell.swift
//  Lab4
//
//  Created by Marek Kozłowski on 17/04/2018.
//  Copyright © 2018 Marek Kozłowski. All rights reserved.
//

import UIKit

class StudentCell: UITableViewCell {
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var indexNumber: UILabel!
    @IBOutlet weak var points: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
