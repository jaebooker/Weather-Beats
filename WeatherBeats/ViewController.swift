//
//  ViewController.swift
//  WeatherBeats
//
//  Created by Jaeson Booker on 8/2/19.
//  Copyright © 2019 Jaeson Booker. All rights reserved.
//

import UIKit
import CoreLocation
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var backgroundImage: UIImageView!
    var backgroundMusicPlayer = AVAudioPlayer()
    var musicForMood = ""
    var weatherData: [Weather] = []
    var apiKey: String = ""
    var lat: Double = 0
    var longi: Double = 0
    var locationManager = CLLocationManager()
    @IBAction func happyButtonPressed(_ sender: Any) {
        checkHappy()
    }
    @IBAction func sadButtonPressed(_ sender: Any) {
        checkSad()
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
                if self.weatherData[0].weather[0].main == "Clear" {
                    self.backgroundImage.image = UIImage(named: "sunny")
                }
                if self.weatherData[0].weather[0].main == "Thunderstorms" {
                    self.backgroundImage.image = UIImage(named: "storm")
                }
                if self.weatherData[0].weather[0].main == "Snow" {
                    self.backgroundImage.image = UIImage(named: "blizzard")
                }
            }
        }
        task.resume()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func checkSad(){
        if self.weatherData[0].weather[0].main == "Rain" {
            musicForMood = Bundle.main.path(forResource: "sadRain", ofType: "mp3")!
            do {
                backgroundMusicPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: musicForMood))
            }
            catch {
                print(error)
            }
            backgroundMusicPlayer.play()
        }
        if self.weatherData[0].weather[0].main == "Clouds" {
            musicForMood = Bundle.main.path(forResource: "sadClouds", ofType: "mp3")!
            do {
                backgroundMusicPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: musicForMood))
            }
            catch {
                print(error)
            }
            backgroundMusicPlayer.play()
        }
        if self.weatherData[0].weather[0].main == "Thunderstorms" {
            musicForMood = Bundle.main.path(forResource: "sadThunder", ofType: "mp3")!
            do {
                backgroundMusicPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: musicForMood))
            }
            catch {
                print(error)
            }
            backgroundMusicPlayer.play()
        }
        if self.weatherData[0].weather[0].main == "Clear" {
            musicForMood = Bundle.main.path(forResource: "sadSun", ofType: "mp3")!
            do {
                backgroundMusicPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: musicForMood))
            }
            catch {
                print(error)
            }
            backgroundMusicPlayer.play()
        }
        if self.weatherData[0].weather[0].main == "Snow" {
            musicForMood = Bundle.main.path(forResource: "sadSnow", ofType: "mp3")!
            do {
                backgroundMusicPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: musicForMood))
            }
            catch {
                print(error)
            }
            backgroundMusicPlayer.play()
        }
    }
    func checkHappy(){
        if self.weatherData[0].weather[0].main == "Rain" {
            musicForMood = Bundle.main.path(forResource: "happyRain", ofType: "mp3")!
            do {
                backgroundMusicPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: musicForMood))
            }
            catch {
                print(error)
            }
            backgroundMusicPlayer.play()
        }
        if self.weatherData[0].weather[0].main == "Clouds" {
            musicForMood = Bundle.main.path(forResource: "happyClouds", ofType: "mp3")!
            do {
                backgroundMusicPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: musicForMood))
            }
            catch {
                print(error)
            }
            backgroundMusicPlayer.play()
        }
        if self.weatherData[0].weather[0].main == "Thunderstorms" {
            musicForMood = Bundle.main.path(forResource: "happyThunder", ofType: "mp3")!
            do {
                backgroundMusicPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: musicForMood))
            }
            catch {
                print(error)
            }
            backgroundMusicPlayer.play()
        }
        if self.weatherData[0].weather[0].main == "Clear" {
            musicForMood = Bundle.main.path(forResource: "happySun", ofType: "mp3")!
            do {
                backgroundMusicPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: musicForMood))
            }
            catch {
                print(error)
            }
            backgroundMusicPlayer.play()
        }
        if self.weatherData[0].weather[0].main == "Snow" {
            musicForMood = Bundle.main.path(forResource: "happySnow", ofType: "mp3")!
            do {
                backgroundMusicPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: musicForMood))
            }
            catch {
                print(error)
            }
            backgroundMusicPlayer.play()
        }
    }
}

