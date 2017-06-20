//
//  CurrentWethear.swift
//  rainyshinycloudy
//
//  Created by the Luckiest on 6/19/17.
//  Copyright © 2017 the Luckiest. All rights reserved.
//

import UIKit
import Alamofire


class CurrentWeather {
    private var _cityName: String!
    private var _date: String!
    private var _weatherType: String!
    private var _currentTemp: Double!
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        _date = "Today, \(currentDate)"
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            return 0.0
        }
        return _currentTemp
    }
    
    func downloadWeatherDatails(completed: @escaping DownloadComplete){
        //Alamofire Download
        let currentURL = URL(string: getCurrentWeatherUrl())!
        Alamofire.request(currentURL).responseJSON { response in
            let result = response.result
            if let dict = result.value as? [String: Any] {
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                    print(self._cityName)
                }
                
                if let weather = dict["weather"] as? [[String:Any]] {
                    
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                        print(self._weatherType)
                    }
                }
                
                if let main = dict["main"] as? [String:Any] {
                    
                    if let temp = main["temp"] as? Double {
                        let celsius = round(temp - 273.15)
                        self._currentTemp = celsius
                        print(self._currentTemp)
                    }
                }
            }
            completed()
        }
    }
    
}
