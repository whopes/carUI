//
//  car_EWTests.swift
//  car EWTests
//
//  Created by Hopes, William (AMM) on 17/01/2023.
//

import XCTest

class car_EWTests: XCTestCase {

    func testNewCarGivesMeACarWithAllAttributesSet() {
        //arrange
        //act
        let car = Car(make: "Audi", model: "R-8", topSpeed: 125, acceleration: 7.7, handling: 5)
        //assert
        XCTAssertEqual(car.make, "Audi")
        XCTAssertEqual(car.model, "R-8")
        XCTAssertEqual(car.topSpeed, 125)
        XCTAssertEqual(car.acceleration, 7.7)
        XCTAssertEqual(car.handling, 5)
        
    }
    
    func carDisplaysStats() {
        
    }

}
