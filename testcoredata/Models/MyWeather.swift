//
//  MyWeather.swift
//  testcoredata
//
//  Created by Alexey on 28.01.2021.
//

import Foundation
import UIKit

struct MyWeather : Decodable {
    var main : Main?
    
}

struct Main : Decodable {
    var temp : Float
    var feels_like : Float
    var temp_min : Float
    var temp_max : Float
    var pressure : Float
    var humidity : Float
}


class CachedWeather {
    static let UserData = CachedWeather()
    
    private let kUserNamekey = "Data.UserName"
    private let kUserSurnamekey = "Data.Surname"
    private let ktemp = "CachedWeather.temp"
    private let kfeels_like = "CachedWeather.feels_like"
    private let ktemp_min = "CachedWeather.temp_min"
    private let ktemp_max = "CachedWeather.temp_max"
    private let kpressure = "CachedWeather.pressure"
    private let khumidity = "CachedWeather.humidity"
    
    var temp : String? {
        set { UserDefaults.standard.set(newValue, forKey: ktemp)}
        get { return UserDefaults.standard.string (forKey: ktemp)}
    }
    
    var feels_like : String? {
        set { UserDefaults.standard.set(newValue, forKey: kfeels_like)}
        get { return UserDefaults.standard.string (forKey: kfeels_like)}
    }
    var temp_min : String? {
        set { UserDefaults.standard.set(newValue, forKey: ktemp_min)}
        get { return UserDefaults.standard.string (forKey: ktemp_min)}
    }
    var temp_max : String? {
        set { UserDefaults.standard.set(newValue, forKey: ktemp_max)}
        get { return UserDefaults.standard.string (forKey: ktemp_max)}
    }
    var pressure : String? {
        set { UserDefaults.standard.set(newValue, forKey: kpressure)}
        get { return UserDefaults.standard.string (forKey: kpressure)}
    }
    var humidity : String? {
        set { UserDefaults.standard.set(newValue, forKey: khumidity)}
        get { return UserDefaults.standard.string (forKey: khumidity)}
    }
    
    
    

    static func parsingWeatherJson() ->  MyWeather  {
        var returnedWeather : MyWeather? = nil
        
            
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=Moscow&appid=f2b80fed4993cfc6a0420f56cf78c325&units=metric"
        guard let url = URL(string:urlString) else { return returnedWeather!}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            guard error == nil else { return }
            
          
            do {
                let myWeather  = try JSONDecoder().decode( MyWeather.self, from: data)
                
                
                    returnedWeather = myWeather
                // print(returnedWeather)
              
            
                
            } catch let error { print( error)}
            
            }.resume()
        
       
        return returnedWeather!
        }
}
