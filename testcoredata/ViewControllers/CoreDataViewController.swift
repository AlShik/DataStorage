//
//  CoreDataViewController.swift
//  testcoredata
//
//  Created by Alexey on 26.01.2021.
//

import UIKit

class CoreDataViewController: UIViewController {
    var SelectedLabelForDelete : String = ""
   
    var FetchedArray : [String] = []
    @IBOutlet weak var AddTextfield: UITextField!
    var numbers : [Int] = []
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        FetchedArray =  CoreDataDataHandling.fetchFromCoreData()
        
       
        super.viewDidLoad()
        tableView.delegate = self

        tableView.dataSource = self
        tableView.reloadData()
        // Do any additional setup after loading the view.
    }
    @IBAction func AddbuttonClicked(_ sender: Any) {
        if AddTextfield.text == "" {AddTextfield.placeholder = "Add Task!!!"}
        else {
        CoreDataDataHandling.addTaskIntoCoreData(taskname: AddTextfield.text!)
            FetchedArray = CoreDataDataHandling.fetchFromCoreData() 
       // print (CoreDataDataHandling.fetchFromCoreData())
        }
        DispatchQueue.main.async{self.tableView.reloadData()}
        
    }
    @IBAction func DeleteButtomClicked(_ sender: Any) {
        CoreDataDataHandling.DeleteFromCoreData(taskname: SelectedLabelForDelete)
        FetchedArray = CoreDataDataHandling.fetchFromCoreData() 
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
        
    }
    

}

extension CoreDataViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           
        let selectedItem = tableView.cellForRow(at:  indexPath) as! CoreDataTableViewCell
        
        SelectedLabelForDelete = selectedItem.SecondLabel.text!
        
        
       }
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

let cell = tableView.dequeueReusableCell(withIdentifier: "CoreDataCell", for: indexPath) as! CoreDataTableViewCell
    cell.Firstlabel.textColor = .systemBlue
    
  
    if FetchedArray.count == 0 {  numbers.append(1) }
    else
    { numbers = Array (1...FetchedArray.count)}
    
    
   cell.Firstlabel.text = numbers[indexPath.row].description + "."
    cell.SecondLabel.text = FetchedArray [indexPath.row].description
//print(FetchedArray)
return cell
   
}
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       switch tableView {
          case self.tableView:
            print(FetchedArray.count)
            return FetchedArray.count
            
           default:
             return 0
            
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
      
         
                
            let selectedItem = tableView.cellForRow(at:  indexPath) as! CoreDataTableViewCell
            SelectedLabelForDelete = selectedItem.SecondLabel.text!
            print(SelectedLabelForDelete)
            CoreDataDataHandling.DeleteFromCoreData(taskname: SelectedLabelForDelete)
        FetchedArray =  CoreDataDataHandling.fetchFromCoreData()
            self.tableView.deleteRows(at: [indexPath], with: .fade)
         
    
}
    
}

