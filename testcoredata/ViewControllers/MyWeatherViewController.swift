//
//  MyWeatherViewController.swift
//  testcoredata
//
//  Created by Alexey on 27.01.2021.
//

import UIKit

class MyWeatherViewController: UIViewController {

    @IBOutlet weak var humidityLabelinViewController: UILabel!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
       
        
    
        
        
        
        
        super.viewDidLoad()
        
        
        
        
        
        
        tableView.dataSource = self
        tableView.delegate = self
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
extension MyWeatherViewController : UITableViewDelegate,UITableViewDataSource{
    
    
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
    
    
let cell = tableView.dequeueReusableCell(withIdentifier: "MyWeatherCell", for: indexPath) as! myWeatherTableViewCell
  
    cell.HumidityLabel.text = CachedWeather.UserData.humidity
    cell.PressureLabel.text = CachedWeather.UserData.pressure
    cell.feelslikelabel.text = CachedWeather.UserData.feels_like
    cell.templabel.text = CachedWeather.UserData.temp
    cell.tempMaxLabel.text = CachedWeather.UserData.temp_max
    cell.tempMinLabel.text = CachedWeather.UserData.temp_min
    
    

    let urlString = "https://api.openweathermap.org/data/2.5/weather?q=Moscow&appid=f2b80fed4993cfc6a0420f56cf78c325&units=metric"
    
     let url = URL(string:urlString)
    var w = MyWeather()
    URLSession.shared.dataTask(with: url!) { (data, response, error) in
        guard let data = data else { return }
        guard error == nil else { return }
        
      
        do {
            let myWeather  = try JSONDecoder().decode( MyWeather.self, from: data)
            DispatchQueue.main.async { w = myWeather
               // print("from block do \(w)")
                self.humidityLabelinViewController.text = w.main?.humidity.description
                cell.HumidityLabel.text = w.main?.humidity.description
                cell.PressureLabel.text = w.main?.pressure.description
                cell.feelslikelabel.text = w.main?.feels_like.description
                cell.templabel.text = w.main?.temp.description
                cell.tempMaxLabel.text = w.main?.temp_max.description
                cell.tempMinLabel.text = w.main?.temp_min.description
                let alertController = UIAlertController(title: "Обновлено!", message: "Актуальная погода обновлена", preferredStyle: .alert)
                let action1 = UIAlertAction(title: "ОК", style: .default) 
                
                alertController.addAction(action1)
                self.present(alertController, animated: true, completion: nil)
               
                CachedWeather.UserData.humidity = w.main?.humidity.description
                CachedWeather.UserData.pressure = w.main?.pressure.description
                CachedWeather.UserData.feels_like = w.main?.feels_like.description
                CachedWeather.UserData.temp = w.main?.temp.description
                CachedWeather.UserData.temp_max = w.main?.temp_max.description
                CachedWeather.UserData.temp_min = w.main?.temp_min.description
            }
        } catch let error { print( error)}
        
        }.resume()
   
   
        
        
       
    
    
    
      return cell
    
}
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
      
             return 1
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0;//Choose your custom row height
    }
  
}
