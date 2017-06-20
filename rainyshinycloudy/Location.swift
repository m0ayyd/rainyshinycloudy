//
//  Location.swift
//  rainyshinycloudy
//
//  Created by the Luckiest on 6/20/17.
//  Copyright © 2017 the Luckiest. All rights reserved.
//

import Foundation
import CoreLocation
class Location {
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
    
}
