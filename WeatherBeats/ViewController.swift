//
//  ViewController.swift
//  WeatherBeats
//
//  Created by Jaeson Booker on 8/2/19.
//  Copyright © 2019 Jaeson Booker. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    @IBOutlet weak var backgroundImage: UIImageView!
    var weatherData: [Weather] = []
    var apiKey: String = ""
    var lat: Double = 0
    var longi: Double = 0
    var locationManager = CLLocationManager()
    @IBAction func happyButtonPressed(_ sender: Any) {
    }
    @IBAction func sadButtonPressed(_ sender: Any) {
    }
    override func viewDidLoad() {
        if locationManager.location?.coordinate != nil {
            lat = (locationManager.location?.coordinate.latitude)!
            longi = (locationManager.location?.coordinate.longitude)!
        }
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=" + String(lat) + "&lon=" + String(longi) + "&APPID=" + apiKey) else { return }
        print(url)
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            do {
                let apiEvent = try JSONDecoder().decode(Weather.self, from: data)
                self.weatherData.append(apiEvent)
            } catch { }
            DispatchQueue.main.async {
                if self.weatherData[0].weather[0].main == "Clouds" {
                    self.backgroundImage.image = UIImage(named: "cloudy")
                }
                if self.weatherData[0].weather[0].main == "Rain" {
                    self.backgroundImage.image = UIImage(named: "rain")
                }
                if self.weatherData[0].weather[0].main == "Sunny" {
                    self.backgroundImage.image = UIImage(named: "sunny")
                }
                if self.weatherData[0].weather[0].main == "Thunderstorms" {
                    self.backgroundImage.image = UIImage(named: "storm")
                }
            }
        }
        task.resume()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

