//
//  WeatherCell.swift
//  rainyshinycloudy
//
//  Created by the Luckiest on 6/20/17.
//  Copyright © 2017 the Luckiest. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var weatherTypeLbl: UILabel!
    @IBOutlet weak var maxLbl: UILabel!
    @IBOutlet weak var minLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(forecast: Forcast){
        dateLbl.text = forecast.date
        maxLbl.text = forecast.highTemp
        minLbl.text = forecast.lowTemp
        weatherTypeLbl.text = forecast.weatherType
        weatherIcon.image = UIImage(named: forecast.weatherType)
    }

}
