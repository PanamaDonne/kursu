//
//  MainViewTableViewCell.swift
//  kursu
//
//  Created by Daniel Hansson on 19/05/16.
//  Copyright © 2016 PanamaDonne. All rights reserved.
//

import UIKit

class MainViewTableViewCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var distanceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        titleLabel.text = "Title Label"
        distanceLabel.text = "500m"


    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
