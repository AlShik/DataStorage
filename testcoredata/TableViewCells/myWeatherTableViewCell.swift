//
//  myWeatherTableViewCell.swift
//  testcoredata
//
//  Created by Alexey on 28.01.2021.
//

import UIKit

class myWeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var HumidityLabel: UILabel!
    @IBOutlet weak var PressureLabel: UILabel!
    @IBOutlet weak var tempMaxLabel: UILabel!
    @IBOutlet weak var tempMinLabel: UILabel!
    @IBOutlet weak var feelslikelabel: UILabel!
    @IBOutlet weak var templabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
