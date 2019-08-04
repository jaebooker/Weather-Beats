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
    var apiKey: Int = 0
    var lat: Double = 0
    var longi: Double = 0
    var locationManager = CLLocationManager()
    @IBAction func happyButtonPressed(_ sender: Any) {
    }
    @IBAction func sadButtonPressed(_ sender: Any) {
    }
    override func viewWillAppear(_ animated: Bool) {
        if locationManager.location?.coordinate != nil {
            lat = (locationManager.location?.coordinate.latitude)!
            longi = (locationManager.location?.coordinate.longitude)!
            print(lat)
            print(longi)
        }
        guard let url = URL(string: "api.openweathermap.org/data/2.5/weather?lat=" + String(lat) + "&lon=" + String(longi) + "&APPID=" + String(apiKey)) else { return }
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            do {
                let apiEvents = try JSONDecoder().decode(Weather.self, from: data)
                print(apiEvents)
            } catch { }
        }
        task.resume()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

