//
//  ViewController.swift
//  testcoredata
//
//  Created by Alexey on 26.01.2021.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var textfield: UITextField!
    @IBOutlet var button: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
     
        // Do any additional setup after loading the view.
    }
    @IBAction func deleteclicked(_ sender: Any) {
        
        DataHandling.DeleteFromCoreData(taskname: textfield.text!)
    }
    @IBAction func fetchclicked(_ sender: Any) {
        
        DataHandling.fetchFromCoreData()
    }
    
    @IBAction func buttonclicked(_ sender: Any) {
        
        DataHandling.addTaskIntoCoreData(taskname: textfield.text!)
        print("good")
    }
    
}

class  DataHandling : NSObject {
   
   static  func addTaskIntoCoreData(taskname : String) {
       var people: [NSManagedObject] = []
       guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
           return
         }
         
         // 1
         let managedContext =
           appDelegate.persistentContainer.viewContext
         
         // 2
         let entity =
           NSEntityDescription.entity(forEntityName: "Task",
                                      in: managedContext)!
         
         let task = NSManagedObject(entity: entity,
                                      insertInto: managedContext)
         
         // 3
         task.setValue(taskname, forKeyPath: "title")
    
         // 4
         do {
           try managedContext.save()
           people.append(task)
         } catch let error as NSError {
           print("Could not save. \(error), \(error.userInfo)")
         }
       }
    static func fetchFromCoreData() {
        
    guard let appDelegate =
        UIApplication.shared.delegate as? AppDelegate else {
          return
      }
      
      let managedContext =
        appDelegate.persistentContainer.viewContext
      
      //2
      let fetchRequest =
        NSFetchRequest<NSManagedObject>(entityName: "Task" )
        fetchRequest.returnsObjectsAsFaults = false
       
      //3
      do {
        let tasks = try managedContext.fetch(fetchRequest)
        for (task) in tasks{
            print( (task.value(forKey: "title") ?? "no rec"))
        }
        
      } catch let error as NSError {
        print("Could not fetch. \(error), \(error.userInfo)")
      }
        
       
        
    
    }
    static func DeleteFromCoreData(taskname : String) {
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
              return
          }
          
          let managedContext =
            appDelegate.persistentContainer.viewContext
          
          //2
          let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Task" )
        fetchRequest.predicate = NSPredicate(format: "title = %@", taskname)
        
        do {
            
            let tasks = try managedContext.fetch(fetchRequest)
            
            let objToDelete = tasks[0] as! NSManagedObject
            managedContext.delete(objToDelete)
            
            do {
                try managedContext.save()
            }
            catch {
                print (error)
            }
        }
        catch
        {
            print (error)
        }
        
    }
}

