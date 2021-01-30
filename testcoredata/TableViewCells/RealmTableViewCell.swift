//
//  RealmTableViewCell.swift
//  testcoredata
//
//  Created by Alexey on 26.01.2021.
//

import UIKit

class RealmTableViewCell: UITableViewCell {
    @IBOutlet weak var Firstlabel: UILabel!
    
    @IBOutlet weak var Button: UIButton!
    @IBOutlet weak var SecondLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func buttonclick(_ sender: Any) {
        let imageTrue = UIImage(named: "true") as UIImage?
        let imageFalse = UIImage(named: "false") as UIImage?
        if Button.currentImage == imageTrue
        
        {Button.setImage(imageFalse, for: .normal)}
        else {Button.setImage(imageTrue, for: .normal)}
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
