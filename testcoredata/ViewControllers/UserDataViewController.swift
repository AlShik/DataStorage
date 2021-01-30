//
//  UserDataViewController.swift
//  testcoredata
//
//  Created by Alexey on 26.01.2021.
//

import UIKit

class UserDataViewController: UIViewController {

    @IBOutlet weak var nametextfield: UITextField!
    @IBOutlet weak var Surnamefield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        nametextfield.text = Data.UserData.UserName
        Surnamefield.text = Data.UserData.SurName
        super.viewDidLoad()
       
       
    }
    @IBAction func Surnameedit(_ sender: Any) {
        
        Data.UserData.SurName = Surnamefield.text!
       // print(Data.UserData.SurName ?? "00")
        
    }
    @IBAction func Editingname(_ sender: Any) {
        
        Data.UserData.UserName = nametextfield.text!
       // print (Data.UserData.UserName ?? "0")
        
        
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

