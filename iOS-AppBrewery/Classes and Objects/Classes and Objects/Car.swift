//
//  Car.swift
//  Classes and Objects
//
//  Created by Weijie Lin on 11/25/18.
//  Copyright © 2018 Weijie Lin. All rights reserved.
//

import Foundation

enum CarType {
    case Sedan
    case Coupe
    case Hatchback
}

class Car {
    
    var colour = "Black"
    var numberOfSeats = 5
    var typeOfCar: CarType = .Coupe
    
    init() {
        
    }
    
    convenience init(customerChosenColour: String){
        self.init()
        colour = customerChosenColour
    }
    
}
