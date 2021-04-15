//
//  ViewController.swift
//  DZ12_2_2
//
//  Created by Дмитрий Зубарев on 13.04.2021.
//

import UIKit

class ViewController: UIViewController {
    var road: UIImageView!
    var road2: UIImageView!
    var car: UIImageView!
    var leftButton: UIButton!
    var rightButton: UIButton!
    var x: Int!
    var light: UIImageView!
    var znak: UIImageView!
    var fireCar: UIImageView!
    var redCar: UIImageView!
    var xRedCar: Int!
    var xBlackCar = 50
    var blackCar: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        road = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        let roadImage = UIImage(named: "дорога")
        road.image = roadImage
        view.addSubview(road)
        road2 = UIImageView(frame: CGRect(x: 0, y: -UIScreen.main.bounds.height + 10, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        let roadImage2 = UIImage(named: "дорога")
        road2.image = roadImage2
        view.addSubview(road2)
        goRoad()
        carPosition()
        
        leftButton = UIButton(frame: CGRect(x: 50, y: Int(UIScreen.main.bounds.height) - 100, width: 100, height: 50))
        leftButton.setTitle("<<<<", for: UIControl.State.normal)
        leftButton.backgroundColor = .black
        leftButton.layer.cornerRadius = 25
        view.addSubview(leftButton)
        
        rightButton = UIButton(frame: CGRect(x: Int(UIScreen.main.bounds.width) - 150, y: Int(UIScreen.main.bounds.height) - 100, width: 100, height: 50))
        rightButton.setTitle(">>>>", for: UIControl.State.normal)
        rightButton.backgroundColor = .black
        rightButton.layer.cornerRadius = 25
        view.addSubview(rightButton)
        
        leftButton.addTarget(self, action: #selector(leftButtonAction), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector(rightButtonAction), for: .touchUpInside)
        
        light = UIImageView(frame: CGRect(x: 5, y: -170, width: 102, height: 169))
        let lightView = UIImage(named: "light")
        light.image = lightView
        view.addSubview(light)
        
        UIView.animate(withDuration: 2, delay: 2, options: .repeat) {
            self.light.frame = CGRect(x: 5, y: UIScreen.main.bounds.height + 170, width: 102, height: 169)
        }
        
        znak = UIImageView(frame: CGRect(x: Int(UIScreen.main.bounds.width) - 35, y: -111, width: 46, height: 110))
        let znakView = UIImage(named: "znak")
        znak.image = znakView
        view.addSubview(znak)
        
        UIView.animate(withDuration: 2, delay: 3, options: .repeat) {
            self.znak.frame = CGRect(x: Int(UIScreen.main.bounds.width) - 35, y: Int(UIScreen.main.bounds.height) + 111, width: 46, height: 110)
        }
        

        let repeatCar = Timer.scheduledTimer(withTimeInterval: TimeInterval(Int.random(in: 5...15)), repeats: true) { (_) in
            self.fireCar = UIImageView(frame: CGRect(x: Int(UIScreen.main.bounds.width) - 140, y: -202, width: 140, height: 202))
            let fireCarView = UIImage(named: "fireCar")
            self.fireCar.image = fireCarView
            self.view.addSubview(self.fireCar)
        UIView.animate(withDuration: 2, delay: 42.5) {
            self.fireCar.frame = CGRect(x: Int(UIScreen.main.bounds.width) - 140, y: Int(UIScreen.main.bounds.height), width: 140, height: 202)
            }
        }
        repeatCar.fire()
        
        
        let readCarAppearTimer = Timer.scheduledTimer(withTimeInterval: TimeInterval(Int.random(in: 2...5)+3), repeats: true) { (_) in
            self.xRedCar = Int.random(in: 50...Int(UIScreen.main.bounds.width) - 127)
            while self.xBlackCar > self.xRedCar + 80 || self.xBlackCar < self.xRedCar - 80 {
            self.xBlackCar = Int.random(in: 50...Int(UIScreen.main.bounds.width) - 127)
            }
            self.redCar = UIImageView(frame: CGRect(x: self.xRedCar, y: -200, width: 77, height: 200))
            let redCarView = UIImage(named: "redCar")
            self.redCar.image = redCarView
            self.view.addSubview(self.redCar)
            UIView.animate(withDuration: TimeInterval(Int.random(in: 2...5)), delay: 3, options: []) {
                self.redCar.frame = CGRect(x: self.xRedCar, y: Int(UIScreen.main.bounds.height) + 200, width: 77, height: 200)
            }
        }
        readCarAppearTimer.fire()
        
        let blackCarAppearTimer = Timer.scheduledTimer(withTimeInterval: TimeInterval(Int.random(in: 5...8)), repeats: true) { (_) in
            self.blackCar = UIImageView(frame: CGRect(x: self.xBlackCar, y: -200, width: 77, height: 200))
            let blackCarView = UIImage(named: "blackCar")
            self.blackCar.image = blackCarView
            self.view.addSubview(self.blackCar)
            UIView.animate(withDuration: TimeInterval(Int.random(in: 2...5)), delay: 3, options: []) {
                self.blackCar.frame = CGRect(x: self.xBlackCar, y: Int(UIScreen.main.bounds.height) + 200, width: 77, height: 200)
            }
        }
        blackCarAppearTimer.fire()
        
        
        
        
        
        
        
        
        
        
        
}
    @objc func leftButtonAction() {
        x = x - 60
        if x < 20 {
            x = Int(UIScreen.main.bounds.width)/2 - 40
            return
        }
        UIView.animate(withDuration: 0.5) {
            self.car.frame = CGRect(x: self.x, y: Int(UIScreen.main.bounds.height) - 350, width: 80, height: 200)
        }
    }
    @objc func rightButtonAction() {
        x = x + 60
        if x > Int(UIScreen.main.bounds.width) - 80 {
            x = Int(UIScreen.main.bounds.width)/2 - 40
            return
        }
        UIView.animate(withDuration: 0.5) {
            self.car.frame = CGRect(x: self.x, y: Int(UIScreen.main.bounds.height) - 350, width: 80, height: 200)
        }
    }
    
    
    func carPosition() {
        x = Int(UIScreen.main.bounds.width)/2 - 40
        car = UIImageView(frame: CGRect(x: x, y: Int(UIScreen.main.bounds.height) - 350, width: 80, height: 200))
        let carView = UIImage(named: "car")
        car.image = carView
        view.addSubview(car)
    }
    
    
    func goRoad() {
        UIView.animate(withDuration: 1, delay: 2, options: [.repeat, .curveLinear]){
            self.road.frame = CGRect(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        } completion: { (_) in

        }
        UIView.animate(withDuration: 1, delay: 2, options: [.repeat, .curveLinear] ){
            self.road2.frame = CGRect(x: 0, y: 10, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        } completion: { (_) in
            
        }
    }
    
}
