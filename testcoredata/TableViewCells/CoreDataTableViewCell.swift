//
//  CoreDataTableViewCell.swift
//  testcoredata
//
//  Created by Alexey on 26.01.2021.
//

import UIKit

class CoreDataTableViewCell: UITableViewCell {

    @IBOutlet weak var SecondLabel: UILabel!
    @IBOutlet weak var ReadyButton: UIButton!
    @IBOutlet weak var Firstlabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func ReadyButtonClicked(_ sender: Any) {
        let imageTrue = UIImage(named: "true") as UIImage?
        let imageFalse = UIImage(named: "false") as UIImage?
        if ReadyButton.currentImage == imageTrue
        
        {ReadyButton.setImage(imageFalse, for: .normal)}
        else {ReadyButton.setImage(imageTrue, for: .normal)}
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
