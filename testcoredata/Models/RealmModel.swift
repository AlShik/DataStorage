//
//  RealmModel.swift
//  testcoredata
//
//  Created by Alexey on 26.01.2021.
//

import Foundation

import RealmSwift




class toDolistRealmData : Object {
    @objc dynamic var ToDoRecord = ""
    
    
     
}

class ToDoListRealmDatasourse {
    static let     shared = ToDoListRealmDatasourse()
    private let realm = try! Realm()
    
    func addrecord(ToDoRecord :String)  {
        
        let myData = toDolistRealmData()
        
        myData.ToDoRecord = ToDoRecord
       try! realm.write {realm.add(myData)}
    }
    
    
    func showRealmData() -> [String] {
        let allData = realm.objects(toDolistRealmData.self)
        var Array : [String] = []
        for data in allData{
            Array.append(data.ToDoRecord)
        }
          return Array
        
    }
    func deleteRealmData(object : String) {
        let allData = realm.objects(toDolistRealmData.self)
        let S = "ToDoRecord == '" + object + "'"
        if let DelIndex = allData.filter(S).first    {
            try! realm.write {realm.delete(DelIndex)
                  print(S)
             
        }
        }
        
        }
    }
            
