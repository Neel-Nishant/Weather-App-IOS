//
//  Weather.swift
//  Weather
//
//  Created by Neel Nishant on 26/09/16.
//  Copyright © 2016 Neel Nishant. All rights reserved.
//

import Foundation
import Alamofire

class Weather {
    private var _mainDesc: String!
    private var _temperature: Int!
    private var _humidity: Int!
    private var _windSpeed: Double!
    private var _icon: String!
    private var _URL: String!
    private var _location: String!
    
    var mainDesc: String{
        if _mainDesc == nil{
            return ""
        }
        return _mainDesc
    }
    var temperature: Int{
        if _temperature == nil{
            return 0
        }
        return _temperature
    }
    var humidity: Int{
        if _humidity == nil{
            return 0
        }
        return _humidity
    }
    var windSpeed: Double{
        if _windSpeed == nil{
            return 0.00
        }
        return _windSpeed
    }
    var icon: String{
        if _icon == nil{
            return ""
        }
        return _icon
    }
   
    init (){
        
    }
    
    func downloadWeatherDetails(completed: DownloadComplete) {
        print(URL_BASE)
        let url = NSURL(string:URL_BASE)!
        Alamofire.request(.GET, url).responseJSON {
            response in
            
            let result = response.result
            
            if let dict = result.value as? Dictionary<String,AnyObject> {
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] where weather.count > 0
                {
                    if let desc = weather[0]["main"] as? String {
                        self._mainDesc = desc
                    }
                    if let icon = weather[0]["icon"] as? String {
                        self._icon = icon
                    }
                }
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    if let temperature = main["temp"] as? Double{
                        self._temperature = (Int)(temperature - 273.15)
                    }
                    if let humidity = main["humidity"] as? Int{
                        self._humidity = humidity
                    }
                }
                if let wind = dict["wind"] as? Dictionary<String, Double> {
                    if let speed = wind["speed"] {
                        self._windSpeed = speed
                    }
                }
               
            }
          completed()
        }
        
    }
    
}