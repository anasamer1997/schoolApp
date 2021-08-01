//
//  SchoolCell.swift
//  schoolApp
//
//  Created by mac on 12/07/2021.
//

import UIKit

class SchoolCell: UITableViewCell {

 
    @IBOutlet weak var schoolName: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var gender: UILabel!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
