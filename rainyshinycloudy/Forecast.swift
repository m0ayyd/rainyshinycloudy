//
//  Forecast.swift
//  rainyshinycloudy
//
//  Created by the Luckiest on 6/19/17.
//  Copyright © 2017 the Luckiest. All rights reserved.
//

import UIKit
import Alamofire

class Forcast {
    var _date: String!
    var _weatherType: String!
    var _highTemp: String!
    var _lowTemp: String!
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var highTemp: String {
        if _highTemp == nil {
            _highTemp = ""
        }
        return _highTemp
    }
    
    var lowTemp: String {
        if _lowTemp == nil {
            _lowTemp = ""
        }
        return _lowTemp
    }
    
    init(weatherDict: [String:Any]) {
        if let temp = weatherDict["temp"] as? [String:Any] {
            
            if let min = temp["min"] as? Double {
                let celsius = round(min - 273.15)
                _lowTemp = "\(celsius)"
            }
            
            if let max = temp["max"] as? Double {
                let celsius = round(max - 273.15)
                _highTemp = "\(celsius)"
            }
        }
        
        if let weather = weatherDict["weather"] as? [[String:Any]] {
            if let main = weather[0]["main"] as? String {
                self._weatherType = main
            }
        }
        
        if let unixDate = weatherDict["dt"] as? Double {
            let date = Date(timeIntervalSince1970: unixDate)
            self._date = date.dayOfTheWeek()
        }
    }
}

extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
