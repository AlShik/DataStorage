//
//  EntryPointViewController.swift
//  testcoredata
//
//  Created by Alexey on 26.01.2021.
//

import UIKit

class EntryPointViewController: UIViewController {

    @IBOutlet weak var UserDefaultsButton: UIButton!
    
    @IBOutlet weak var MyWeatherButton: UIButton!
    
    override func viewDidLoad() {
        UserDefaultsButton.layer.cornerRadius = 20
        UserDefaultsButton.layer.masksToBounds = true
        MyWeatherButton.layer.cornerRadius = 20
        MyWeatherButton.layer.masksToBounds = true
        
        super.view.addSubview(UserDefaultsButton)
        super.view.addSubview(MyWeatherButton )
        super.viewDidLoad()
      
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
