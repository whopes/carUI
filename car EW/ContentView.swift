//
//  ContentView.swift
//  car EW
//
//  Created by Hopes, William (AMM) on 17/01/2023.
//

import SwiftUI

struct ContentView: View {
    let car = Car(make: "Audi", model: "R-8", topSpeed: 125, acceleration: 7.7, handling: 5)
    
    var body: some View {
        Text("Car make: \(car.make)")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
