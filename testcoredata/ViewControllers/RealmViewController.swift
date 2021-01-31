//
//  RealmViewController.swift
//  testcoredata
//
//  Created by Alexey on 26.01.2021.
//

import UIKit

class RealmViewController: UIViewController {

    @IBOutlet weak var deletebutton: UIBarButtonItem!
    @IBOutlet weak var TaskTextField: UITextField!
    var SelectedLabelForDelete : String = ""
    @IBOutlet weak var tableView: UITableView!
    var a : [String] = []
    var numbers : [Int] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self

        tableView.dataSource = self
        
       
      
       
    }
    
    @IBAction func addrecordbuttonpushed(_ sender: Any) {
        if TaskTextField.hasText {
            ToDoListRealmDatasourse.shared.addrecord(ToDoRecord: TaskTextField.text!)
            DispatchQueue.main.async{self.tableView.reloadData()}
            
        }
        else {TaskTextField.placeholder = "Add a Task!!!"}
  
        
    }
    
    
    @IBAction func RemoveButtonPushed(_ sender: Any) {
        
        
        
           
             
                 ToDoListRealmDatasourse.shared.deleteRealmData(object: SelectedLabelForDelete)
        DispatchQueue.main.async{self.tableView.reloadData()}
        }
        
    }
    
 



    

extension RealmViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           
        let selectedItem = tableView.cellForRow(at:  indexPath) as! RealmTableViewCell
        
        SelectedLabelForDelete = selectedItem.SecondLabel.text!
        
        
       }
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RealmTableViewCell
    cell.Firstlabel.textColor = .systemBlue
    
    if ToDoListRealmDatasourse.shared.showRealmData().count == 0 {numbers.append(1) }
    else
    { numbers = Array (1...ToDoListRealmDatasourse.shared.showRealmData().count)}
   // self.tableView.reloadData()
    
   cell.Firstlabel.text = numbers[ indexPath.row].description + "."
    cell.SecondLabel.text = ToDoListRealmDatasourse.shared.showRealmData()[indexPath.row]

return cell
   
}
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch tableView {
          case self.tableView:
            return ToDoListRealmDatasourse.shared.showRealmData().count
            
           default:
             return 0
            
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
      
         
                
            let selectedItem = tableView.cellForRow(at:  indexPath) as! RealmTableViewCell
            SelectedLabelForDelete = selectedItem.SecondLabel.text!
            print(SelectedLabelForDelete)
        ToDoListRealmDatasourse.shared.deleteRealmData(object: SelectedLabelForDelete)
            
       
            self.tableView.deleteRows(at: [indexPath], with: .fade)
         
    
}
}
