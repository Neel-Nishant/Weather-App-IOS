//
//  ViewController.swift
//  Weather
//
//  Created by Neel Nishant on 26/09/16.
//  Copyright © 2016 Neel Nishant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var temperatureLbl: UILabel!
    @IBOutlet weak var windSpeedLbl: UILabel!
    @IBOutlet weak var humidityLbl: UILabel!
    @IBOutlet weak var mainDescLbl: UILabel!
    
    @IBOutlet weak var weatherImg: UIImageView!
    var weather: Weather!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weather = Weather()
        weather.downloadWeatherDetails { () -> () in
            self.updateUI()
        }
        
       
    }
   
    func updateUI(){
        temperatureLbl.text = "\(weather.temperature)º"
        windSpeedLbl.text = "\(weather.windSpeed)m/s"
        humidityLbl.text = "\(weather.humidity)%"
        mainDescLbl.text = weather.mainDesc
        weatherImg.image = UIImage(named: "\(weather.icon)")
        print("main: \(weather.mainDesc)")
        print("icon: \(weather.icon)")
        print("temp: \(weather.temperature)")
        print("humidity: \(weather.humidity)")
        print("windspeed: \(weather.windSpeed)")
    }
}

