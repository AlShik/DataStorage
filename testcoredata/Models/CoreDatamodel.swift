//
//  CoreDatamodel.swift
//  testcoredata
//
//  Created by Alexey on 26.01.2021.
//

import Foundation
import CoreData
import UIKit

class  CoreDataDataHandling : NSObject {
   
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
    static func fetchFromCoreData()-> [String] {
        var fetchedArray : [String] = []
         guard let appDelegate =
        UIApplication.shared.delegate as? AppDelegate else {
            return fetchedArray}
      
      let managedContext =
        appDelegate.persistentContainer.viewContext
      
      //2
      let fetchRequest =
        NSFetchRequest<NSManagedObject>(entityName: "Task" )
         fetchRequest.propertiesToFetch = ["title"]
        fetchRequest.resultType = .managedObjectResultType
       fetchRequest.returnsObjectsAsFaults = false
       
      //3
      do {
        let tasks = try managedContext.fetch(fetchRequest)
        
          for task in tasks{
          
            fetchedArray.append(task.value(forKey: "title") as! String)
            
        }
        
      } catch let error as NSError {
        print("Could not fetch. \(error), \(error.userInfo)")
      }
        return fetchedArray
       
        
    
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
