//
//  ContentView.swift
//  car EW
//
//  Created by Hopes, William (AMM) on 17/01/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var starterCars = StarterCars()
    @State private var selectedCar: Int = 0
    @State private var exhaustPackage = false
    @State private var tyresPackage = false
    @State private var gearsPackage = false
    @State private var fullPackage = false
    @State private var remainingFunds = 1000
    
    var exhaustPackageEnabled: Bool {
        if remainingFunds >= 500 {
            return true
        } else {
            return false
        }
    }
    var tyresPackageEnabled: Bool {
        if remainingFunds >= 500 {
            return true
        } else {
            return false
        }
    }
    var gearsPackageEnabled: Bool {
        if remainingFunds >= 1000 {
            return true
        } else {
            return false
        }
    }
    var fullPackageEnabled: Bool {
        if remainingFunds >= 1500 {
            return true
        } else {
            return false
        }
    }
    
    var body: some View {
        let exhaustPackageBinding = Binding<Bool> (
            get: { self.exhaustPackage },
            set: { newValue in
                self.exhaustPackage = newValue
                if newValue == true {
                    remainingFunds -= 500
                    starterCars.cars[selectedCar].topSpeed += 5
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 5
                    remainingFunds += 500
                }
            }
        )
        
        let tyresPackageBinding = Binding<Bool> (
            get: { self.tyresPackage },
            set: { newValue in
                self.tyresPackage = newValue
                if newValue == true {
                    remainingFunds -= 500
                    starterCars.cars[selectedCar].handling += 2
                } else {
                    starterCars.cars[selectedCar].handling -= 2
                    remainingFunds += 500
                }
            }
        )
        
        let gearsPackageBinding = Binding<Bool> (
                    get: { self.gearsPackage },
                    set: { newValue in
                        self.gearsPackage = newValue
                        if newValue == true {
                            remainingFunds -= 1000
                            starterCars.cars[selectedCar].acceleration -= 0.5
                        } else {
                            starterCars.cars[selectedCar].acceleration += 0.5
                            remainingFunds += 1000
                        }
                    }
                )
        
        let fullPackageBinding = Binding<Bool> (
                    get: { self.fullPackage },
                    set: { newValue in
                        self.fullPackage = newValue
                        if newValue == true {
                            starterCars.cars[selectedCar].topSpeed += 5
                            starterCars.cars[selectedCar].handling += 2
                            starterCars.cars[selectedCar].acceleration -= 0.5
                            remainingFunds -= 1500
                        } else {
                            starterCars.cars[selectedCar].topSpeed -= 5
                            starterCars.cars[selectedCar].handling -= 2
                            starterCars.cars[selectedCar].acceleration += 0.5
                            remainingFunds += 1500
                        }
                    }
                )
        
        VStack {
            Form {
                VStack(alignment: .leading, spacing: 20) {
                    Text("\(starterCars.cars[selectedCar].displayStats())")
                    Button("Next Car", action: {
                        resetDisplay()
                        if selectedCar == (starterCars.cars.count - 1) {
                            selectedCar = 0
                        }
                        else {
                            selectedCar += 1
                        }
                    })
                }
                Section {
                    Toggle("Exhaust Package (Cost: 500)", isOn: exhaustPackageBinding)
                        .disabled(!exhaustPackageEnabled)
                    Toggle("Tyres Package (Cost: 500)", isOn: tyresPackageBinding)
                        .disabled(!tyresPackageEnabled)
                    Toggle("Gears Package (Cost: 1000)", isOn: gearsPackageBinding)
                        .disabled(!gearsPackageEnabled)
                    Toggle("Full package (Cost: 1500)", isOn: fullPackageBinding)
                        .disabled(!fullPackageEnabled)
                }
            }
            Text("Remining Funds: \(remainingFunds)")
                .foregroundColor(.red)
                .baselineOffset(20)
        }
    }
    func resetDisplay() {
        let cars = StarterCars()
        if exhaustPackage == true {
            exhaustPackage = false
            remainingFunds += 500
        }
        if tyresPackage == true {
            tyresPackage = false
            remainingFunds += 500
        }
        if gearsPackage == true {
            gearsPackage = false
            remainingFunds += 1000
        }
        if fullPackage == true {
            fullPackage = false
            remainingFunds += 1500
        }
        starterCars.cars[selectedCar] = cars.cars[selectedCar]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
