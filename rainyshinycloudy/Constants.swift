//
//  File.swift
//  rainyshinycloudy
//
//  Created by the Luckiest on 6/19/17.
//  Copyright © 2017 the Luckiest. All rights reserved.
//

import Foundation


let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE =  "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "bf5a69cff727620734fb6244829c1f87"

typealias DownloadComplete = () -> ()



func getCurrentWeatherUrl() -> String {
    return "\(BASE_URL)\(LATITUDE)\(Location.sharedInstance.latitude)\(LONGITUDE)\(Location.sharedInstance.longitude)\(APP_ID)\(API_KEY)"
}

func getForecastUrl() -> String {
    return "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude)&lon=\(Location.sharedInstance.longitude)&appid=\(API_KEY)"
}
