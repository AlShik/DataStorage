//
//  UserDefaultsModel.swift
//  testcoredata
//
//  Created by Alexey on 26.01.2021.
//

import Foundation

class Data {
    static let UserData = Data()
    
    private let kUserNamekey = "Data.UserName"
    private let kUserSurnamekey = "Data.Surname"
    
    
    var UserName : String? {
        set { UserDefaults.standard.set(newValue, forKey: kUserNamekey)}
        get { return UserDefaults.standard.string (forKey: kUserNamekey)}
    }
    
    var SurName : String? {
        set { UserDefaults.standard.set(newValue, forKey: kUserSurnamekey)}
        get { return UserDefaults.standard.string (forKey: kUserSurnamekey)}
    }
    
    

}
